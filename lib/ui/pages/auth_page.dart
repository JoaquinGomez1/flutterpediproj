// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pediprojflutter/ui/pages/screens/login_screen.dart';
import 'package:pediprojflutter/ui/pages/screens/register_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [LoginScreen(), RegisterScreen()];
  final PageController _pageController = PageController();

  void _setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _setSelectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: "Login",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_front_outlined),
            label: "Sign up",
          ),
        ],
      ),
      body: PageView(
        children: _screens,
        onPageChanged: _setSelectedIndex,
        controller: _pageController,
      ),
    );
  }
}
