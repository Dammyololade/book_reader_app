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
                      Icon(Icons.star, size: 15, color: Color(0xffFEF0B7),),
                      width(5),
                      Text("${item.rating}",
                        style: TextStyle(
                            fontFamily: "AHeavy",
                            fontSize: 12,
                            color: Color(0xffFBD73C))
                        ),
                    ],
                  ),
                  height(10),
                  Container(
                    width: 200,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage("images/face_1.jpg"),
                        ),
                        Positioned(
                          left: 25,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("images/face_2.jpg"),
                          ),
                        ),
                        Positioned(
                          left: 50,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("images/face_3.jpg"),
                          ),
                        ),
                        Positioned(
                          left: 75,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                              border: Border.all(color: Colors.white, width: 1)
                            ),
                            child: Center(
                              child: Text("32+",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: "AHeavy"
                                ),
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
          );
        });
  }
}
