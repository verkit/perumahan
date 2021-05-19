import 'package:get/route_manager.dart';
import 'package:perumahan/ui/screens/detail_house.dart';
import 'package:perumahan/ui/screens/home.dart';

class MyRouter {
  static var route = [
    GetPage(name: '/', page: () => HomePage()),
    GetPage(name: '/detail', page: () => DetailHousePage()),
  ];
}
