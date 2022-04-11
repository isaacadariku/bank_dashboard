import 'package:flutter/material.dart';

class OnHover extends StatefulWidget {
  final Widget child;
  const OnHover({Key? key, required this.child}) : super(key: key);

  @override
  _OnHoverState createState() => _OnHoverState();
}

class _OnHoverState extends State<OnHover> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()
      ..translate(8, 0, 0)
      ..scale(0.92, 0.92, 1);
    final transform = _isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) => _isMouseRegion(true),
      onExit: (e) => _isMouseRegion(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        transform: transform,
      ),
    );
  }

  void _isMouseRegion(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
