import 'package:flutter/material.dart';
import 'signup.dart'; 
import 'login page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      primarySwatch: Colors.green,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      
      ),
       home: HomeScreen('Welcome!!!'),
       
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen(String s);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.green,
        title: Text('Welcome!!!'),
        
      ),
      body: Stack(
        children: <Widget>[
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'images/x.jpg',
              fit: BoxFit.contain,
            ),
          ),
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                WideButton(
                  label: 'Register',
                  
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                ),
                SizedBox(height: 20),
                WideButton(
                  label: 'Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WideButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  WideButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.green, 
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text( 
            label,
            style: TextStyle(
            color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
