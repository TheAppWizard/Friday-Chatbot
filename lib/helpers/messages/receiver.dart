import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import 'dart:math' as math;

import '../../screens/chatscreen/chatscreen_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_trianglepainter.dart';
import '../widgets/app_typing_widget.dart';


class Receiver extends StatelessWidget {
  final String message;
  final Color color;

  const Receiver({super.key, required this.message, required this.color});

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.put(ChatController());
    final messageTextGroup = Flexible(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: CustomPaint(
            painter: Triangle(color!),
          ),
        ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            // child: AppText(text: message,color: Colors.white,fontFamily: "lufga",fontSize: 16,)

            child: TypingAnimationWidget(
              textList: [
                message,
              ],
              delay: const Duration(milliseconds: 100),
              textStyle: const TextStyle(color: Colors.white,fontFamily: "lufga",fontSize: 16,),
            ),

            // child: const SpinKitRipple(color: Colors.white,),
          ),
        ),
      ],
    ));

    return Padding(
      padding: const EdgeInsets.only(right: 50.0, left: 18, top: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: !(chatController.errorStatus.value == "warning"),
              child: Transform.rotate(angle: 45 * (3.141592653589793 / 180),child: const Icon(Icons.square,color: AppColors.textColor,size: 18,),)),
          Visibility(
              visible: chatController.errorStatus.value == "warning",
              child: const Icon(Icons.warning_amber,color: AppColors.warningColor,)),
          Visibility(
              visible: chatController.errorStatus.value == "error",
              child: const Icon(Icons.error_outline,color: AppColors.errorColor,)),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const SizedBox(height: 30),
              messageTextGroup,
            ],
          ),
        ],
      ),
    );
  }
}
