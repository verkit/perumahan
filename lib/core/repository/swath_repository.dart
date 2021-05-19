import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:perumahan/core/models/swath.dart';

class SwathRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Future<SwathModel> getUser(String uid) async {
  //   try {
  //     DocumentSnapshot _doc = await _firestore.collection("lotses").doc(uid).get();
  //     return SwathModel.fromSnapshot(_doc);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Stream<List<SwathModel>> todoStream(String uid) {
    return _firestore.collection("housings").doc(uid).collection('swaths').snapshots().map((event) {
      List<SwathModel> swathList = [];
      event.docs.forEach((element) {
        swathList.add(SwathModel.fromSnapshot(element));
      });
      print(swathList);
      return swathList;
    });
  }
}
