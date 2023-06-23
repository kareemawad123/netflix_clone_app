import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelpScreen extends StatelessWidget {
  HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            'assets/icons/NetflixLogo.svg',
            // fit: BoxFit.contain,
            height: 32,
            width: 50,
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(children: [
              Text(
                "Find Help Online",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(height: 1),
              MaterialButton(
                onPressed: () => {},
                child: ListTile(
                    leading: Icon(
                      Icons.exit_to_app_sharp,
                      color: Color.fromRGBO(3, 27, 241, 0.902),
                    ),
                    title: Text(
                      "Help Center",
                      style: TextStyle(
                        color: Color.fromRGBO(3, 27, 241, 0.902),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(height: 1),
              MaterialButton(
                onPressed: () => {},
                child: ListTile(
                    leading: Icon(
                      Icons.ballot,
                      color: const Color.fromARGB(255, 11, 138, 241),
                    ),
                    title: Text(
                      "Request a title",
                      style: TextStyle(
                        color: Color.fromRGBO(3, 27, 241, 0.902),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(height: 1),
              MaterialButton(
                onPressed: () => {},
                child: ListTile(
                    leading: Icon(
                      Icons.build,
                      color: const Color.fromARGB(255, 11, 138, 241),
                    ),
                    title: Text(
                      "Fix a connection issue",
                      style: TextStyle(
                        color: Color.fromRGBO(3, 27, 241, 0.902),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(height: 1),
              MaterialButton(
                onPressed: () => {},
                child: ListTile(
                    leading: Icon(
                      Icons.beenhere_sharp,
                      color: const Color.fromARGB(255, 11, 138, 241),
                    ),
                    title: Text(
                      "Privacy Statement",
                      style: TextStyle(
                        color: Color.fromRGBO(3, 27, 241, 0.902),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(height: 1),
              MaterialButton(
                onPressed: () => {},
                child: ListTile(
                    leading: Icon(
                      Icons.article_outlined,
                      color: const Color.fromARGB(255, 11, 138, 241),
                    ),
                    title: Text(
                      "Terms Of Use",
                      style: TextStyle(
                        color: Color.fromRGBO(3, 27, 241, 0.902),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(height: 1),
              SizedBox(
                height: 15,
              ),
              Text(
                "Contact",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "Netflix Customer Service",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "We'll connect the call for free using your internet connection.",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 110,
                height: 50,
                child: MaterialButton(
                    color: Colors.black,
                    onPressed: () => {},
                    child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        title: Text(
                          "CALL",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 6,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ))),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 110,
                height: 50,
                child: MaterialButton(
                    color: Colors.black,
                    onPressed: () => {},
                    child: ListTile(
                        leading: Icon(
                          Icons.chat,
                          color: Colors.white,
                        ),
                        title: Text(
                          "CHAT",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 6,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ))),
              ),
            ]))));
  }
}
