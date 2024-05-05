

import 'dart:async';
import 'package:flutter/material.dart';

class TypingAnimationWidget extends StatefulWidget {
  final List<String> textList;
  final Duration delay;
  final TextStyle textStyle;

  const TypingAnimationWidget({super.key,
    required this.textList,
    required this.delay,
    required this.textStyle,
  });

  @override
  _TypingAnimationWidgetState createState() => _TypingAnimationWidgetState();
}

class _TypingAnimationWidgetState extends State<TypingAnimationWidget> {
  late List<String> _lines;
  late List<String> _currentTexts;
  late Timer _timer;
  int _currentIndex = 0;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _lines = widget.textList;
    _currentTexts = List.filled(_lines.length, '');
    _startTyping();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.delay, (_) {
      if (_currentIndex < _lines.length) {
        setState(() {
          _isTyping = true;
          _currentTexts[_currentIndex] =
              _lines[_currentIndex].substring(0, _currentTexts[_currentIndex].length + 1);
        });

        if (_currentTexts[_currentIndex].length == _lines[_currentIndex].length) {
          _currentIndex++;
          if (_currentIndex == _lines.length) {
            _timer.cancel();
          }
        }
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _currentTexts.map((text) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            text,
            style: widget.textStyle,
            overflow: TextOverflow.clip,
          ),
        );
      }).toList(),
    );
  }
}


// TypingAnimationWidget(
// textList: [
// 'This is a very long line that should automatically wrap to multiple lines in the widget to demonstrate dynamic multiline text handling.',
// ],
// delay: Duration(milliseconds: 100),
// textStyle: TextStyle(fontSize: 18.0),
// ),