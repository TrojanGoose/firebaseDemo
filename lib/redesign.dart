import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double strokeWidth = 2.0;

class Redesign extends StatefulWidget {
  const Redesign({super.key});

  @override
  State<Redesign> createState() => _RedesignState();
}

class _RedesignState extends State<Redesign> {
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
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xfffcf6e8),
              border: Border.all(
                color: Color(0xff383933),
                width: strokeWidth,
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                //bottom right shadow
                BoxShadow(
                  color: Color(0xff363437),
                  offset: Offset(6, 6),
                ),
              ]),
          width: 370,
          height: 250,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xff383933),
                      width: strokeWidth,
                    ),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      'Quote of the Day',
                      style: GoogleFonts.bungee(
                        color: Color(0xff32312d),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          2,
                          (index) => Container(
                            width: 18,
                            height: 18,
                            margin: EdgeInsets.only(right: index < 2 ? 4 : 0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xff32312d),
                                width: strokeWidth,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(85),
                child: Row(
                  children: [
                    Icon(Icons.computer),
                    Column(
                      children: [
                        Text('Quote'),
                        Text('Author')
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
