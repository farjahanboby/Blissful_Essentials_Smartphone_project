import 'package:flutter/material.dart';
import 'package:blissful_essentials/ShopperHome.dart';
import 'package:blissful_essentials/Shopper_chat.dart';
import 'package:blissful_essentials/Cart_shoppers.dart';
import 'package:blissful_essentials/Shopper_others.dart';
import 'package:blissful_essentials/SkincareProduct_Details.dart';

class Product2 {
  final String imagePath;
  final String name;
  final double price;

  Product2({required this.imagePath, required this.name, required this.price});
}
List<Product2> products = [
  Product2(
    imagePath: 'assets/skincare.jpeg', // Replace with actual image path
    name: 'Product 1',
    price: 19.99,
  ),
  Product2(
    imagePath: 'assets/skincare.jpeg', // Replace with actual image path
    name: 'Product 2',
    price: 29.99,
  ),
  // Add more products here
  Product2(
    imagePath: 'assets/skincare.jpeg', // Replace with actual image path
    name: 'Product 3',
    price: 9.99,
  ),
];
class SkincareProduct extends StatelessWidget {
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
          "Skin Care Products",
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

      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product2 product = products[index]; // Make sure 'Product' is the correct type
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage1(product: product),
                ),
              );
            },
            child: Card(
              color: Color.fromARGB(255, 198, 136, 245),
              elevation: 3.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      //color: Colors.transparent, // Set the background to transparent
                      child: Image.asset(
                        product.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ClipRect(
                    child: Container(
                      color: Color.fromARGB(150, 0, 0, 0), // Transparent black color
                      padding: EdgeInsets.all(8.0),
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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

