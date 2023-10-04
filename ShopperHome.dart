import 'package:flutter/material.dart';
import 'package:blissful_essentials/Shopper_chat.dart';
import 'package:blissful_essentials/Shopper_others.dart';
import 'package:blissful_essentials/Cart_shoppers.dart';
import 'package:blissful_essentials/SkincareProducts.dart';
import 'package:blissful_essentials/MakeupProducts.dart';
class ShopperHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomePage(title: 'xyz'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Perform actions based on the selected tab
    if (_currentIndex == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ShopperHome()));
      // Handle the Home tab
    } else if (_currentIndex == 1) {
      // Handle the Chat tab
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Chat()));
    } else if (_currentIndex == 2) {
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle cart button press here
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
              // Add your cart functionality here
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Container(
              width: 300,
              height: 300,
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return CategoryCard(
                    category: categories[index],
                    image: categoryImages[index],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
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

class CategoryCard extends StatelessWidget {
  final String category;
  final String image;

  CategoryCard({required this.category, required this.image});
  void _onCategoryCardTapped(BuildContext context) {
    // Navigate to different pages based on the category
    if (category == 'Makeup') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MakeupProduct()));
    } else if (category == 'Skincare') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SkincareProduct()));
    } else {
      // Handle other categories if needed
    }
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: GestureDetector(
        onTap: () {
          _onCategoryCardTapped(context);
        },
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15),
            Text(category),
          ],
        ),
      ),
    );
  }
}

List<String> categories = [
  'Makeup',
  'Skincare',
  // Add more categories here
];

List<String> categoryImages = [
  'assets/makeup.png',
  'assets/skincare.jpeg',
  // Add more image paths here
];
