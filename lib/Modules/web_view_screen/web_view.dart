import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

dynamic controller = WebViewController()
..setJavaScriptMode(JavaScriptMode.unrestricted)
..setBackgroundColor(const Color(0x00000000))
..setNavigationDelegate(
NavigationDelegate(
onNavigationRequest: (NavigationRequest request) {
if (request.url.startsWith('https://www.youtube.com/')) {
return NavigationDecision.prevent;
}
return NavigationDecision.navigate;
},
),
);


class WebViewScreen extends StatelessWidget {
  final String url;
  const WebViewScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller..loadRequest(Uri.parse(url)),)
    );
  }
}
