import 'package:flutter/material.dart';

class UnicornOutlineButton extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;
  final double _width;
  final double _height;

  UnicornOutlineButton({
    super.key,
    required double strokeWidth,
    required double radius,
    required double width,
    required double height,
    required Gradient gradient,
    required Widget child,
    required VoidCallback onPressed,
  })  : _painter = _GradientPainter(
            strokeWidth: strokeWidth,
            radius: radius,
            width: width,
            height: height,
            gradient: gradient),
        _child = child,
        _callback = onPressed,
        _radius = radius,
        _width = width,
        _height = height;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(_radius),
          onTap: _callback,
          child: Container(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width * _width,
                minHeight: MediaQuery.of(context).size.height * _height),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double width;
  final double height;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter(
      {required this.strokeWidth,
      required this.radius,
      required this.width,
      required this.height,
      required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
