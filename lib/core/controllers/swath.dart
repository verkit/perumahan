import 'package:get/get.dart';
import 'package:perumahan/core/data.dart';
import 'package:perumahan/core/models/swath.dart';

class SwathController extends GetxController {
  var isSearch = false.obs;

  List<SwathModel> _swaths = Plot.data.map((item) => SwathModel.fromJson(item)).toList();
  List<SwathModel> get swathsModel => _swaths;

  // Rx<List<SwathModel>> swathList = Rx<List<SwathModel>>();
  // List<SwathModel> get swaths => swathList.value;

  // Rx<SwathModel> _swathModel = SwathModel().obs;
  // SwathModel get swath => _swathModel.value;

  @override
  void onInit() {
    // String uid = "axz";
    // swathList.bindStream(SwathRepository().todoStream(uid));
    super.onInit();
  }
}
