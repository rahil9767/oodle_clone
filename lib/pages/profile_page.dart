import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sliding_sheet2/sliding_sheet2.dart';
import '../reusable_widgets/menu.dart';
import '../utils/colour.dart';

class ProfilePage extends StatefulWidget {
  final GoogleSignInAccount? user;

  const ProfilePage({Key? key, this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _navigateToMenu(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => Menu()),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Scaffold(
          body: Stack(
            children: [
              Image.asset(
                'assets/images/avtar.jpg',
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
              SlidingSheet(
                snapSpec: const SnapSpec(
                  snap: true,
                  snappings: [0.6, 1.0],
                  positioning: SnapPositioning.relativeToSheetHeight,
                ),
                builder: (context, state) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: MyColors.gradientColors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    height: 800, // Adjust height as needed
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0, left: 10.0),
                                    child: Text(
                                      'Avtar Max',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            // Add the second text below the first one
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 40.0),
                              child: Text(
                                "Hey There.I'm new to Oodle",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            // Add two square-shaped boxes with text
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 20.0, left: 10.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                      child: Text(
                                        '10 AUG',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 10), // Add space between the boxes
                                  Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                      child: Text(
                                        'Single',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Add a container below the boxes
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'My Friend List(0)',
                                  style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Interests',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'My Vibe',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Positioned(
          top: 40, // Adjust top position as needed
          right: 10, // Adjust right position as needed
          child: FloatingActionButton(
            onPressed: () {
              _navigateToMenu(context);
            },
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            highlightElevation: 0.0,
            focusElevation: 0.0,
            child: Icon(
              Icons.more_horiz,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }
}


