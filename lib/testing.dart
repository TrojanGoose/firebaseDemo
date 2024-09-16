import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
  decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.black),
    borderRadius: BorderRadius.circular(8),
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black)),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              'Installing Designer Creative Clown',
              style: TextStyle(color: Colors.black),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(2, (index) => 
                  Container(
                    width: 12,
                    height: 12,
                    margin: EdgeInsets.only(right: index < 2 ? 4 : 0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Add your content here
      Padding(
        padding: EdgeInsets.all(16),
        child: Text('Your content goes here'),
      ),
    ],
  ),
)     ),
    );
  }
}
