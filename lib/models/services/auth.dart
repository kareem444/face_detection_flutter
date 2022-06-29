import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase{
  User? get currentUser;
  Stream<User?> authStateChange();

  Future<User?> loginWithEmailAndPassword(String email,String password);
  Future<User?> signUpWithEmailAndPassword(String email,String password);



}
class Auth implements AuthBase{
  final _firebaseauth=FirebaseAuth.instance;
  @override
  Future<User?> loginWithEmailAndPassword(String email,String password) async{
  final user=await  _firebaseauth.signInWithEmailAndPassword(email: email, password: password);
  return user.user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(String email,String password) async {
    final us=await _firebaseauth.createUserWithEmailAndPassword(email: email, password: password);
    return us.user;
  }

  @override
  Stream<User?> authStateChange() => _firebaseauth.authStateChanges();

  @override

  User? get currentUser => _firebaseauth.currentUser;

}