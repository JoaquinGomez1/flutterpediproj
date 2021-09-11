import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pediprojflutter/constants/Constants.dart';
import 'package:pediprojflutter/domain/models/response_message_model.dart';
import 'package:pediprojflutter/domain/models/user_model.dart';
import 'package:pediprojflutter/services/user_service.dart';
import 'package:pediprojflutter/ui/components/custom_button.dart';
import 'package:pediprojflutter/ui/components/custom_input.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String? emailErrorMessage;
  String? passwordErrorMessage;

  double _getHeaderHeight(BuildContext context) =>
      MediaQuery.of(context).size.height / 4;

  Future signInUser(String email, String password) async {
    try {
      ResponseMessageModel<UserModel?> user =
          await Provider.of<UserService>(context, listen: false)
              .login(email, password);

      if (user.data != null) Navigator.of(context).pushNamed("/");
    } catch (exc) {}
  }

  Future _signInUserWithGoogle() async {
    await Provider.of<UserService>(context, listen: false).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              width: double.infinity,
              color: Colors.red[400],
              height: _getHeaderHeight(context),
              child: Center(
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Constants.paddingHorizontal,
              vertical: Constants.paddingVertical,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 65.0),
                  width: double.infinity,
                  child: Column(
                    children: [
                      CustomTextField(
                        inputController: _usernameController,
                        prefixIcon: Icons.person,
                        placeholder: "Email",
                      ),
                      SizedBox(height: 18.0),
                      CustomTextField(
                        inputController: _passwordController,
                        prefixIcon: Icons.lock,
                        placeholder: "Password",
                        hideText: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  onPressed: () {
                    signInUser(
                        _usernameController.text, _passwordController.text);
                  },
                  actionName: "Login",
                ),
                const SizedBox(height: 8.0),
                CustomButton(
                  onPressed: _signInUserWithGoogle,
                  actionName: "Login with Google",
                  prefixIcon: FaIcon(FontAwesomeIcons.google),
                  backgroundColor: Colors.blue[400],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  MyCustomClipper() {}
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height / 1.8)
      ..quadraticBezierTo(
          size.width / 4, size.height, size.width, size.height / 1.5)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}