import 'package:flutter/cupertino.dart';

class MapObject {
  final Widget child;

  /// This label positioned on center of widget
  final Widget label;

  /// relative offset from the center of the map for this map object. From -1 to 1 in each dimension.
  final Offset offset;

  /// Size of this object for the zoomLevel == 1
  final Size size;

  /// Function of object when clicked
  final Function onTap;

  MapObject({
    @required this.child,
    @required this.label,
    @required this.offset,
    this.size,
    this.onTap,
  });
}
