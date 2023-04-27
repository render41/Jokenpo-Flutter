import 'package:flutter/material.dart';

class BaseCards extends StatefulWidget {
  const BaseCards({
    super.key,
    required this.width,
    required this.height,
    required this.image,
  });

  final double width;
  final double height;
  final Image image;

  @override
  State<BaseCards> createState() => _BaseCardsState();
}

class _BaseCardsState extends State<BaseCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(16)),
      child: Center(child: widget.image),
    );
  }
}
