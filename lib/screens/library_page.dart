import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookmate/models/book.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final Map<int, Widget> _segments = const {
    0: Text('Reading'),
    1: Text('Read'),
  };
  int _selectedSegment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSegmentedControl<int>(
              children: _segments,
              onValueChanged: (int value) {
                setState(() {
                  _selectedSegment = value;
                });
              },
              groupValue: _selectedSegment,
            ),
          ),
          // Expanded(
          //   child: // ListView.builder or similar to display _books filtered by selected segment
          // ),
        ],
      ),
    );
  }
}
