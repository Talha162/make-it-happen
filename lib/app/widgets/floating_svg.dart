import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingSvg extends StatefulWidget {
  const FloatingSvg({
    super.key,
    required this.assetPath,
    required this.height,
    this.floatY = 10,
    this.duration = const Duration(milliseconds: 2400),
  });

  final String assetPath;
  final double height;
  final double floatY;
  final Duration duration;

  @override
  State<FloatingSvg> createState() => _FloatingSvgState();
}

class _FloatingSvgState extends State<FloatingSvg>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..repeat(reverse: true);
    _offset = Tween<double>(
      begin: 0,
      end: -widget.floatY,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offset,
      builder: (context, child) =>
          Transform.translate(offset: Offset(0, _offset.value), child: child),
      child: SvgPicture.asset(
        widget.assetPath,
        height: widget.height,
        fit: BoxFit.contain,
      ),
    );
  }
}
