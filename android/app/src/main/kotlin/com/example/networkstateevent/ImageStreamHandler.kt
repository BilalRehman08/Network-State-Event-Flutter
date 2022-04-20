package com.raywenderlich.platform_channel_events
import android.app.Activity
import io.flutter.plugin.common.EventChannel

class ImageStreamHandler(private var activity: Activity?) : EventChannel.StreamHandler {

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    }

    override fun onCancel(arguments: Any?) {
    }
}