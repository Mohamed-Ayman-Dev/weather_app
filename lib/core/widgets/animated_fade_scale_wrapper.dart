import 'package:flutter/material.dart';

class AnimatedFadeScaleWrapper extends StatefulWidget {
  const AnimatedFadeScaleWrapper({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 450),
  });

  final Widget child;
  final Duration duration;

  @override
  State<AnimatedFadeScaleWrapper> createState() =>
      _AnimatedFadeScaleWrapperState();
}

class _AnimatedFadeScaleWrapperState extends State<AnimatedFadeScaleWrapper> {
  double _scale = 0.9;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _scale = 1.0;
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOut,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOutCubic,
        child: widget.child,
      ),
    );
  }
}
