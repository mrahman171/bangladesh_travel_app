import '/models/screens/DestinationScreen.dart';
import '/models/Destination.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bangladesh_travel_app/models/Popular/home_screen1.dart';
import 'package:bangladesh_travel_app/models/New_tourist/home_screen2.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final _pageController = PageController(viewportFraction: 0.877);
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/15.jpg"), fit: BoxFit.cover),
          ),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
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
                height: 30,
                margin: EdgeInsets.only(top: 28.8, left: 14.4),
                child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                    labelPadding: EdgeInsets.only(
                      left: 14.4,
                      right: 14.4,
                    ),
                    isScrollable: true,
                    labelColor: Color.fromARGB(255, 246, 246, 246),
                    unselectedLabelColor: Color.fromRGBO(50, 128, 113, 1),
                    labelStyle: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w700),
                    indicator: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Colors.redAccent, Colors.orangeAccent]),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.redAccent),
                    tabs: [
                      Tab(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Homescreen(),
                              ),
                            );
                          },
                          child: Container(
                            child: Text('Recommended'),
                          ),
                        ),
                      ),
                      Tab(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Homescreen_1(),
                              ),
                            );
                          },
                          child: Container(
                            child: Text('Popular'),
                          ),
                        ),
                      ),
                      Tab(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Homescreen_2(),
                              ),
                            );
                          },
                          child: Container(
                            child: Text('New Tourist Spot'),
                          ),
                        ),
                      ),
                    ],
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
              Padding(
                padding: EdgeInsets.only(top: 8.8, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Popular Categories",
                        style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0XFF000000)),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 30,
                  margin: EdgeInsets.only(top: 10.8, left: 14.4, bottom: 15.9),
                  child: DefaultTabController(
                    length: 3,
                    child: TabBar(
                      labelPadding: EdgeInsets.only(
                        left: 14.4,
                        right: 14.4,
                      ),
                      isScrollable: true,
                      labelColor: Color.fromARGB(255, 246, 246, 246),
                      unselectedLabelColor: Color.fromRGBO(50, 128, 113, 1),
                      labelStyle: GoogleFonts.lato(
                          fontSize: 14, fontWeight: FontWeight.w700),
                      indicator: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Colors.redAccent, Colors.orangeAccent]),
                          borderRadius: BorderRadius.circular(90),
                          color: Colors.redAccent),
                      tabs: [
                        Tab(
                          child: Container(
                            child: Text('Beach'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text('Mountain'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text('Lake'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
