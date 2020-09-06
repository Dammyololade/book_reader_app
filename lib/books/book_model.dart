import 'package:flutter/material.dart';

/// description:
/// project: book_reader_app
/// @package: books
/// @author: dammyololade
/// created on: 01/09/2020

class BookModel {
  List<BookCategory> get mainCategoryList => [
        BookCategory("Language"),
        BookCategory("Geography"),
        BookCategory("Education"),
        BookCategory("Romantic novels"),
        BookCategory("Fictions"),
        BookCategory("Light"),
        BookCategory("Drama"),
        BookCategory("Play"),
        BookCategory("Action"),
        BookCategory("Livid"),
        BookCategory("Philosophy"),
        BookCategory("Romantic"),
        BookCategory("Tourism"),
        BookCategory("Filter")
      ];

  List<BookCategory> get subCategoryList => [
        BookCategory("Literary Theory"),
        BookCategory("History"),
        BookCategory("Explore"),
        BookCategory("Food"),
        BookCategory("Electronic"),
        BookCategory("Drama Sketch"),
        BookCategory("Joke"),
        BookCategory("Play"),
        BookCategory("Action"),
        BookCategory("Livid"),
        BookCategory("Philosphy"),
        BookCategory("Romantic Novels"),
        BookCategory("Tourism"),
        BookCategory("Science Fiction"),
        BookCategory("Adventure")
      ];

  String category;

  List<Book> get books => [
        Book("Magic Forest", "Alice Bradley", 4.3, "image_1", "Philosophy"),
        Book("The Deep", "Curline Wailanay", 4.3, "image_9", "Drama"),
        Book("Book Mock Up", "Alice Mock", 5.0, "image_3", "Fairy Tales"),
        Book("From Pain To Gain", "Fortune Legoabe", 4.3, "image_4",
            "TV Series"),
        Book("Zukerx", "Eric William", 4.3, "image_6", "Play"),
        Book("Queenie", "Candice Carty-Williams", 4.3, "image_7", "Drama"),
        Book("Tales For My Dog", "David Hedenstain", 4.0, "image_2",
            "Literature"),
      ];

  static String get lorem =>
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
      "Nunc commodo lacinia odio id vestibulum. Aliquam tincidunt eu leo nec suscipit. "
      "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis "
      "egestas. Sed eget consectetur sapien, sed varius erat. Cras non nibh sed sapien "
      "consequat commodo. Phasellus rhoncus sapien tortor, et eleifend quam accumsan ac."
      " Nulla hendrerit ac ligula sed vulputate. Pellentesque habitant morbi tristique "
      "senectus et netus et malesuada fames ac turpis egestas. Sed id ante gravida lacus "
      "cursus dignissim. Praesent libero tellus, bibendum id ipsum et, tristique vehicula "
      "urna. Aenean lacinia mauris congue tellus pharetra, vel mollis arcu viverra. Sed "
      "tempor erat mauris, sed venenatis erat placerat vitae. "
      "Pellentesque a eros ipsum. Nulla non urna a arcu interdum vehicula at ac eros.\n"
      "Maecenas felis lacus, viverra nec purus nec, ultricies scelerisque ligula. Donec "
      "ultrices, leo eget rutrum interdum, elit odio cursus elit, in rhoncus felis nibh "
      "ac lacus. Nulla mi nibh, tempor et volutpat vulputate, consectetur quis libero. "
      "Sed nec arcu vitae quam cursus ornare et quis lectus. Duis tincidunt nisl at "
      "suscipit tincidunt. Donec ultrices tristique neque. Aliquam euismod porttitor "
      "condimentum. Fusce tincidunt lacinia tincidunt. Integer commodo blandit elementum. "
      "Nulla facilisi. Fusce nec luctus mi, at rutrum magna. Nam varius sit"
      " amet sem nec dignissim.";
}

class Book {
  String title, author, image, category;
  double rating;
  List<String> favImages;

  Book(this.title, this.author, this.rating, this.image, this.category);

  List<Comment> get comments => [
        Comment("face_1", "Opeyemi", BookModel.lorem, "12-27 01:23", 23, 10),
        Comment("face_2", "Adeyemi", BookModel.lorem, "11-27 11:23", 93, 28),
        Comment("face_3", "Tomi", BookModel.lorem, "10-27 10:21", 19, 48),
        // Comment("face_4", "Feranmi", BookModel.lorem, "09-27 09:23", 58, 19),
        // Comment("face_5", "Olanrewaju", BookModel.lorem, "08-27 04:37", 86, 69),
        // Comment("face_6", "Brighton", BookModel.lorem, "07-27 06:23", 28, 78),
      ];

  List<Book> get similarBooks =>
      BookModel().books.where((element) => element.title != title).toList();
}

class Comment {
  String image, name, comment, date;
  int likes, responses;

  Comment(this.image, this.name, this.comment, this.date, this.likes,
      this.responses);
}

class BookCategory {
  String title;
  bool selected;

  BookCategory(this.title, {this.selected = false});
}
