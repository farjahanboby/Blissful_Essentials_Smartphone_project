  import 'package:flutter/material.dart';

  void main() => runApp(MyApp());

  class MyApp extends StatelessWidget {
    const MyApp({super.key});
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: HomePage(title: 'xyz'),
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
        backgroundColor: Color(0xFFA964DF),
        appBar: AppBar(
          backgroundColor: Color(0xFFA964DF),
          title: Text(
            "BLISSFUL ESSENTIALS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ), // Set the background color to purple
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Container(
                width: 300, // Adjust the width as needed
                height: 300, // Adjust the height as needed
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
                    return Container(
                      color: Colors.white,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.purple[200],
            border: Border(
              top: BorderSide(width: 2.0, color: Colors.black),
              bottom: BorderSide(width: 2.0, color: Colors.black),
              // Add a top border
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.black), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message, color: Colors.black), label: "Chat"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart, color: Colors.black),
                  label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz, color: Colors.black),
                  label: "Others")
            ],
            onTap: (int index) {
              if (index == 0) {}
              if (index == 1) {}
              if (index == 2) {}
            },
          ),
        ),
      );
    }
  }

  class CategoryCard extends StatelessWidget {
    final String category;
    final String image;

    CategoryCard({required this.category, required this.image});

    @override
    Widget build(BuildContext context) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0), // Change the circular shape
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              child: Image.asset(
                image,
                fit: BoxFit.cover, // Adjust the fit mode as needed
              ),
            ),
            SizedBox(height: 15),
            Text(category),
          ],
        ),
      );
    }
  }

  List<String> categories = [
    'Makeup',
    'Skincare',
  ];
  // Add more categories here

  List<String> categoryImages = [
    'images/makeup.png',
    'images/skincare.jpeg',
  ];
