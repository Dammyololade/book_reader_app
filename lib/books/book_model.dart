import 'package:flutter/material.dart';

/// description: 
/// project: book_reader_app
/// @package: books
/// @author: dammyololade
/// created on: 01/09/2020

class BookModel {

  List<BookCategory> get mainCategoryList => [
    BookCategory("Language"), BookCategory("Geography"), BookCategory("Education"),
    BookCategory("Romantic novels"),
    BookCategory("Fictions"), BookCategory("Light"), BookCategory("Drama"),
    BookCategory("Play"), BookCategory("Action"), BookCategory("Livid"),
    BookCategory("Philosophy"), BookCategory("Romantic"), BookCategory("Tourism"),
    BookCategory("Filter")
  ];

  List<BookCategory> get subCategoryList => [
    BookCategory("Literary Theory"), BookCategory("History"), BookCategory("Explore"),
    BookCategory("Food"),
    BookCategory("Electronic"), BookCategory("Drama Sketch"), BookCategory("Joke"),
    BookCategory("Play"), BookCategory("Action"), BookCategory("Livid"),
    BookCategory("Philosphy"), BookCategory("Romantic Novels"), BookCategory("Tourism"),
    BookCategory("Science Fiction"), BookCategory("Adventure")
  ];

  String category;

  List<Book> get books => [
    Book("The Magic Forest", "Alice Bradley", 4.3, "image_1"),
    Book("Between The Deep", "Curline Wailanay", 4.3, "image_9"),
    Book("Book Mock Up", "Alice Mock", 5.0, "image_3"),
    Book("From Pain To Gain", "Fortune Legoabe", 4.3, "image_4"),
    Book("Zukerx", "Eric William", 4.3, "image_6"),
    Book("Queenie", "Candice Carty-Williams", 4.3, "image_7"),
    Book("Tales For My Dog", "David Hedenstain", 4.0, "image_2"),
  ];
}

class Book {
  String title, author, image;
  double rating;
  List<String> favImages;
  Book(this.title, this.author, this.rating, this.image);
}

class BookCategory {
  String title;
  bool selected;

  BookCategory(this.title, {this.selected = false});
}


