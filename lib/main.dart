import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:objectrecognition/FruitDetection.dart';
import 'package:objectrecognition/MoneyDetection.dart';

import 'ObjectDetection.dart';
import 'TextRecognition.dart';

List<CameraDescription>? cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  final firstcamera = cameras!.first;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nesne Tanıma',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color primaryBlue = Color(0xff272A53);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [primaryBlue, Color(0xffA8AAB9)],
        )),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: size.height * .05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height * .12),
              Row(
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ],
              ),
              SizedBox(height: size.height * .01),
              Row(
                children: [
                  Text(
                    "Object Detection",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ObjectDetection()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffE7C76D),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: size.height * .04),
                            Image.asset(
                              'assets/images/icon1.png',
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              "Nesne Tanıma",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MoneyDetection()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: size.height * .04),
                            Image.asset(
                              'assets/images/icon5.png',
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              "Para Tanıma",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FruitDetection()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff5D6188),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: size.height * .04),
                            Image.asset(
                              'assets/images/icon3.png',
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              "Meyve Tanıma",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TextDetection()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffD86565),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: size.height * .04),
                            Image.asset(
                              'assets/images/icon4.png',
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              "Yazı Tanıma",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
