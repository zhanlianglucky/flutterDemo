package com.hzl.flutter_demo

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private var chanel = "com.flutter.io/battery"//通道

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    initFlutterMethodChannel()
  }

  /**
   * 初始化交互方法
   */
 private fun initFlutterMethodChannel() {
    MethodChannel(flutterView, chanel).setMethodCallHandler { call, result ->
      if (call.method == "getBatteryInfo"){//对接方法
        var batteryInfo = getBatteryInfo()
        if (batteryInfo != -1){//判断是否获取成功
          result.success(batteryInfo)
        } else {
          result.error("UNAVAILABLE", "Battery level not available.", null)
        }
      } else {
        result.notImplemented()//未实现
      }
    }
  }

  /**
   * 获取电池电量
   * 原生方法，有需要请自行实现
   */
  private fun getBatteryInfo() :Int {
    return 1
  }

}
