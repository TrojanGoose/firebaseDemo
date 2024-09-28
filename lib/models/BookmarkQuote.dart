import 'package:hive/hive.dart';

part 'BookmarkQuote.g.dart';

@HiveType(typeId: 0)
class Bookmarkquote extends HiveObject {
  @HiveField(0)
  late String quote;

  @HiveField(1)
  late String author;

  Bookmarkquote({required this.quote, required this.author});
}