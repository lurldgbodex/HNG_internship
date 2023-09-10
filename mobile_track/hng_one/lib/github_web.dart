import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GithubWebView extends StatefulWidget {
  const GithubWebView({super.key});

  @override
  State<GithubWebView> createState() => _GithubWebViewState();
}

class _GithubWebViewState extends State<GithubWebView> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://github.com/lurldgbodex/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gbodi Segun'),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
