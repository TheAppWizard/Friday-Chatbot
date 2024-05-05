import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:friday/helpers/utils/app_colors.dart';
import 'package:friday/screens/chatscreen/chatscreen.dart';
import 'package:get/get.dart';



//  MARK: Instagram
//  TheAppWizard
//  MARK: @theappwizard2408

//Model : foodie_friday_llama2


void main() {
  runApp(const MyApp());
}














class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Root(navigationName: '',),
    );
  }
}

class Root extends StatefulWidget {
  final String navigationName;
  const Root({super.key, required this.navigationName});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6), () {
      Get.offAll(ChatScreen(),transition: Transition.topLevel,duration: const Duration(seconds: 3));
    });
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFoldingCube(color: Colors.white,size: 100,),
          ],
        ),
      ),
    );
  }
}

