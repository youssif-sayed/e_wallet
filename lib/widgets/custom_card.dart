import 'package:flutter/material.dart';


class CustomCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color backgroundColor;
  final EdgeInsets? padding;
   final grad ;
   CustomCard({
    Key? key,
    required this.child,
    this.padding,
     required this.grad,
    this.borderRadius = 15,
    required this.backgroundColor ,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: padding ?? const EdgeInsets.all(16),
        decoration: BoxDecoration(
            gradient: grad ? LinearGradient(colors: [Color(0xff7F7FD5),Color(0xff86A8E7),Color(0xff91EAE4)]) : null,
          borderRadius: BorderRadius.circular(borderRadius),
          color:  backgroundColor,
        ),
        child: child,
      ),
    );
  }
}
