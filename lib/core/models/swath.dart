import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class SwathModel {
  SwathModel({
    this.uid,
    this.number,
    this.soldout,
    this.position,
    this.boxsize,
    this.detail,
  });

  String uid;
  String number;
  bool soldout;
  Position position;
  Boxsize boxsize;
  Detail detail;

  SwathModel.fromSnapshot(DocumentSnapshot snapshot) {
    uid = snapshot.id;
    number = snapshot["number"];
    soldout = snapshot["soldout"];
    position = Position.fromJson(snapshot["position"]);
    boxsize = Boxsize.fromJson(snapshot["boxsize"]);
    detail = Detail.fromJson(snapshot["detail"]);
  }

  factory SwathModel.fromJson(Map<String, dynamic> json) => SwathModel(
        uid: json["uid"] == null ? null : json["uid"],
        number: json["number"] == null ? null : json["number"],
        soldout: json["soldout"] == null ? null : json["soldout"],
        position: json["position"] == null ? null : Position.fromJson(json["position"]),
        boxsize: json["boxsize"] == null ? null : Boxsize.fromJson(json["boxsize"]),
        detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid == null ? null : uid,
        "number": number == null ? null : number,
        "soldout": soldout == null ? null : soldout,
        "position": position == null ? null : position.toJson(),
        "boxsize": boxsize == null ? null : boxsize.toJson(),
        "detail": detail == null ? null : detail.toJson(),
      };
}

SwathModel swathModelFromJson(String str) => SwathModel.fromJson(json.decode(str));
List<SwathModel> convertSwaths(List swathMap) {
  if (swathMap == null) {
    return null;
  }
  List<SwathModel> swaths = [];
  swathMap.forEach((value) {
    swaths.add(SwathModel.fromJson(value));
  });
  return swaths;
}

String swathModelToJson(SwathModel data) => json.encode(data.toJson());
List<Map<String, dynamic>> swathList(List<SwathModel> swaths) {
  if (swaths == null) {
    return null;
  }
  List<Map<String, dynamic>> swathMap = [];
  swaths.forEach((swath) {
    swathMap.add(swath.toJson());
  });
  return swathMap;
}

class Boxsize {
  Boxsize({
    this.width,
    this.height,
  });

  int width;
  int height;

  factory Boxsize.fromJson(Map<String, dynamic> json) => Boxsize(
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
      );

  Map<String, dynamic> toJson() => {
        "width": width == null ? null : width,
        "height": height == null ? null : height,
      };
}

class Detail {
  Detail({
    this.image,
    this.description,
    this.facilities,
    this.price,
    this.sizeArea,
    this.certificate,
    this.interior,
    this.developer,
    this.floor,
    this.electricity,
    this.parkArea,
    this.yearMade,
    this.idListing,
    this.registeredOn,
    this.floorplan,
    this.housingUid,
  });

  List<String> image;
  String description;
  Facilities facilities;
  int price;
  SizeArea sizeArea;
  String certificate;
  String interior;
  String developer;
  int floor;
  int electricity;
  int parkArea;
  String yearMade;
  String idListing;
  String registeredOn;
  String floorplan;
  String housingUid;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        image: json["image"] == null ? null : List<String>.from(json["image"].map((x) => x)),
        description: json["description"] == null ? null : json["description"],
        facilities: json["facilities"] == null ? null : Facilities.fromJson(json["facilities"]),
        price: json["price"] == null ? null : json["price"],
        sizeArea: json["size_area"] == null ? null : SizeArea.fromJson(json["size_area"]),
        certificate: json["certificate"] == null ? null : json["certificate"],
        interior: json["interior"] == null ? null : json["interior"],
        developer: json["developer"] == null ? null : json["developer"],
        floor: json["floor"] == null ? null : json["floor"],
        electricity: json["electricity"] == null ? null : json["electricity"],
        parkArea: json["park_area"] == null ? null : json["park_area"],
        yearMade: json["year_made"] == null ? null : json["year_made"],
        idListing: json["id_listing"] == null ? null : json["id_listing"],
        registeredOn: json["registered_on"] == null ? null : json["registered_on"],
        floorplan: json["floorplan"] == null ? null : json["floorplan"],
        housingUid: json["housing_uid"] == null ? null : json["housing_uid"],
      );

  Map<String, dynamic> toJson() => {
        "image": image == null ? null : List<dynamic>.from(image.map((x) => x)),
        "description": description == null ? null : description,
        "facilities": facilities == null ? null : facilities.toJson(),
        "price": price == null ? null : price,
        "size_area": sizeArea == null ? null : sizeArea.toJson(),
        "certificate": certificate == null ? null : certificate,
        "interior": interior == null ? null : interior,
        "developer": developer == null ? null : developer,
        "floor": floor == null ? null : floor,
        "electricity": electricity == null ? null : electricity,
        "park_area": parkArea == null ? null : parkArea,
        "year_made": yearMade == null ? null : yearMade,
        "id_listing": idListing == null ? null : idListing,
        "registered_on": registeredOn == null ? null : registeredOn,
        "floorplan": floorplan == null ? null : floorplan,
        "housing_uid": housingUid == null ? null : housingUid,
      };
}

class Facilities {
  Facilities({
    this.bedroom,
    this.bathroom,
  });

  int bedroom;
  int bathroom;

  factory Facilities.fromJson(Map<String, dynamic> json) => Facilities(
        bedroom: json["bedroom"] == null ? null : json["bedroom"],
        bathroom: json["bathroom"] == null ? null : json["bathroom"],
      );

  Map<String, dynamic> toJson() => {
        "bedroom": bedroom == null ? null : bedroom,
        "bathroom": bathroom == null ? null : bathroom,
      };
}

class SizeArea {
  SizeArea({
    this.surfaceArea,
    this.houseArea,
  });

  int surfaceArea;
  int houseArea;

  factory SizeArea.fromJson(Map<String, dynamic> json) => SizeArea(
        surfaceArea: json["surface_area"] == null ? null : json["surface_area"],
        houseArea: json["house_area"] == null ? null : json["house_area"],
      );

  Map<String, dynamic> toJson() => {
        "surface_area": surfaceArea == null ? null : surfaceArea,
        "house_area": houseArea == null ? null : houseArea,
      };
}

class Position {
  Position({
    this.x,
    this.y,
  });

  double x;
  double y;

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        x: json["x"] == null ? null : json["x"],
        y: json["y"] == null ? null : json["y"],
      );

  Map<String, dynamic> toJson() => {
        "x": x == null ? null : x,
        "y": y == null ? null : y,
      };
}
