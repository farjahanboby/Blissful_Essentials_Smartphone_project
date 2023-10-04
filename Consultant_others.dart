import 'package:flutter/material.dart';
import 'package:blissful_essentials/ConsultantHome.dart';
import 'package:blissful_essentials/Consultant_chat.dart';

class Others extends StatelessWidget {
  const Others({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Others',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // A widget which will be started on application startup
      home: OthersPage(title: 'Others'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OthersPage extends StatefulWidget {
  final String title;
  const OthersPage({Key? key, required this.title}) : super(key: key);

  @override
  _OthersPageState createState() => _OthersPageState();
}

class _OthersPageState extends State<OthersPage> {
  int _currentIndex = 2;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Perform actions based on the selected tab
    if (_currentIndex == 0) {
      // Handle the Home tab
      Navigator.push(context, MaterialPageRoute(builder: (context) => Chome()));
    } else if (_currentIndex == 1) {
      // Handle the Chat tab
      Navigator.push(context, MaterialPageRoute(builder: (context) => CChat()));
    } else if (_currentIndex == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Others()));
      // Handle the Others tab
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA964DF),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 198, 136, 245),
        title: Text(
          "Others",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      body: Column(
        children: [
          SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2.0, // You can adjust the border width
              ),
              borderRadius: BorderRadius.circular(15.0),
              color: Color.fromARGB(255, 198, 136, 245),
            ),
            //color: Color.fromARGB(255, 198, 136, 245),
            height: 75,
            child: Center(
              child: Text('Edit Profile'),
            ),
          ),
          SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2.0, // You can adjust the border width
              ),
              borderRadius: BorderRadius.circular(15.0),
              color: Color.fromARGB(255, 198, 136, 245),
            ),
            //color: Color.fromARGB(255, 198, 136, 245),
            height: 75,
            child: Center(
              child: Text('About Us'),
            ),
          ),
          SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2.0, // You can adjust the border width
              ),
              borderRadius: BorderRadius.circular(15.0),
              color: Color.fromARGB(255, 198, 136, 245),
            ),
            //color: Color.fromARGB(255, 198, 136, 245),
            height: 75,
            child: Center(
              child: Text('Contact Us'),
            ),
          ),
          SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2.0, // You can adjust the border width
              ),
              borderRadius: BorderRadius.circular(15.0),
              color: Color.fromARGB(255, 198, 136, 245),
            ),
            //color: Color.fromARGB(255, 198, 136, 245),
            height: 75,
            child: Center(
              child: Text('Terms and Conditions'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: _onTabTapped, // Set the callback function
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Others',
          ),
        ],
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.purple,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      ),
    );
  }
}
