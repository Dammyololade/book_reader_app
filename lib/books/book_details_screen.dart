import 'dart:ui';

import 'package:book_reader_app/books/book_model.dart';
import 'package:book_reader_app/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// description:
/// project: book_reader_app
/// @package: books
/// @author: dammyololade
/// created on: 06/09/2020

class BookDetailsScreen extends StatefulWidget {
  Book book;

  BookDetailsScreen(this.book);

  @override
  _BookDetailsScreenState createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> with UiKit {
  Book get book => widget.book;

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 60),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("images/${book.image}.jpg"),
                      fit: BoxFit.cover,
                    )),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.black.withOpacity(.1),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 20,
                      right: 0,
                      child: Row(
                        children: [
                          Hero(
                            tag: "${book.image}",
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(.5),
                                        spreadRadius: 1.0,
                                        blurRadius: 5.0),
                                  ]),
                              child: Image.asset(
                                "images/${book.image}.jpg",
                                height: 220,
                                width: 130,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          width(20),
                          Expanded(
                            child: Hero(
                              tag: "${book.title}",
                              child: Material(
                                type: MaterialType.transparency,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      book.title,
                                      style: TextStyle(
                                          fontFamily: "ABlack",
                                          fontSize: 24,
                                          color: Colors.white),
                                    ),
                                    height(7),
                                    Text(
                                      "By ${book.author}",
                                      style: TextStyle(
                                          fontFamily: "AMedium",
                                          fontSize: 18,
                                          color: Color(0xffD2D3DB)),
                                    ),
                                    height(7),
                                    Text(
                                      "${book.category}",
                                      style: TextStyle(
                                          fontFamily: "AMedium",
                                          fontSize: 16,
                                          color: Color(0xffD2D3DB),
                                          fontStyle: FontStyle.italic),
                                    ),
                                    height(7),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Color(0xffFBD73A),
                                        ),
                                        width(3),
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Color(0xffFBD73A),
                                        ),
                                        width(3),
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Color(0xffFBD73A),
                                        ),
                                        width(3),
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Color(0xffFBD73A),
                                        ),
                                        width(3),
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Color(0xffA29578),
                                        ),
                                        width(5),
                                        Text("${book.rating}",
                                            style: TextStyle(
                                                fontFamily: "AHeavy",
                                                fontSize: 14,
                                                color: Color(0xffFBD73A))),
                                      ],
                                    ),
                                    height(48),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.library_add,
                                          color: Color(0xffC7C9D5),
                                        ),
                                        width(5),
                                        Text("37k",
                                            style: TextStyle(
                                                fontFamily: "AMedium",
                                                fontSize: 14,
                                                color: Color(0xffC7C9D5))),
                                        width(20),
                                        Icon(
                                          Icons.favorite_border,
                                          color: Color(0xffC7C9D5),
                                        ),
                                        width(5),
                                        Text("12k",
                                            style: TextStyle(
                                                fontFamily: "AMedium",
                                                fontSize: 14,
                                                color: Color(0xffC7C9D5))),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(top: 15),
                //color: Colors.white,
                width: 120,
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
                              border: Border.all(
                                  color: Colors.white, width: 1)
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
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height(5),
                  Text(
                    "Details",
                    style: TextStyle(
                        fontFamily: "AHeavy",
                        fontSize: 22,
                        color: Color(0xff353C55).withOpacity(.8)),
                  ),
                  height(5),
                  Text(
                    BookModel.lorem,
                    style: TextStyle(
                      fontFamily: "ABook",
                      fontSize: 16,
                      color: Color(0xff8E9096),
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  height(15),
                  Divider(
                    height: 20,
                  ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "Check the catalog",
                  //       style: TextStyle(
                  //           fontFamily: "AHeavy",
                  //           fontSize: 22,
                  //           color: Color(0xff353C55).withOpacity(.8)),
                  //     ),
                  //     Spacer(),
                  //     Icon(
                  //       Icons.arrow_forward_ios,
                  //       color: Color(0xffC9CACE),
                  //       size: 18,
                  //     )
                  //   ],
                  // ),
                  // Divider(
                  //   height: 20,
                  // ),
                  height(10),
                  Row(
                    children: [
                      Text(
                        "Comment",
                        style: TextStyle(
                            fontFamily: "AHeavy",
                            fontSize: 22,
                            color: Color(0xff353C55).withOpacity(.8)),
                      ),
                      Spacer(),
                      Text(
                        "327reviews",
                        style: TextStyle(
                            fontFamily: "AMedium",
                            fontSize: 16,
                            color: Color(0xffC9CACE)),
                      ),
                      width(5),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xffC9CACE),
                        size: 18,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (ct, index) {
              var comment = book.comments[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage:
                          AssetImage("images/${comment.image}.jpg"),
                    ),
                    width(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${comment.name}",
                            style: TextStyle(
                                fontFamily: "AMedium",
                                fontSize: 16,
                                color: Color(0xff51576C)),
                          ),
                          height(1),
                          Text(
                            "${comment.comment}",
                            style: TextStyle(
                                fontFamily: "ABook",
                                fontSize: 14,
                                color: Color(0xff797A81)),
                            maxLines: 2,
                          ),
                          height(10),
                          Row(
                            children: [
                              Text("${comment.date}",
                                  style: TextStyle(
                                      fontFamily: "ARoman",
                                      fontSize: 13,
                                      color: Color(0xffC7C9D5))),
                              Spacer(),
                              Icon(
                                Icons.favorite_border,
                                color: Color(0xffC7C9D5),
                                size: 18,
                              ),
                              width(5),
                              Text("${comment.likes}",
                                  style: TextStyle(
                                      fontFamily: "ARoman",
                                      fontSize: 13,
                                      color: Color(0xffC7C9D5))),
                              width(15),
                              Icon(
                                Icons.mail_outline,
                                color: Color(0xffC7C9D5),
                                size: 18,
                              ),
                              width(5),
                              Text("${comment.responses}",
                                  style: TextStyle(
                                      fontFamily: "ARoman",
                                      fontSize: 13,
                                      color: Color(0xffC7C9D5))),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            childCount: book.comments.length,
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Similar books",
                        style: TextStyle(
                            fontFamily: "AHeavy",
                            fontSize: 22,
                            color: Color(0xff353C55).withOpacity(.8)),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xffC9CACE),
                        size: 18,
                      ),
                      width(20),
                    ],
                  ),

                  height(10),

                  Container(
                    height: 150,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: book.similarBooks.length,
                      itemBuilder: (ct, index) {
                        var item = book.similarBooks[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            width: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "images/${item.image}.jpg",
                                  height: 100,

                                  fit: BoxFit.cover,
                                ),
                                height(10),
                                Text("${item.title}",
                                  style: TextStyle(
                                    fontSize: 10,
                                      color: Color(0xff353C55).withOpacity(.8),
                                    fontFamily: "ABlack"
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
