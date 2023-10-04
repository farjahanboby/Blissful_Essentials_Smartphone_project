import 'package:flutter/material.dart';
import 'package:blissful_essentials/Shopper_chat.dart';
import 'package:blissful_essentials/Shopper_chat.dart';
import 'package:blissful_essentials/Shopper_others.dart';
import 'package:blissful_essentials/ShopperHome.dart';
import 'package:blissful_essentials/MakeupProduct_details.dart';
import 'package:blissful_essentials/SkincareProduct_Details.dart';
// Your CartItem and Cart1, Cart2 definitions here
class Cart extends StatelessWidget {
  const Cart({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Cart',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // A widget which will be started on application startup
      home: CartPage(title: 'Cart'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CartPage extends StatefulWidget {
  final String title;
  const CartPage({Key? key, required this.title}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double _grandTotal = 0;

  @override
  void initState() {
    super.initState();
    _updateGrandTotal();
  }

  void _updateGrandTotal() {
    double grandTotal = Cart1.cartItems.fold<double>(
      0,
          (sum, cartItem) => sum + (cartItem.product.price * cartItem.quantity),
    ) +
        Cart2.cartItems.fold<double>(
          0,
              (sum, cartItem2) => sum + (cartItem2.product.price * cartItem2.quantity),
        );

    setState(() {
      _grandTotal = grandTotal;
    });
  }


  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (_currentIndex == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ShopperHome()));
    } else if (_currentIndex == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
    } else if (_currentIndex == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Others()));
    }
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA964DF),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 198, 136, 245),
        title: Text(
          "Cart",
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Cart1.cartItems.length + Cart2.cartItems.length + 1,
        itemBuilder: (context, index) {
          if (index < Cart1.cartItems.length) {
            CartItem cartItem = Cart1.cartItems[index];
            return Dismissible(
              key: Key(cartItem.product.name),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  Cart1.cartItems.removeAt(index);
                });
                _updateGrandTotal();
              },
              background: Container(
                alignment: AlignmentDirectional.centerEnd,
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: ListTile(
                leading: Image.asset(
                  cartItem.product.imagePath,
                  width: 50,
                  height: 50,
                ),
                title: Text(cartItem.product.name),
                subtitle: Text('Quantity: ${cartItem.quantity}'),
                trailing: Text('\$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}'),
              ),
            );
          } else if (index < Cart1.cartItems.length + Cart2.cartItems.length) {
            CartItem2 cartItem2 = Cart2.cartItems[index - Cart1.cartItems.length];
            return Dismissible(
              key: Key(cartItem2.product.name),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  Cart2.cartItems.removeAt(index - Cart1.cartItems.length);
                });
                _updateGrandTotal();
              },
              background: Container(
                alignment: AlignmentDirectional.centerEnd,
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: ListTile(
                leading: Image.asset(
                  cartItem2.product.imagePath,
                  width: 50,
                  height: 50,
                ),
                title: Text(cartItem2.product.name),
                subtitle: Text('Quantity: ${cartItem2.quantity}'),
                trailing: Text('\$${(cartItem2.product.price * cartItem2.quantity).toStringAsFixed(2)}'),
              ),
            );
          } else {
            return Center(
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Grand Total: \$${_grandTotal.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Implement checkout functionality
                        },
                        child: Text('Checkout'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
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

