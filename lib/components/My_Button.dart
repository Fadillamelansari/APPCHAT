import 'package:flutter/material.dart';

 
class DefaultButtonCustomeColor extends StatelessWidget {
  const DefaultButtonCustomeColor({
    Key? key,
    this.text,
    this.color,
    this.press,
  }) : super(key: key);
  final String? text;
  final Color? color;
  final Function? press;
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (56),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: color,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: (18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}