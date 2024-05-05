


import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:friday/helpers/utils/app_error.dart';
import 'package:friday/helpers/utils/app_printer.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../helpers/utils/app_colors.dart';
import '../../helpers/utils/app_constants.dart';
import '../../helpers/utils/app_messages.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  final TextEditingController controller = TextEditingController();
  final RxList<Message> messages = <Message>[].obs;
  var inputText = ''.obs;
  var doneEncountered = false.obs;
  AppPrinter printer = AppPrinter();

  var status = 'online'.obs;
  var errorStatus = ''.obs;
  var buttonStatus = ''.obs; // while responding

  void completionHandler() async {
    String text = controller.text.trim();
    if (text.isNotEmpty) {
      buttonStatus.value = "thinking";
      messages.add(Message(sender: 'user', text: text, color: AppColors.bubbleColorSent));
      inputText.value = text.toString();
      controller.clear();
      await promptMethod(inputText.value);
      buttonStatus.value = "result";
    }
  }

  Future<void> promptMethod(String prompt) async {
    status.value = "busy";
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      status.value = "offline";
      errorStatus.value = 'warning';
      messages.add(Message(sender: 'bot', text: AppError.networkErrorMessage, color: AppColors.bubbleColorResponse));
      return;
    }

    String apiUrl = '${AppConstants.baseURL}/api/generate';
    // final responseMessage = <String>[];

    Map<String, dynamic> requestBody = {
      "model": AppConstants.modelName,
      "prompt": prompt,
    };

    String requestBodyJson = jsonEncode(requestBody);
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: requestBodyJson,
      );

      if (response.statusCode == 200) {
        final List<String> lines = response.body.split('\n');
        List<Map<String, dynamic>> parsedResponses = [];
        for (String line in lines) {
          if (line.trim().isNotEmpty) {
            final String trimmedLine = line.trim();
            if (trimmedLine.startsWith('{') && trimmedLine.endsWith('}')) {
              final Map<String, dynamic> jsonResponse = json.decode(trimmedLine);
              parsedResponses.add(jsonResponse);
            }
          }
        }
        // bool doneEncountered = false;
        StringBuffer responseBuffer = StringBuffer();
        for (final Map<String, dynamic> item in parsedResponses) {
          if (item['done'] == true) {
            doneEncountered.value = true;
          }
          if (!doneEncountered.value) {
            item.forEach((key, value) {
              printer.printWithTag("Key Value", "$key: $value");
            });
            printer.printWithTag("Lines", "------------");
            responseBuffer.write(item['response']);
          } else {
            item.forEach((key, value) {
              // print('$key: $value');
              printer.printWithTag("Key Value", "$key: $value");
            });
            printer.printWithTag("Lines", "------------");
            responseBuffer.write(item['response']);
            break;
          }
        }

        String finalResponse = responseBuffer.toString();
        printer.printWithTag("Response", finalResponse);

        if(doneEncountered.value = true){
          messages.add(Message(sender: 'bot', text: finalResponse, color: AppColors.bubbleColorResponse));
          status.value = "online";
        }

      } else {
        messages.add(Message(sender: 'bot', text: AppError.genericErrorMessage, color: AppColors.bubbleColorResponse));
         errorStatus.value = 'warning';
        status.value = "online";
      }
    } catch (e) {
      errorStatus.value = 'error';
      messages.add(Message(sender: 'bot', text: AppError.genericErrorMessage, color: AppColors.bubbleColorResponse));
      printer.printWithTag("Error", e.toString());
    }
  }

  void clearChat() {
    status.value = "clear";
    messages.clear();
    printer.printWithTag("Clear", "Clearing Chat");
  }
}