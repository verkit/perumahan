import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perumahan/core/router.dart';
import 'package:perumahan/ui/styles/themes/light.dart';

void main() async {
  // await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Perumahan',
      getPages: MyRouter.route,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.light,
      defaultTransition: Transition.fade,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
    );
  }
}
