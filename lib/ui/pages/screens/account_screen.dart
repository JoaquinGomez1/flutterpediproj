import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pediprojflutter/constants/Constants.dart';
import 'package:pediprojflutter/services/user_service.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  _signOut() {
    Provider.of<UserService>(context, listen: false).signOut();
    Navigator.of(context)
        .pushNamed("/auth"); // TODO: Figure out whether to push or pop
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.paddingHorizontal,
          vertical: Constants.paddingVertical,
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Account Screen",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _signOut,
              child: Text("Log out"),
            )
          ],
        ),
      ),
    );
  }
}
