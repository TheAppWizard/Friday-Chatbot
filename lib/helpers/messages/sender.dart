import 'package:flutter/material.dart';

import '../utils/app_trianglepainter.dart';
import '../widgets/app_text.dart';


class Sender extends StatelessWidget {
  final String message;
  final Color color;
  const Sender({super.key, required this.message, required this.color});

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: AppText(text: message,color: Colors.white,fontFamily: "lufga",fontSize: 16,)
              ),
            ),
            CustomPaint(painter: Triangle(color)),
          ],
        ));

    return Padding(
      padding: const EdgeInsets.only(right: 18.0, left: 50, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 30),
          messageTextGroup,
        ],
      ),
    );
  }
}
