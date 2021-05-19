// class Root extends GetWidget<AuthController> {
//   @override
//   Widget build(BuildContext context) {
//     return GetX(
//       initState: (_) async {
//         Get.put<UserController>(UserController());
//       },
//       builder: (_) {
//         if (Get.find<AuthController>().user?.uid != null) {
//           return Home();
//         } else {
//           return Login();
//         }
//       },
//     );
//   }
// }