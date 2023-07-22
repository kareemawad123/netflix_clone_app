import 'package:cloud_firestore/cloud_firestore.dart';

class SearchAPI {
  static Future<dynamic> getAllMovie() async {
    var mCollection =
        FirebaseFirestore.instance.collection('NetflixClone');
    var data = await mCollection.get();
    return data;
  }
}
