import 'package:flutter/material.dart';

/// description:
/// project: book_reader_app
/// @package: profile
/// @author: dammyololade
/// created on: 01/09/2020

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Profile Coming soon"))],
    );
  }
}
