import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  Rx<User?> firebaseUser = Rx<User?>(null);
  RxBool isRemember = false.obs;
  RxBool isPassword = false.obs;
  RxBool passwordRemember = true.obs;

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      // Maneja los errores aquí
      print(e.message);
      return false;
    }
  }

  Future<bool> signUpWithEmailAndPassword(String email, String password,
      String nombre, String apellidos, String celular) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Guardar información adicional en Realtime Database
      await _saveAdditionalUserInfo(
          userCredential.user!.uid, nombre, apellidos, celular, email);

      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<void> _saveAdditionalUserInfo(String userId, String nombre,
      String apellidos, String celular, String email) async {
    await _database.child('users').child(userId).set({
      'nombre': nombre,
      'apellidos': apellidos,
      'celular': celular,
      'email': email,
    });
  }

  Future<Map<String, dynamic>?> getUserInfo(String userId) async {
    DatabaseEvent event = await _database.child('users').child(userId).once();
    if (event.snapshot.exists && event.snapshot.value is Map) {
      return Map<String, dynamic>.from(event.snapshot.value as Map);
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      print("Error en signOut: $e");
      rethrow;
    }
  }
}
