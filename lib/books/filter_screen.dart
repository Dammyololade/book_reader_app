import 'package:book_reader_app/books/book_model.dart';
import 'package:book_reader_app/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// description:
/// project: book_reader_app
/// @package: books
/// @author: dammyololade
/// created on: 01/09/2020
///

class FilterScreen extends ModalRoute with UiKit {
  @override
  Duration get transitionDuration => Duration(milliseconds: 600);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(.1);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  ValueNotifier<List<BookCategory>> categoriesNotifier =
      ValueNotifier(BookModel().mainCategoryList);

  ValueNotifier<List<BookCategory>> subCategoriesNotifier =
  ValueNotifier(BookModel().subCategoryList);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    timeDilation = 1.0;
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: _buildOverlayContent(context),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Hero(
      tag: "container",
      child: Container(
        color: Color(0xff456CE4).withOpacity(.9),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Filter",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "AHeavy", fontSize: 30),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "AMedium",
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            height(20),
            Text("Lorem IPsum".toUpperCase(),
                style: TextStyle(
                    color: Colors.white.withOpacity(.8),
                    fontFamily: "AMedium",
                    fontSize: 18)),
            height(10),
            ValueListenableBuilder(
                valueListenable: categoriesNotifier,
                builder: (_, List<BookCategory> categories, ch) {
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    direction: Axis.horizontal,
                    children: [
                      ...categories
                          .map((e) => InkWell(
                        onTap: () {
                          var items = categoriesNotifier.value;
                          var index = items.indexOf(e);
                          e.selected = !e.selected;
                          items[index] = e;
                          categoriesNotifier.value = items;
                          categoriesNotifier.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 7, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white
                                  .withOpacity(e.selected ? 0.9 : .2),
                              borderRadius: BorderRadius.circular(2)),
                          child: Text(
                            e.title,
                            style: TextStyle(
                                color: e.selected
                                    ? Color(0xffB7B8C3)
                                    : Colors.white.withOpacity(.7),
                                fontFamily: "AMedium",
                                fontSize: 13),
                          ),
                        ),
                      ))
                          .toList(),
                    ],
                  );
                }),

            height(30),
            Text("Lorem IPsum".toUpperCase(),
                style: TextStyle(
                    color: Colors.white.withOpacity(.8),
                    fontFamily: "AMedium",
                    fontSize: 18)),
            height(10),
            ValueListenableBuilder(
                valueListenable: subCategoriesNotifier,
                builder: (_, List<BookCategory> categories, ch) {
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    direction: Axis.horizontal,
                    children: [
                      ...categories
                          .map((e) => InkWell(
                        onTap: () {
                          var items = subCategoriesNotifier.value;
                          var index = items.indexOf(e);
                          e.selected = !e.selected;
                          items[index] = e;
                          subCategoriesNotifier.value = items;
                          subCategoriesNotifier.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 7, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white
                                  .withOpacity(e.selected ? 0.9 : .2),
                              borderRadius: BorderRadius.circular(2)),
                          child: Text(
                            e.title,
                            style: TextStyle(
                                color: e.selected
                                    ? Color(0xffB7B8C3)
                                    : Colors.white.withOpacity(.7),
                                fontFamily: "AMedium",
                                fontSize: 13),
                          ),
                        ),
                      ))
                          .toList(),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return ScaleTransition(
      scale: animation,
      alignment: Alignment(-0.9, -0.55),
      child: child,
    );
  }
}

// color: Color(0xff6384E7),
