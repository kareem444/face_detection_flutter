import 'dart:io';
import 'package:face_recongantion/v2/models/user_model.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

class ExcelHelper {
  static createExcelSheet(List users) async {
    final Workbook workbook = Workbook();

    final Worksheet sheet = workbook.worksheets[0];

    Style globalStyle = workbook.styles.add('style');

    globalStyle.bold = true;
    globalStyle.wrapText = true;
    globalStyle.hAlign = HAlignType.center;

    sheet.getRangeByName('A1').cellStyle = globalStyle;
    sheet.getRangeByName('B1').cellStyle = globalStyle;
    sheet.getRangeByName('C1').cellStyle = globalStyle;

    sheet.getRangeByName('A1').setText('Id');
    sheet.getRangeByName('B1').setText('Name');
    sheet.getRangeByName('C1').setText('Code');

    if (users.isNotEmpty) {
      globalStyle = workbook.styles.add('style2');
      globalStyle.wrapText = true;
      globalStyle.hAlign = HAlignType.center;
      globalStyle.vAlign = VAlignType.center;

      for (var i = 1; i <= users.length; i++) {
        UserModel userModel = UserModel.fromMap(users[i - 1]);

        sheet.getRangeByName('A${i + 1}').cellStyle = globalStyle;
        sheet.getRangeByName('B${i + 1}').cellStyle = globalStyle;
        sheet.getRangeByName('C${i + 1}').cellStyle = globalStyle;

        sheet.getRangeByName('A${i + 1}').setText(userModel.id.toString());
        sheet.getRangeByName('B${i + 1}').setText(userModel.name);
        sheet.getRangeByName('C${i + 1}').setText(userModel.code);

        sheet.autoFitRow(1 + i);
      }
    }

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    String appPath = (await getApplicationDocumentsDirectory()).path;
    await File(appPath + '/studentSheet.xlsx').writeAsBytes(bytes, flush: true);

    OpenFile.open(appPath + '/studentSheet.xlsx');
  }
}
