import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:blissful_essentials/ShopperReg.dart';
import 'package:blissful_essentials/ConsultantReg.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(title: 'Blissful Essentials'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA964DF), //  background color to purple
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, // Circular shape for the container
                  // color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage('assets/flogo.png'), fit: BoxFit.fill),
                  //borderRadius: BorderRadius.circular(90),
                  color: Colors.white,
                  border: Border.all(width: 2)),
              padding: EdgeInsets.all(15), // Adjust padding for the circular logo
            ),
            SizedBox(height: 12),
            Text(
              "BLISSFUL ESSENTIALS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 75),
            Text(
              "How do you want to continue?",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 25), // Add spacing between logo and buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShopperReg()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB (255, 198, 136, 245), // Button background color
                minimumSize: Size(260, 42), // Set width and height
                side: BorderSide(color: Colors.white, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
              ),
              child: Text("Shopper"),
            ),
            SizedBox(height: 50), //some spacing between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConsultantReg()));
                // logic for the second button here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(
                    255, 198, 136, 245), // Button background color
                minimumSize: Size(260, 42), // Set width and height
                side: BorderSide(color: Colors.white, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
              ),
              child: Text("Consultant"),
            ),
          ],
        ),
      ),
    );
  }
}

