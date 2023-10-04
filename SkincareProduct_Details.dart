import 'package:flutter/material.dart';
import 'package:blissful_essentials/SkincareProducts.dart';
import 'package:blissful_essentials/MakeupProducts.dart';
import 'package:blissful_essentials/Cart_shoppers.dart';
import 'package:blissful_essentials/Shopper_chat.dart';
import 'package:blissful_essentials/Shopper_others.dart';
class CartItem2 {
  final Product2 product;
  final int quantity;

  CartItem2({
    required this.product,
    required this.quantity,
  });
}

class Cart2 {
  static List<CartItem2> cartItems = [];
}
class ProductDetailsPage1 extends StatefulWidget {
  final Product2 product;

  ProductDetailsPage1({required this.product});

  @override
  _ProductDetailsPage1State createState() => _ProductDetailsPage1State();
}

class _ProductDetailsPage1State extends State<ProductDetailsPage1> {
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
                  CartItem2 cartItem = CartItem2(
                    product: widget.product,
                    quantity: _quantity,
                  );
                  Cart2.cartItems.add(cartItem);

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
                context, MaterialPageRoute(builder: (context) => SkincareProduct()));
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
