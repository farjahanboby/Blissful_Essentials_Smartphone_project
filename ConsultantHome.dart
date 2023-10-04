import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:blissful_essentials/Consultant_chat.dart';
import 'package:blissful_essentials/Consultant_others.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Chome());
}
class Chome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomePageConsultant(title: 'xyz'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePageConsultant extends StatefulWidget {
  final String title;
  const HomePageConsultant({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageConsultantState createState() => _HomePageConsultantState();
}

class _HomePageConsultantState extends State<HomePageConsultant> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Perform actions based on the selected tab
    if (_currentIndex == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Chome()));
      // Handle the Home tab
    } else if (_currentIndex == 1) {
      // Handle the Chat tab
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CChat()));
    }
    else if (_currentIndex == 2) {
      // Handle the Others tab
     Navigator.push(
          context, MaterialPageRoute(builder: (context) => Others()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA964DF),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 198, 136, 245),
        title: Text(
          "BLISSFUL ESSENTIALS",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      body: Center(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: _onTabTapped, // Set the callback function
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
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

