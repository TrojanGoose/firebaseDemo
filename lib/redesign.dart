import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_test/models/mydata.dart';
import 'package:carousel_test/services/firestore_service.dart';

const double strokeWidth = 2.0;

class Redesign extends StatefulWidget {
  const Redesign({super.key});

  @override
  State<Redesign> createState() => _RedesignState();
}

class _RedesignState extends State<Redesign> {
  final FirestoreService _firestoreService = FirestoreService();
  late Future<Mydata> _quoteOfTheDay;

  @override
  void initState() {
    super.initState();
    _quoteOfTheDay = _firestoreService.fetchQuoteOfTheDay();
  }

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
              BoxShadow(
                color: Color(0xff363437),
                offset: Offset(6, 6),
              ),
            ],
          ),
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: FutureBuilder<Mydata>(
                    future: _quoteOfTheDay,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        final quoteData = snapshot.data!;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              quoteData.quote,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            Text(
                              '- ${quoteData.author}',
                              style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      } else {
                        return Center(child: Text('No quote available'));
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}