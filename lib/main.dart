import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'src/web_view_stack.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
import 'src/navigation_controls.dart';
import 'src/menu.dart';


void main() {
  runApp(
    const MaterialApp(
      home: WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  final controller = Completer<WebViewController>();



  Future<void> initPlatformState()async{
    OneSignal.shared.setAppId("");
  }

  @override
  void initState() {
    initPlatformState();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title',style: TextStyle(color: Color(0xffa52729),fontWeight: FontWeight.bold,fontSize: 28),),
        centerTitle: false,
        backgroundColor: Color(0xfff9f9f9),
        elevation: 0,
        actions: [
          NavigationControls(controller: controller),
          Menu(controller: controller),
        ],
      ),
      body: WebViewStack(controller: controller),
    );
  }
}