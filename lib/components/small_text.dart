import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final TextOverflow overflow;
  const SmallText({
    super.key,this.size = 18,
    required this.text,
    this.color = const Color(0xFFACACAC),
    this.overflow=TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
          color: color,
          fontSize: size ,
          fontWeight: FontWeight.w400,
          fontFamily: 'BalsamiqSans'
      ),
    );
  }
}
