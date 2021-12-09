package com.example.challenge_ui_plant_app

import android.net.wifi.WifiManager
import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  private val CHANNEL = "samples.flutter.dev/wifi"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)

    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result -> {
      
      val wifiManager = getApplicationContext().getSystemService(WIFI_SERVICE) as WifiManager
      result.success(wifiManager.isWifiEnabled())
    }
    }
  }
}
