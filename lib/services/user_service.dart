import 'package:firebase_auth/firebase_auth.dart';
import 'package:pediprojflutter/domain/models/response_message_model.dart';
import 'package:pediprojflutter/domain/models/user_model.dart';
import 'package:pediprojflutter/domain/services/IUserService.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserService implements IUserService {
  User? currentUser;

  UserService() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      currentUser = user;
    });
  }

  @override
  bool isLoggedIn() {
    User? _user = getCurrentUser();

    return _user != null;
  }

  @override
  Future<ResponseMessageModel<User?>> login(
      String email, String password) async {
    ResponseMessageModel<User?> response = ResponseMessageModel<User?>();
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      currentUser = credential.user;
    } catch (exc) {
      response.addInternalError(exc.toString());
    }
    response.data = currentUser;
    return response;
  }

  @override
  Future<ResponseMessageModel<User?>> register(
      String email, String password) async {
    ResponseMessageModel<User?> response = ResponseMessageModel<User?>();

    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      currentUser = credential.user;
    } catch (exc) {
      response.addInternalError("Something went wrong");
    }
    response.data = currentUser;

    return response;
  }

  @override
  Future<ResponseMessageModel<UserModel?>> signOut() async {
    ResponseMessageModel<UserModel?> response =
        ResponseMessageModel<UserModel?>();

    try {
      await FirebaseAuth.instance.signOut();
    } catch (exc) {
      response.addInternalError("Something went wrong when updating the list");
    }

    return response;
  }

  @override
  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  Future<ResponseMessageModel<User?>> signInWithGoogle() async {
    ResponseMessageModel<User?> response = ResponseMessageModel();

    try {
      // https://firebase.flutter.dev/docs/auth/social/
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final googleCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Set the user object in the response as the current user
      currentUser = googleCredential.user;
    } catch (exc) {
      response.addInternalError(exc.toString());
    }

    return response;
  }

  UserModel? getCurrentFirebaseUserAsUserModel() {
    User? curUser = getCurrentUser();
    if (curUser != null) {
      return UserModel(
        imageUrl: curUser.photoURL!,
        email: curUser.email!,
        username: curUser.displayName!,
        uid: curUser.uid,
      );
    }
  }

  UserModel? _mapUserToUserModel(User? user) {
    if (user != null) {
      return UserModel(
          email: user.email!,
          imageUrl: user.photoURL,
          username: user.displayName,
          uid: user.uid);
    }
  }
}
