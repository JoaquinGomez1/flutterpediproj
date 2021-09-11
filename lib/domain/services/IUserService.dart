import 'package:firebase_auth/firebase_auth.dart';
import 'package:pediprojflutter/domain/models/response_message_model.dart';
import 'package:pediprojflutter/domain/models/user_model.dart';

abstract class IUserService {
  Future<ResponseMessageModel<UserModel?>> login(String email, String password);
  Future<ResponseMessageModel<UserModel?>> register(
      String email, String password);
  Future<ResponseMessageModel> signOut();

  User? getCurrentUser();

  UserModel? getCurrentFirebaseUserAsUserModel();
  bool isLoggedIn();
}
