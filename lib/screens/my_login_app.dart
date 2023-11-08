import 'package:flutter/material.dart';

class MyLoginApp extends StatefulWidget {
  const MyLoginApp({super.key});

  @override
  State<MyLoginApp> createState() => _MyLoginAppState();
}

class _MyLoginAppState extends State<MyLoginApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My LOGIN App'),
      ),
      body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/MyLoginApp_files/purple8.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: (
              Text("simple background")
            ),
          ),
        ),
    );
  }
}


        // Background Image
        // Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('assets/MyLoginApp_files/purple-8.png'), // Replace with your image path
        //       fit: BoxFit.cover, // You can adjust this property as needed
        //     ),
        //   ),
        // ),