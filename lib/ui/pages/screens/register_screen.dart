import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pediprojflutter/constants/Constants.dart';
import 'package:pediprojflutter/domain/models/response_message_model.dart';
import 'package:pediprojflutter/services/user_service.dart';
import 'package:pediprojflutter/ui/components/custom_button.dart';
import 'package:pediprojflutter/ui/components/custom_input.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  Future signUpUser(String email, String password) async {
    ResponseMessageModel<User?> user =
        await Provider.of<UserService>(context, listen: false)
            .register(email, password);

    if (user.data != null) Navigator.of(context).pushReplacementNamed("/");
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
              height: MediaQuery.of(context).size.height / 4,
              child: Center(
                child: Text(
                  "Sign Up",
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
                      SizedBox(height: 18.0),
                      CustomTextField(
                        inputController: _passwordConfirmController,
                        prefixIcon: Icons.lock,
                        placeholder: "Confirm Password",
                        hideText: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButton(
                    onPressed: () {
                      signUpUser(
                          _usernameController.text, _passwordController.text);
                    },
                    actionName: "Sign Up"),
                SizedBox(height: 8.0),
                CustomButton(
                  onPressed: () {},
                  actionName: "Sign Up with Google",
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
      ..lineTo(0, size.height / 1.5)
      ..quadraticBezierTo(
          size.width / 3.8, size.height, size.width, size.height / 1.5)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
