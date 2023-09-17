import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyGithubScreen extends StatefulWidget {
  const MyGithubScreen({super.key});
  static const route = '/github';

  @override
  State<MyGithubScreen> createState() => _MyGithubScreenState();
}

class _MyGithubScreenState extends State<MyGithubScreen> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse("https://github.com/lurldgbodex"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Github"),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
