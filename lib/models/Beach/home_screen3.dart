import '/models/Beach/DestinationScreen.dart';
import '/models/screens/home_screen.dart';
import '/models/Beach/Destination.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bangladesh_travel_app/models/New_tourist/home_screen2.dart';

class Homescreen_3 extends StatefulWidget {
  const Homescreen_3({Key? key}) : super(key: key);

  @override
  State<Homescreen_3> createState() => _Homescreen_3State();
}

class _Homescreen_3State extends State<Homescreen_3> {
  final _pageController = PageController(viewportFraction: 0.877);
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/1.jpg"), fit: BoxFit.cover),
          ),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: DefaultTextStyle(
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 22,
                      color: Color(0XFF000000),
                      fontWeight: FontWeight.bold,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Bangladesh Tourist Places'),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 250,
                child: PageView.builder(
                  itemCount: destinations.length,
                  controller: PageController(viewportFraction: 0.7),
                  onPageChanged: (int index) => setState(() => _index = index),
                  itemBuilder: (context, i) {
                    return Transform.scale(
                      scale: i == _index ? 1.0 : 0.9,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DestinationScreen(
                                destination: destinations[i],
                              ),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height - 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(destinations[i].image),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(2, 3),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              destinations[i].name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
