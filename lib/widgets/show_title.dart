import 'package:flutter/material.dart';

//แสดงชื่อแอพ
class ShowTitle extends StatelessWidget {
  //ตั้งค่าตัวแปร
  final String title;
  final TextStyle textStyle;
  const ShowTitle({
    Key? key,
    required this.title,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle,
    );
  }
}
