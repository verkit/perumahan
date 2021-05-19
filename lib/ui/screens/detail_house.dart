import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perumahan/core/controllers/house.dart';
import 'package:perumahan/core/models/swath.dart';
import 'package:perumahan/ui/styles/text.dart';
import 'package:perumahan/ui/widgets/line.dart';

class DetailHousePage extends StatefulWidget {
  const DetailHousePage({Key key}) : super(key: key);
  @override
  _DetailHousePageState createState() => _DetailHousePageState();
}

class _DetailHousePageState extends State<DetailHousePage> {
  @override
  Widget build(BuildContext context) {
    final HouseController houseController = Get.put(HouseController());
    SwathModel swath = Get.arguments;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    aspectRatio: 3 / 2,
                    onPageChanged: (index, reason) {
                      houseController.slideImage(index);
                    },
                  ),
                  items: swath.detail.image
                      .map(
                        (item) => Container(
                          child: ExtendedImage.network(
                            item,
                            cache: true,
                            width: size.width,
                            fit: BoxFit.cover,
                            loadStateChanged: (ExtendedImageState state) {
                              switch (state.extendedImageLoadState) {
                                case LoadState.loading:
                                  return Center(child: CircularProgressIndicator());
                                  break;
                                case LoadState.completed:
                                  return ExtendedRawImage(
                                    image: state.extendedImageInfo?.image,
                                  );
                                  break;
                                case LoadState.failed:
                                  return GestureDetector(
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: <Widget>[
                                        Positioned(
                                          bottom: 0.0,
                                          left: 0.0,
                                          right: 0.0,
                                          child: Text(
                                            "load image failed, click to reload",
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      state.reLoadImage();
                                    },
                                  );
                                  break;
                                default:
                                  return null;
                              }
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: swath.detail.image.map((url) {
                      int index = swath.detail.image.indexOf(url);
                      return GetBuilder<HouseController>(
                        builder: (_) => Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _.indexImage == index ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.1),
                    ),
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    !swath.soldout ? "TERSEDIA" : "TERJUAL",
                    style: MyTextStyle.statusHouse(swath.soldout),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Rumah ${swath.number}",
                    style: MyTextStyle.titleHouse,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            swath.detail.facilities.bedroom != null
                                ? Container(
                                    margin: EdgeInsets.only(right: 16),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.single_bed, size: 32),
                                            SizedBox(width: 4),
                                            Text(swath.detail.facilities.bedroom.toString(),
                                                style: MyTextStyle.smallCaption),
                                          ],
                                        ),
                                        Text(
                                          'Bedrooms',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                            swath.detail.facilities.bathroom != null
                                ? Container(
                                    margin: EdgeInsets.only(right: 16),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.bathtub_outlined, size: 32),
                                            SizedBox(width: 4),
                                            Text(
                                              swath.detail.facilities.bathroom.toString(),
                                              style: MyTextStyle.smallCaption,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Bathrooms',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(12, 48)),
                            foregroundColor: MaterialStateProperty.all(Colors.black),
                            backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Get.dialog(ImageDialog(image: swath.detail.floorplan), arguments: swath);
                          },
                          icon: Icon(Icons.map_outlined),
                          label: Text('Floorplan'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  GetBuilder<HouseController>(
                    builder: (_) => Text(
                      swath.detail.description,
                      style: MyTextStyle.description,
                      maxLines: _.showMore ? null : 5,
                    ),
                  ),
                  SizedBox(height: 4),
                  GetBuilder<HouseController>(
                    builder: (_) => GestureDetector(
                      onTap: () {
                        houseController.showLongText();
                      },
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          _.showMore ? 'Show less' : 'Show more',
                          textAlign: TextAlign.start,
                          style: MyTextStyle.readmore,
                        ),
                      ),
                    ),
                  ),
                  Line()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  final image;
  const ImageDialog({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: ExtendedImage.network(
              image,
              fit: BoxFit.contain,
              //enableLoadState: false,
              mode: ExtendedImageMode.gesture,
              initGestureConfigHandler: (state) {
                return GestureConfig(
                  minScale: 0.9,
                  animationMinScale: 0.7,
                  maxScale: 3.0,
                  animationMaxScale: 3.5,
                  speed: 1.0,
                  inertialSpeed: 100.0,
                  initialScale: 1.0,
                  inPageView: false,
                  initialAlignment: InitialAlignment.center,
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.1),
            ),
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.close),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
