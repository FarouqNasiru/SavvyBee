package com.example.savvybee

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.webviewflutter.WebViewFlutterPlugin

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        flutterEngine.plugins.add(WebViewFlutterPlugin())
        super.configureFlutterEngine(flutterEngine)
    }
}