

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../helpers/messages/receiver.dart';
import '../../helpers/messages/sender.dart';
import '../../helpers/utils/app_colors.dart';
import '../../helpers/widgets/app_text.dart';
import 'chatscreen_controller.dart';

class ChatScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: Transform.rotate(angle: 45 * (3.141592653589793 / 180),
          child:  const
          Icon(Icons.square,
            color: AppColors.textColor,size: 18,),),
        title:  const AppText(text: "F R I D A Y", color: AppColors.textColor, fontFamily: "lugfa", fontSize: 20,fontWeight: FontWeight.w400,),
        actions: [


          IconButton(onPressed: (){
            chatController.clearChat();

          }, icon:  Icon(Icons.clear_all_outlined, color: AppColors.textColor.withOpacity(1),size: 25,)),

          IconButton(onPressed: (){
            Get.snackbar(
              "Friday Model : foodie_friday_llama2",
              "Created By Shreyas Bhike | The App Wizard",
              backgroundColor: AppColors.textColor.withOpacity(0.3),
              snackPosition: SnackPosition.BOTTOM,
              colorText: AppColors.textColor// Position
            );

          }, icon:  Icon(Icons.info_outline_rounded, color: AppColors.textColor.withOpacity(1),size: 25,)),
        ],
      ),
      body: Obx(() =>  Container(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: chatController.messages.length,
                  itemBuilder: (context, index) {
                    return chatController.messages[index].sender == 'user'
                        ? Sender(
                      color: chatController.messages[index].color,
                      message: chatController.messages[index].text,
                    )
                        : Receiver(
                      color: chatController.messages[index].color,
                      message: chatController.messages[index].text,
                    );
                  },
                )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: chatController.controller,
                      style: const TextStyle(color: AppColors.textColor),
                      decoration: InputDecoration(
                        hintText: 'Type a message...Your Prompt',
                        hintStyle: TextStyle(color: AppColors.textColor.withOpacity(0.2),fontFamily: 'lufga',fontWeight: FontWeight.normal),
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: AppColors.textColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Visibility(
                    visible: (chatController.buttonStatus.value == "thinking"),
                    child: const SpinKitPulse(color: AppColors.textColor),),
                  Visibility(
                    visible: !(chatController.buttonStatus.value == "thinking"),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      // borderRadius: BorderRadius.circular(25),
                      onTap: chatController.completionHandler,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color:  AppColors.bubbleColorSent,
                        ),
                        child: const SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(Icons.send, color: AppColors.textColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,)
          ],
        ),
      ),)
    );
  }
}