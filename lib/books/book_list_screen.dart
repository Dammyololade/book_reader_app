import 'package:book_reader_app/books/book_model.dart';
import 'package:book_reader_app/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

/// description:
/// project: book_reader_app
/// @package: books
/// @author: dammyololade
/// created on: 02/09/2020

class BookListWidget extends StatefulWidget {
  @override
  _BookListWidgetState createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> with UiKit{
  var listKey = GlobalKey<AnimatedListState>();
  double page = 0.0;
  var _pageController = PageController();
  List<Book> items = BookModel().books;

  @override
  void initState() {
    _pageController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    setState(() {
      page = _pageController.page;
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_scrollListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: listKey,
        scrollDirection: Axis.horizontal,
        physics: PageScrollPhysics(),
        controller: _pageController,
        initialItemCount: items.length,
        itemBuilder: (ct, index, animation) {
          var item = items[index];
          final percent = page - page.floor();
          final factor = percent > 0.5 ? (1 - percent) : percent;
          return Transform(
            transform: Matrix4.identity()..setEntry(3, 2, 0.0001)
                ..rotateY(vector.radians(90 * factor)),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 5,
                    margin: EdgeInsets.only(top: 10, right: 20),
                    child: Image.asset(
                        "images/${item.image}.jpg",
                      height: 280,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),

                  height(20),

                  Text(item.title,
                    style: TextStyle(
                        fontFamily: "ABlack",
                        fontSize: 16
                    ),
                  ),

                  height(7),

                  Text("By ${item.author}",
                    style: TextStyle(
                        fontFamily: "AMedium",
                        fontSize: 14,
                      color: Color(0xffD2D3DB)
                    ),
                  ),
                  height(4),
                  Row(
                    children: [
                      Icon(Icons.star, size: 15, color: Color(0xffFBD73C),),
                      width(3),
                      Icon(Icons.star, size: 15, color: Color(0xffFBD73C),),
                      width(3),
                      Icon(Icons.star, size: 15, color: Color(0xffFBD73C),),
                      width(3),
                      Icon(Icons.star, size: 15, color: Color(0xffFBD73C),),
                      width(3),
                      Icon(Icons.star, size: 15, color: Color(0xffFBD73C),),
                    ],
                  )

                ],
              ),
            ),
          );
        });
  }
}
