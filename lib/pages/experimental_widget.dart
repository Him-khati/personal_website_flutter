import 'package:flutter/material.dart';

class SlidingBar extends StatefulWidget {
  @override
  _SlidingBarState createState() => _SlidingBarState();
}

class _SlidingBarState extends State<SlidingBar> {
  int _selectedIndex = 0;

  void _onSectionTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: _selectedIndex * 50.0,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
          ),
          Row(
            children: List.generate(4, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => _onSectionTap(index),
                  child: Container(
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text('Section ${index + 1}'),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}