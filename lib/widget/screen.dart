import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hidden Drawer',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}