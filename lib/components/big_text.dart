import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final TextOverflow overflow;

  const BigText({
    super.key,this.size = 0,
    required this.text,
    this.color = Colors.black,
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
          fontSize: size==0? MediaQuery.sizeOf(context).height/24.8: (MediaQuery.sizeOf(context).height/24.8)*size/35,
          fontWeight: FontWeight.w400,
          fontFamily: 'BalsamiqSans'
      ),
    );
  }
}
