import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pediprojflutter/domain/models/response_message_model.dart';
import 'package:pediprojflutter/domain/models/user_model.dart';
import 'package:pediprojflutter/domain/services/IUserService.dart';

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
      response.addInternalError("Something went wrong");
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

  Future signInWithGoogle() async {
    //  TODO: Authenticate with google
    // GoogleAuthProvider _google = GoogleAuthProvider();
    // FirebaseAuth.instance.signInWithPopup(_google);
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
