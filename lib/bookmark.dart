import 'package:carousel_test/redesign.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:carousel_test/models/BookmarkQuote.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  late Box<Bookmarkquote> _favoritesBox;

  @override
  void initState() {
    super.initState();
    _favoritesBox = Hive.box<Bookmarkquote>('bookmarks'); // Open the Hive box for bookmarks
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xffc4e7e3),
      appBar: AppBar(
        backgroundColor: Color(0xffc4e7e3),
       leading: IconButton(
    icon: Icon(Icons.arrow_back_ios),
    onPressed: () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Redesign()),
      );
    },
  ),
      ),
      body: _favoritesBox.isEmpty
          ? Center(child: Text('No bookmarks added yet.'))
          : ListView.builder(
              itemCount: _favoritesBox.length,
              itemBuilder: (context, index) {
                final bookmark = _favoritesBox.getAt(index);

                /*return ListTile(
                  title: Text(bookmark?.quote ?? 'No Quote'),
                  subtitle: Text(bookmark?.author ?? 'Unknown Author'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Delete the bookmark
                      _favoritesBox.deleteAt(index);
                      setState(() {}); // Refresh the UI after deletion
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Bookmark removed')),
                      );
                    },
                  ),
                );*/
                return Container(
  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  decoration: BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: Color(0xff383933),
        width: 1,
      ),
    ),
  ),
  child: ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    leading: Row(
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
              width: 1,
            ),
          ),
        ),
      ),
    ),
    title: Text(
      bookmark?.quote ?? 'No Quote',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),
    subtitle: Text(
      bookmark?.author ?? 'Unknown Author',
      style: TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.italic,
      ),
    ),
    trailing: IconButton(
      icon: Icon(Icons.delete),
      onPressed: () {
        // Delete the bookmark
        _favoritesBox.deleteAt(index);
        setState(() {}); // Refresh the UI after deletion
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bookmark removed')),
        );
      },
    ),
  ),
);
              },
            ),
    );
  }
}
