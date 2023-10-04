import 'package:flutter/material.dart';
import 'package:blissful_essentials/MakeupProducts.dart';
import 'package:blissful_essentials/Cart_shoppers.dart';
import 'package:blissful_essentials/Shopper_chat.dart';
import 'package:blissful_essentials/Shopper_others.dart';

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

class CartItem {
  final Product1 product;
  final int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });
}

class Cart1 {
  static List<CartItem> cartItems = [];
}


class ProductDetailsPage extends StatefulWidget {
  final Product1 product;

  ProductDetailsPage({required this.product});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _quantity = 1; // Initial quantity

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA964DF),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 198, 136, 245),
        title: Text('Product Details'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            '${widget.product.imagePath}',
            fit: BoxFit.cover,
            height: 200.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  '\$${widget.product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 0.8),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 189, 136, 229),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      color: Colors.white,
                      onPressed: _decreaseQuantity,
                    ),
                    SizedBox(width: 2.0),
                    Text(
                      '$_quantity',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(width: 2.0),
                    IconButton(
                      icon: Icon(Icons.add),
                      color: Colors.white,
                      onPressed: _increaseQuantity,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 120.0),
              ElevatedButton(
                onPressed: () {
                  // Create a cart item and add it to the cart
                  CartItem cartItem = CartItem(
                    product: widget.product,
                    quantity: _quantity,
                  );
                  Cart1.cartItems.add(cartItem);

                  // Show a snackbar to indicate the item was added to the cart
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${_quantity} ${widget.product.name}(s) added to cart.')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  'Buy',
                  style: TextStyle(
                    color: Color(0xFFA964DF),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 189, 136, 229), // Background color for description section
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              'Product Description:                           ',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: 0, // You can set the initial index here
        onTap: (index) {
          // Handle bottom navigation bar taps here
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MakeupProduct()));
          } else if (index == 1) {
            // Handle the Chat tab
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Chat()));
          } else if (index == 2) {
            // Handle the Others tab
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Others()));
          }
        },
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
