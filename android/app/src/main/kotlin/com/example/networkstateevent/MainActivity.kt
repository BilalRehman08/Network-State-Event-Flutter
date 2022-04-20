package com.example.networkstateevent

import com.raywenderlich.platform_channel_events.NetworkStreamHandler
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel

class MainActivity: FlutterActivity() {
    private val networkEventChannel = "platform_channel_events/connectivity"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, networkEventChannel)
            .setStreamHandler(NetworkStreamHandler(this))

    }
}
