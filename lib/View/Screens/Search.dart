import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:netflix_clone_app/Controller/search_controller.dart';

import '../../Model/constants.dart';
import 'Profiles.dart';
import 'movie_details.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // print(SearchAPI.getAllMovie());
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: tertiaryColors,
      appBar: AppBar(
        backgroundColor: tertiaryColors,
        foregroundColor: secondaryColors,
        actions: [
          InkWell(
            onTap: () {
              Get.to(const ProfileScreen(),
                  transition: Transition.rightToLeftWithFade);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              height: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  'assets/images/user1.png',
                  // height: 8,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.06),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: width,
            height: height * 0.06,
            color: Colors.grey[900],
            child: TextFormField(
              controller: searchController,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white70,
                  ),
                  hintText: 'Search for titles, genres or people',
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    size: 30,
                    color: Colors.white70,
                  ),
                  suffixIcon: Icon(
                    Icons.mic_none,
                    size: 30,
                    color: Colors.white70,
                  )),
              style: const TextStyle(
                color: Colors.white70,
              ),
              onChanged: (value) {
                print(searchController.value.text.capitalize);
              },
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchController.value.text.trim().isEmpty ? Container(
              margin: const EdgeInsets.only(top: 15, left: 10),
              child: const Text(
                'Top Searches',
                style: TextStyle(color: secondaryColors, fontSize: 20, fontWeight: FontWeight.bold),
              )): Container(),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('NetflixClone')
                  .where('name',
                      isGreaterThanOrEqualTo:
                          searchController.value.text.capitalize)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return searchItem(
                        context: context,
                        name: data['name'] ?? data['Name'],
                        image: data['link'] ?? data['Link']);
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }

  Widget searchItem({
    required BuildContext context,
    required String image,
    required String name,
  }) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: width * 0.02, bottom: 5, top: 5, left: 10),
          width: width * 0.4,
          height: height * 0.11,
          // color: Colors.amberAccent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: secondaryColors,
                    fontSize: 17),
              ),
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                // Get.to(MovieDetailsScreen(
                //     movie: movies[index]));
              },
              icon: const Icon(
                Icons.play_circle_outline_outlined,
                color: Colors.white,
                size: 40,
              ),
            )),
      ],
    );
  }
}
