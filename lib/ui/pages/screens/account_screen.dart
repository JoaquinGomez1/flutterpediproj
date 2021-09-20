import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pediprojflutter/services/user_service.dart';
import 'package:pediprojflutter/ui/components/custom_button.dart';
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
    UserService userService = Provider.of<UserService>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double headerHeight = screenHeight / 4;
    final double curvedOffset = 30;
    User currentUser = userService.currentUser!;
    bool hasDisplayName = currentUser.displayName != "";

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: headerHeight,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: SafeArea(
              child: Center(
                child: Text(
                  Provider.of<UserService>(context).currentUser?.displayName ??
                      "Your Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
              child: Container(
                color: Colors.white,
                height: screenHeight - headerHeight - curvedOffset,
                width: screenWidth,
                child: Container(
                  height: 150.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Welcome"), Text("17/09/2021")],
                          ),
                        ),
                        SizedBox(height: curvedOffset * 2 + 10),
                        Text(
                          hasDisplayName
                              ? currentUser.displayName ?? ""
                              : currentUser.email!,
                          style:
                              TextStyle(fontSize: hasDisplayName ? 34.0 : 22.0),
                        ),
                        Text("Testing"),
                        Expanded(
                          child: Container(),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: CustomButton(
                            actionName: "Log out",
                            onPressed: _signOut,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          _buildProfileHeader(context, screenWidth, headerHeight, curvedOffset),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(
      BuildContext context, screenWidth, headerHeight, curvedOffset) {
    return Positioned(
      left: screenWidth / 2 - 60,
      top: headerHeight - 90 - curvedOffset,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 8,
              blurRadius: 12,
              offset: Offset(
                0.0,
                2.0,
              ),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          child: Container(
            width: 120,
            height: 185,
            child: Image.network(
              Provider.of<UserService>(context).currentUser?.photoURL ??
                  "https://randomuser.me/api/portraits/men/28.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
