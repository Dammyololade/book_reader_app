import 'package:flutter/material.dart';

/// description: 
/// project: book_reader_app
/// @package: discover
/// @author: dammyololade
/// created on: 01/09/2020
///

class DiscoveryScreen extends StatefulWidget {
  @override
  _DiscoveryScreenState createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Discovery Coming soon"))
      ],
    );
  }
}
