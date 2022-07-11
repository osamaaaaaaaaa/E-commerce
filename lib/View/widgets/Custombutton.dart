import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  String title;
  void Function()? ontap;
  Custombutton({Key? key, required this.title, required this.ontap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: ontap,
      color: Colors.black87,
      child: Container(
        height: 50,
        width: size.width * 0.8,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
