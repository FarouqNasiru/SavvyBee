import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class WebsiteScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebsiteScreen({
    super.key,
    required this.url,
    this.title = 'Website',
  });

  @override
  State<WebsiteScreen> createState() => _WebsiteScreenState();
}

class _WebsiteScreenState extends State<WebsiteScreen> {
  late final WebViewController _controller;
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
          onNavigationRequest: (navigation) {
            // You can add custom navigation handling here
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  // Handle back button press
  Future<bool> _onWillPop() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
      return false; // Don't pop the route
    } else {
      return true; // Pop the route to go back to previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            // WebView takes full screen
            WebViewWidget(
              controller: _controller,
            ),
            // Loading indicator at top
            if (loadingPercentage < 100)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: LinearProgressIndicator(
                  value: loadingPercentage / 100.0,
                  backgroundColor: Colors.transparent,
                  minHeight: 2,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
