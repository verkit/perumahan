import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:measured_size/measured_size.dart';
import 'package:perumahan/core/controllers/zoom.dart';
import 'package:perumahan/ui/widgets/kavling.dart';
import 'package:perumahan/ui/widgets/reset_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ZoomController _controller = Get.put(ZoomController());
  List<Offset> poly1 = List<Offset>.empty(growable: true);
  List<Offset> poly2 = List<Offset>.empty(growable: true);
  int buttonState = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    poly1.add(Offset(39, 43));
    poly1.add(Offset(80, 43));
    poly1.add(Offset(80, 130));
    poly1.add(Offset(8, 130));

    poly2.add(Offset(12, 132));
    poly2.add(Offset(96, 132));
    poly2.add(Offset(96, 224));
    poly2.add(Offset(50, 224));
    poly2.add(Offset(52, 185));
  }

  int _groupKavling = -1;

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   extendBodyBehindAppBar: true,
    //   body: GetBuilder<SwathController>(
    //     init: _swathController,
    //     builder: (ctlr) {
    //       return Container(
    //         margin: EdgeInsets.only(top: AppBar().preferredSize.height),
    //         child: Center(
    //           child: ZoomContainer(
    //             zoomLevel: 1 / 2,
    //             imageProvider: Image.asset("assets/siteplan.png").image,
    //             objects: List.generate((_swathController.swathsModel.length), (i) {
    //               var swath = _swathController.swathsModel[i];
    //               return MapObject(
    //                 label: CircleAvatar(backgroundColor: swath.soldout ? Colors.red : Colors.green),
    //                 child: Container(
    //                   color: Colors.red,
    //                 ),
    //                 onTap: () {
    //                   Get.toNamed('/detail', arguments: swath);
    //                 },
    //                 offset: Offset(
    //                   swath.position.x,
    //                   swath.position.y,
    //                 ),
    //                 size: Size(
    //                   swath.boxsize.width.toDouble(),
    //                   swath.boxsize.height.toDouble(),
    //                 ),
    //               );
    //             }),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ZoomController>(
        init: _controller,
        builder: (_) => Container(
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                InteractiveViewer(
                  child: Stack(
                    children: [
                      MeasuredSize(
                        onChange: (Size size) {
                          _.getSize(size);
                        },
                        child: Image.asset('assets/kavling.png'),
                      ),
                      // KavlingWidget(
                      //   value: 0,
                      //   groupKavling: _groupKavling,
                      //   primaryColor: Colors.green,
                      //   secondaryColor: Colors.green.withOpacity(0.5),
                      //   accentColor: Colors.orange,
                      //   shapes: 'polygon',
                      //   pointkus: poly1,
                      //   x: 8 * size.aspectRatio,
                      //   y: 43 * size.aspectRatio,
                      //   width: 80,
                      //   height: 88,
                      //   onChanged: (value) {
                      //     _groupKavling = value;
                      //     setState(() {});
                      //   },
                      //   onTap: () {},
                      // ),
                      KavlingWidget(
                        value: 1,
                        groupKavling: _groupKavling,
                        x: 145 * MediaQuery.of(context).size.aspectRatio,
                        y: 77 * MediaQuery.of(context).size.aspectRatio,
                        width: 29.5 * _.size.aspectRatio,
                        height: 62 * _.size.aspectRatio,
                        primaryColor: Colors.blue,
                        secondaryColor: Colors.blue.withOpacity(0.5),
                        accentColor: Colors.orange,
                        shapes: 'rect',
                        onChanged: (value) {
                          _groupKavling = value;
                          setState(() {});
                        },
                        onTap: () {},
                      ),
                      // KavlingWidget(
                      //   value: 1,
                      //   groupKavling: _groupKavling,
                      //   x: 125,
                      //   y: 43,
                      //   width: 43,
                      //   height: 88,
                      //   primaryColor: Colors.blue,
                      //   secondaryColor: Colors.blue.withOpacity(0.5),
                      //   accentColor: Colors.orange,
                      //   shapes: 'rect',
                      //   onChanged: (value) {
                      //     _groupKavling = value;
                      //     setState(() {});
                      //   },
                      //   onTap: () {},
                      // ),
                      // KavlingWidget(
                      //   value: 1,
                      //   groupKavling: _groupKavling,
                      //   x: 169,
                      //   y: 43,
                      //   width: 43,
                      //   height: 88,
                      //   primaryColor: Colors.blue,
                      //   secondaryColor: Colors.blue.withOpacity(0.5),
                      //   accentColor: Colors.orange,
                      //   shapes: 'rect',
                      //   onChanged: (value) {
                      //     _groupKavling = value;
                      //     setState(() {});
                      //   },
                      //   onTap: () {},
                      // ),
                      // KavlingWidget(
                      //   value: 1,
                      //   groupKavling: _groupKavling,
                      //   x: 213,
                      //   y: 43,
                      //   width: 43,
                      //   height: 88,
                      //   primaryColor: Colors.blue,
                      //   secondaryColor: Colors.blue.withOpacity(0.5),
                      //   accentColor: Colors.orange,
                      //   shapes: 'rect',
                      //   onChanged: (value) {
                      //     _groupKavling = value;
                      //     setState(() {});
                      //   },
                      //   onTap: () {},
                      // ),
                      // KavlingWidget(
                      //   value: 1,
                      //   groupKavling: _groupKavling,
                      //   x: 256,
                      //   y: 43,
                      //   width: 43,
                      //   height: 88,
                      //   primaryColor: Colors.blue,
                      //   secondaryColor: Colors.blue.withOpacity(0.5),
                      //   accentColor: Colors.orange,
                      //   shapes: 'rect',
                      //   onChanged: (value) {
                      //     _groupKavling = value;
                      //     setState(() {});
                      //   },
                      //   onTap: () {},
                      // ),
                      // KavlingWidget(
                      //   value: 1,
                      //   groupKavling: _groupKavling,
                      //   x: 300,
                      //   y: 43,
                      //   width: 48,
                      //   height: 88,
                      //   primaryColor: Colors.blue,
                      //   secondaryColor: Colors.blue.withOpacity(0.5),
                      //   accentColor: Colors.orange,
                      //   shapes: 'rect',
                      //   onChanged: (value) {
                      //     _groupKavling = value;
                      //     setState(() {});
                      //   },
                      //   onTap: () {},
                      // ),
                      // // Baris 2
                      // KavlingWidget(
                      //   value: 0,
                      //   groupKavling: _groupKavling,
                      //   pointkus: poly2,
                      //   primaryColor: Colors.green,
                      //   secondaryColor: Colors.green.withOpacity(0.5),
                      //   accentColor: Colors.orange,
                      //   shapes: 'polygon',
                      //   x: 8,
                      //   y: 132,
                      //   width: 80,
                      //   height: 88,
                      //   onChanged: (value) {
                      //     _groupKavling = value;
                      //     setState(() {});
                      //   },
                      //   onTap: () {},
                      // ),
                      // KavlingWidget(
                      //   value: 1,
                      //   groupKavling: _groupKavling,
                      //   x: 98,
                      //   y: 132,
                      //   width: 36,
                      //   height: 90,
                      //   primaryColor: Colors.blue,
                      //   secondaryColor: Colors.blue.withOpacity(0.5),
                      //   accentColor: Colors.orange,
                      //   shapes: 'rect',
                      //   onChanged: (value) {
                      //     _groupKavling = value;
                      //     setState(() {});
                      //   },
                      //   onTap: () {},
                      // ),
                      // KavlingWidget(
                      //   value: 1,
                      //   groupKavling: _groupKavling,
                      //   x: 138,
                      //   y: 132,
                      //   width: 35,
                      //   height: 90,
                      //   primaryColor: Colors.blue,
                      //   secondaryColor: Colors.blue.withOpacity(0.5),
                      //   accentColor: Colors.orange,
                      //   shapes: 'rect',
                      //   onChanged: (value) {
                      //     _groupKavling = value;
                      //     setState(() {});
                      //   },
                      //   onTap: () {},
                      // ),

                      // KavlingWidget(
                      //   value: 1,
                      //   groupKavling: _groupKavling,
                      //   x: 178,
                      //   y: 132,
                      //   width: 35,
                      //   height: 90,
                      //   primaryColor: Colors.blue,
                      //   secondaryColor: Colors.blue.withOpacity(0.5),
                      //   accentColor: Colors.orange,
                      //   shapes: 'rect',
                      //   onChanged: (value) {
                      //     _groupKavling = value;
                      //     setState(() {});
                      //   },
                      //   onTap: () {},
                      // ),
                      // KavlingWidget(
                      //   value: 1,
                      //   groupKavling: _groupKavling,
                      //   x: 213,
                      //   y: 132,
                      //   width: 43,
                      //   height: 90,
                      //   primaryColor: Colors.blue,
                      //   secondaryColor: Colors.blue.withOpacity(0.5),
                      //   accentColor: Colors.orange,
                      //   shapes: 'rect',
                      //   onChanged: (value) {
                      //     _groupKavling = value;
                      //     setState(() {});
                      //   },
                      //   onTap: () {},
                      // ),
                      // KavlingWidget(
                      //   value: 1,
                      //   groupKavling: _groupKavling,
                      //   x: 256,
                      //   y: 132,
                      //   width: 43,
                      //   height: 90,
                      //   primaryColor: Colors.blue,
                      //   secondaryColor: Colors.blue.withOpacity(0.5),
                      //   accentColor: Colors.orange,
                      //   shapes: 'rect',
                      //   onChanged: (value) {
                      //     _groupKavling = value;
                      //     setState(() {});
                      //   },
                      //   onTap: () {},
                      // ),
                      // KavlingWidget(
                      //   value: 1,
                      //   groupKavling: _groupKavling,
                      //   x: 300,
                      //   y: 132,
                      //   width: 48,
                      //   height: 90,
                      //   primaryColor: Colors.blue,
                      //   secondaryColor: Colors.blue.withOpacity(0.5),
                      //   accentColor: Colors.orange,
                      //   shapes: 'rect',
                      //   onChanged: (value) {
                      //     _groupKavling = value;
                      //     setState(() {});
                      //   },
                      //   onTap: () {},
                      // ),
                    ],
                  ),
                ),
                _.hasTouched ? ResetButtonWidget() : SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
