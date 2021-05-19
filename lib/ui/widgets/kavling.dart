import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class KavlingWidget extends StatefulWidget {
  KavlingWidget(
      {this.scale = 1,
      this.value,
      this.groupKavling,
      this.pointkus,
      this.onChanged,
      this.onTapDown,
      this.onTapUp,
      this.onTap,
      this.primaryColor,
      this.secondaryColor,
      this.accentColor,
      this.x,
      this.y,
      this.width,
      this.height,
      this.shapes});
  final double scale;
  final int value;
  final int groupKavling;
  final Function() onTap;
  final Function(dynamic) onTapDown;
  final Function(dynamic) onTapUp;
  final Function(int) onChanged;
  final List<Offset> pointkus;
  final double x;
  final double y;
  final double width;
  final double height;
  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;
  final String shapes;
  @override
  _KavlingWidgetState createState() => _KavlingWidgetState();
}

class _KavlingWidgetState extends State<KavlingWidget> {
  var status = 0;
  Color _color;
  @override
  Widget build(BuildContext context) {
    if (status == 0) {
      _color = widget.primaryColor;
    }
    if (widget.groupKavling != widget.value) {
      _color = widget.primaryColor;
      status = 0;
    }
    return Container(
      margin: EdgeInsets.only(top: widget.y * widget.scale, left: widget.x * widget.scale),
      height: widget.height * widget.scale,
      width: widget.width * widget.scale,
      child: GestureDetector(
        onTapDown: widget.onTapDown != null ? widget.onTapDown : null,
        onTapUp: widget.onTapUp != null ? widget.onTapUp : null,
        onTap: () async {
          if (widget.groupKavling != widget.value) {
            if (widget.onChanged != null) {
              widget.onChanged(widget.value);
              status = 1;
              _color = widget.secondaryColor;
              setState(() {});
            }
          } else {
            if (status == 0) {
              status = 1;
              _color = widget.secondaryColor;
            } else if (status == 1) {
              status = 0;
              _color = widget.primaryColor;
            }
            setState(() {});
          }
          if (widget.onTap != null) {
            widget.onTap();
          }
        },
        child: Material(
          shape: Kavling(context),
        ),
      ),
    );
  }

  ShapeBorder Kavling(BuildContext context) {
    if (widget.shapes == 'rect') {
      return KavlingShape(
          scales: widget.scale,
          x: widget.x,
          y: widget.y,
          width: widget.width,
          height: widget.height,
          shapes: widget.shapes,
          color: _color);
    } else if (widget.shapes == 'polygon') {
      return KavlingShape(
          scales: widget.scale,
          x: widget.x,
          y: widget.y,
          pointkus: widget.pointkus,
          shapes: 'polygon',
          width: widget.width,
          height: widget.height,
          color: _color);
    }
  }
}

class KavlingShape extends ShapeBorder {
  KavlingShape({this.scales = 1, this.pointkus, this.x, this.y, this.width, this.height, this.shapes, this.color});
  final List<Offset> pointkus;
  final double x;
  final double y;
  final double width;
  final double height;
  final String shapes;
  final Color color;
  final double scales;

  double _scaleX = 1052 / 1578;
  double _scaleY = 744 / 1116;

  @override
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {ui.TextDirection textDirection}) => null;

  @override
  void paint(Canvas canvas, Rect rect, {ui.TextDirection textDirection}) {
    if (shapes == 'rect') {
      Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
      paint_0_fill.color = color;
      Rect r = Rect.fromLTWH(rect.left * scales, rect.top * scales, rect.width, rect.height);
      canvas.drawRect(r, paint_0_fill);
    } else if (shapes == 'polygon') {
      Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
      paint_0_fill.color = color;
      Path path = Path();
      List<Offset> offsets = List<Offset>.empty(growable: true);
      for (int i = 0; i < pointkus.length; i++) {
        offsets.add(Offset((pointkus[i].dx - x) * scales, (pointkus[i].dy - y) * scales));
        // print('${offsets[i].dx} ${offsets[i].dy}');
      }
      path.addPolygon(offsets, true);
      canvas.drawPath(path, paint_0_fill);
    }
  }

  @override
  ShapeBorder scale(double t) => null;

  @override
  Path getOuterPath(Rect rect, {ui.TextDirection textDirection}) {
    if (shapes == 'polygon') {
      Path path = Path();
      List<Offset> offsets = List<Offset>.empty(growable: true);
      for (int i = 0; i < pointkus.length; i++) {
        offsets.add(Offset((pointkus[i].dx - x) * scales, (pointkus[i].dy - y) * scales));
      }
      path.addPolygon(offsets, true);
      return path;
    }
  }
}
