import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(title: 'xxx'),
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

class ShopperReg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _ShopperRegContent();
  }
}

class _ShopperRegContent extends StatefulWidget {
  @override
  _ShopperRegContentState createState() => _ShopperRegContentState();
}

class _ShopperRegContentState extends State<_ShopperRegContent> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isSignedUp = false;
  bool showPassword = false;

  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        showPassword = !showPassword;
      });
    });
  }

  void submitRegistration() {
    // Check if the passwords match the condition
    if (!RegExp(r'^[a-zA-Z_]*$').hasMatch(passwordController.text)) {
      // Show an error message using a Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password must only contain letters (a-z, A-Z) and underscores.'),
        ),
      );
      return; // Abort registration if password doesn't match the condition
    }
    // Check if a valid email address has been entered
    if (!isValidEmail(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid email address.'),
        ),
      );
      return; // Abort registration if email is not valid
    }
    if (passwordController.text == confirmPasswordController.text) {
      setState(() {
        isSignedUp = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords do not match.'),
        ),
      );
    }
  }
  bool isValidEmail(String email) {
    // Use a regular expression to validate the email address format
    final RegExp emailRegExp =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA964DF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Navigate back to HomePage
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 26,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 60), // Adding some space between arrow and Container
             Align(
               alignment: Alignment.center,
               child:Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage('assets/flogo.png'), fit: BoxFit.fill),
                  border: Border.all(width: 2),
                ),
                padding: EdgeInsets.all(15),
                //child: Image.asset('assets/flogo.png', fit: BoxFit.fill),
              ),
             ),
              //  Shopper Registration content here
              SizedBox(height: 60),
              _buildInputBox('Username', nameController, showPassword: showPassword),
              SizedBox(height: 20),
              _buildInputBox('Email', emailController, showPassword: showPassword),
              SizedBox(height: 20),
              _buildInputBox('Password', passwordController, isPassword: true, showPassword: showPassword),
              SizedBox(height: 20),
              _buildInputBox('Confirm Password', confirmPasswordController, isPassword: true, showPassword: showPassword),
              SizedBox(height: 40),
              Align(
                  alignment: Alignment.center, // Center the button horizontally
                  child: ElevatedButton(

                onPressed: () {
                  submitRegistration();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(
                      255, 198, 136, 245), // Button background color
                  minimumSize: Size(150, 42), // Set width and height
                  side: BorderSide(color: Colors.white, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                ),
                child: Text('Submit'),
              ),
              ),
              SizedBox(height: 20),
              if (isSignedUp)
                Text(
                  'You have successfully signed up!',

                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildInputBox(String labelText, TextEditingController controller, {bool isPassword = false,required bool showPassword}) {
  var toggleShowPassword;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        labelText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      SizedBox(height: 6),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: Colors.white),
          color: Color.fromARGB(255, 198, 136, 245),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: TextFormField(
          controller: controller,
          obscureText: isPassword && !showPassword,
          // Toggle obscuring based on showPassword
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: isPassword
                ? IconButton(
              icon: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              ),
              onPressed: toggleShowPassword,

              // Call the toggle function here
            )
                : null,
          ),
        ),
      ),
    ],
  );
}
