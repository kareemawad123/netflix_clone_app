import 'package:cloud_firestore/cloud_firestore.dart';

class SearchAPI {
  static Future<dynamic> getAllMovie() async {
    var mCollection =
        FirebaseFirestore.instance.collection('NetflixClone');
    var data = await mCollection.get();
    return data;
  }



  static Future<List<Object?>> getData() async {
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('NetflixClone');
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    // print(allData);
    return allData;
  }


}
