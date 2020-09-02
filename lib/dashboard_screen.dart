import 'package:book_reader_app/books/book_model.dart';
import 'package:book_reader_app/books/filter_screen.dart';
import 'package:book_reader_app/ui_kit.dart';
import 'package:flutter/material.dart';

import 'books/book_list_screen.dart';

/// description:
/// project: book_reader_app
/// @package: 
/// @author: dammyololade
/// created on: 01/09/2020

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with UiKit {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(50),

          Row(
            children: [
              Text("Hi Sam",
                style: TextStyle(
                  fontFamily: "AHeavy",
                  fontSize: 30,
                  color: Color(0xff17244E),
                ),
              ),
              Spacer(),

              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("images/profile.jpg"),
              ),
              width(20),
            ],
          ),

          height(7),

          Text("we recommend the following \nbooks to you",
            style: TextStyle(
              fontFamily: "ARoman",
              fontSize: 16,
              color: Color(0xffBCBEC7),
            ),
          ),

          height(10),

          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, FilterScreen());
                },
                child: Hero(
                  tag: "container",
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    margin: EdgeInsets.only(right: 5, top: 5, bottom: 5),
                    child: Icon(Icons.sort, color: Colors.white,),
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [

                      ..._catitems(),
                    ],
                  ),
                ),
              ),
            ],
          ),

          height(20),

          Expanded(child: BookListWidget())
        ],
      ),
    );
  }

  List<Widget> _catitems() {
    return BookModel().mainCategoryList.map((e) =>
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.9),
                  blurRadius: 0.1,
                  spreadRadius: 0.2,
                ),
              ]
          ),
          child: Text("${e.title}",
            style: TextStyle(
                fontFamily: "AMedium",
                fontSize: 13,
                color: Color(0xffB8BAC2)
            ),
          ),
        )).toList();
  }
}
