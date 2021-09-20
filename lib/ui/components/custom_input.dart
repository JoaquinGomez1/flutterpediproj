import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController inputController;
  final String placeholder;
  final IconData? prefixIcon;
  final void Function(String text)? onChanged;
  bool hideText;

  final myFocusNode = FocusNode();

  CustomTextField({
    Key? key,
    required this.inputController,
    required this.placeholder,
    this.onChanged,
    this.prefixIcon,
    this.hideText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: hideText,
      controller: inputController,
      focusNode: myFocusNode,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: placeholder,
        labelStyle: TextStyle(
          color: myFocusNode.hasFocus
              ? Theme.of(context).primaryColor
              : Colors.black45,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: myFocusNode.hasFocus
              ? Theme.of(context).primaryColor
              : Colors.black26,
        ),
        suffixIcon: inputController.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  inputController.clear();
                },
              ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black45),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      textInputAction: TextInputAction.done,
    );
  }
}
