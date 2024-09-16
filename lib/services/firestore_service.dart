import 'dart:convert';

import 'package:carousel_test/models/mydata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Mydata> fetchQuoteOfTheDay() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedQuoteString = prefs.getString('cachedQuote');
    DateTime now = DateTime.now();
    DateTime startOfDay = DateTime(now.year, now.month, now.day);

    // Check if we have a cached quote for today
    if (cachedQuoteString != null) {
      Map<String, dynamic> cachedQuoteMap = jsonDecode(cachedQuoteString);
      DateTime cachedDate = DateTime.parse(cachedQuoteMap['cacheDate']);
      
      if (cachedDate.isAfter(startOfDay)) {
        return Mydata.fromJson(cachedQuoteMap);
      }
    }

    // If no valid cached quote, fetch from Firestore
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('Words')
          .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
          .orderBy('date')
          .limit(1)
          .get();

      Mydata quoteData;
      if (querySnapshot.docs.isNotEmpty) {
        quoteData = Mydata.fromFirestore(querySnapshot.docs.first.data() as Map<String, dynamic>);
      } else {
        // If no quote for today, get a random quote
        QuerySnapshot allQuotes = await _firestore.collection('Words').get();
        if (allQuotes.docs.isNotEmpty) {
          var randomDoc = allQuotes.docs[now.day % allQuotes.docs.length];
          quoteData = Mydata.fromFirestore(randomDoc.data() as Map<String, dynamic>);
        } else {
          quoteData = Mydata(
            quote: "No quotes available",
            author: "System",
            date: now,
          );
        }
      }

      // Cache the new quote
      Map<String, dynamic> quoteMap = quoteData.toJson();
      quoteMap['cacheDate'] = now.toIso8601String();
      await prefs.setString('cachedQuote', jsonEncode(quoteMap));

      return quoteData;
    } catch (e) {
      print('Error fetching quote: $e');
      // Return a default quote in case of any error
      return Mydata(
        quote: "Error fetching quote",
        author: "System",
        date: now,
      );
    }
  }
}