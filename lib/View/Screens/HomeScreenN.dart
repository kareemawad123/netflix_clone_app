import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:netflix_clone_app/View/Screens/bottom_nav_1.dart';
import '../../Controller/api_get_controller.dart';
import '../../Controller/movies_controller.dart';
import '../../Controller/scroll_controller.dart';
import '../../Model/constants.dart';
import '../reusable_widgets/geners_text.dart';
import '../reusable_widgets/slider_card.dart';

class HomeScreenN extends StatefulWidget {
  const HomeScreenN({Key? key}) : super(key: key);

  @override
  State<HomeScreenN> createState() => _HomeScreenNState();
}

class _HomeScreenNState extends State<HomeScreenN> {
  int _selectedIndex = 0;
  // bool isTop = true;
  // final ScrollController controller = ScrollController();
  final SController sC = Get.put(SController());
  bool _showNavBar = true;
  late List movies;
  bool isLoad = true;
  bool isTop = true;
  String preLinkImg = 'https://image.tmdb.org/t/p/w500/';

  void getMovies() async {
    movies = await MoviesCore.setMovies();
    if (movies.isNotEmpty) {
      isLoad = false;
    }
    setState(() {});
    print(movies);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    getMovies();

    sC.controller.addListener(() {
      if (sC.controller.hasClients) {
        if (sC.controller.position.userScrollDirection ==
                ScrollDirection.forward &&
            !_showNavBar) {
          setState(() {
            _showNavBar = true;
            print(11);
            if(0 == sC.controller.position.pixels || sC.controller.position.pixels < 50){

              sC.setTra();
            }else{
              sC.setNotTra();
            }
          });
        } else if (sC.controller.position.userScrollDirection ==
                ScrollDirection.reverse &&
            _showNavBar) {
          setState(() {
            _showNavBar = false;
            print(22);
          });
          if(0 == sC.controller.position.pixels || sC.controller.position.pixels < 50){

            sC.setTra();
          }else{
            sC.setNotTra();
          }

        }
      }
      // print(sC.controller.offset);
      if(sC.controller.offset == 0){
        print('top');
        setState(() {
          isTop = true;
        });
        // sC.setTra();
        // print(sC.isTop.value);
      }else{

        // sC.setNotTra();
        // print(sC.isTop.value);
        print('not TOp');

        setState(() {
          isTop = false;
        });
      }

    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    sC.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: tertiaryColors,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: isTop? Colors.transparent : Colors.black.withAlpha(alpha + 100),
          leading: Container(
            margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
            child: SvgPicture.asset(
              height: height * 0.05,
              'assets/icons/Netflix_N_logo.svg',
              alignment: Alignment.topLeft,
            ),
          ),
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      print(movies.length);
                    },
                    icon: const Icon(
                      Icons.search_rounded,
                      size: 35,
                    ))),
            InkWell(
              onTap: () {},
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
            preferredSize: _showNavBar
                ? const Size.fromHeight(48.0)
                : const Size.fromHeight(0),
            child: Theme(
              data: Theme.of(context).copyWith(hintColor: Colors.white),
              child: _showNavBar
                  ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                height: 48.0,
                alignment: Alignment.center,
                color: Colors.black.withAlpha(alpha - 50),
                child: Row(
                  children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'TV Shows',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ))),
                    Expanded(
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Movies',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ))),
                    Expanded(
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Categories',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ))),
                  ],
                ),
              )
                  : Container(),
            ),
          ),
        ),
        body: isLoad
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : _bottomNavBar.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          showUnselectedLabels: true,
          useLegacyColorScheme: false,
          // fixedColor: Colors.blue,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: tertiaryColors,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_esports_outlined),
              label: 'Games',
              backgroundColor: tertiaryColors,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined),
              label: 'New & Host',
              backgroundColor: tertiaryColors,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download_for_offline_outlined),
              label: 'Download',
              backgroundColor: tertiaryColors,
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  static  final List<Widget> _bottomNavBar = <Widget>[
    const HomeIndex1(),
    const Text(
      'Index 1: Business',
      style: TextStyle(color: Colors.white),
    ),
    const Text(
      'Index 2: School',
      style: TextStyle(color: Colors.white),
    ),
    const Text(
      'Index 3: School2',
      style: TextStyle(color: Colors.white),
    ),
  ];
}
