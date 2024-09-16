// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc4e7e3),
      appBar: AppBar(
        backgroundColor: Color(0xffc4e7e3),
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Color(0xff302f2a),
        ),
      ),
      body: Center(
        child: 
        Container(
          decoration: BoxDecoration(
              color: Color(0xfffcf6e8),
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [
                // bottom right shadow
                BoxShadow(
                  color: Color(0xff363437),
                  offset: Offset(6, 6),
                ),
              ]),
          width: 370,
          height: 250,
          child: Column(
            children: [
              Text(
                'Quote of the Day',
                style: GoogleFonts.bungee(
                  color: Color(0xff32312d),
                  fontSize: 15,
                ),
              ),
              Text('If I buzz but no bee how am i truly buzzing'),
              Text('Midnight Pine')
            ],
          ),
      
        ),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.ios_share), label: 'Like'),
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_add_outlined), label: 'Save')
      ],
      backgroundColor: Color(0xffc4e7e3),),
    );
  }
}
