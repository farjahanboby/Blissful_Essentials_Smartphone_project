import 'package:flutter/material.dart';
import 'package:blissful_essentials/ConsultantHome.dart';
import 'package:blissful_essentials/Consultant_others.dart';

class ChatMessage {
  final String text;
  final bool isSent;
  ChatMessage({required this.text, required this.isSent});
}

class CChat extends StatelessWidget {
  const CChat({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Chat',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // A widget which will be started on application startup
      home: ChatPage(title: 'Chat'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatSection extends StatefulWidget {
  @override
  _ChatSectionState createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
  List<ChatMessage> _messages = [];
  TextEditingController _messageController = TextEditingController();

  void _addMessage(String text, bool isSent) {
    setState(() {
      _messages.add(ChatMessage(text: text, isSent: isSent));
    });
    _messageController.clear(); // Clear the text field
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (BuildContext context, int index) {
              final message = _messages[index];
              return Align(
                alignment:
                message.isSent ? Alignment.topRight : Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: message.isSent ? Colors.white : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: message.isSent ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  onChanged: (text) {
                    // Handle text changes
                  },
                  onSubmitted: (text) {
                    _addMessage(text, true); // true indicates a sent message
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your message...",
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  _addMessage(_messageController.text, true);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChatPage extends StatefulWidget {
  final String title;
  const ChatPage({Key? key, required this.title}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _currentIndex = 1;

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
          "Chat",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      body: ChatSection(), // Using the ChatSection widget
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
