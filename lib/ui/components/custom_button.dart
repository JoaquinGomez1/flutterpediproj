import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButton extends StatefulWidget {
  final Function() onPressed;
  final String? actionName;
  final FaIcon? prefixIcon;
  final Color? backgroundColor;

  const CustomButton({
    Key? key,
    required this.onPressed,
    this.prefixIcon,
    this.actionName,
    this.backgroundColor,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: widget.backgroundColor == null
            ? Theme.of(context).primaryColor
            : widget.backgroundColor,
        minimumSize: Size(double.infinity, 35.0),
        padding: EdgeInsets.symmetric(vertical: 10.0),
      ),
      onPressed: widget.onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.prefixIcon != null ? widget.prefixIcon! : Container(),
          SizedBox(width: widget.prefixIcon != null ? 8.0 : 0),
          Text(
            widget.actionName == null ? 'Button' : widget.actionName!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
