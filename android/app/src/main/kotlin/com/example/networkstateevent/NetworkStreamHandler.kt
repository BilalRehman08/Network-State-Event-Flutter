package com.raywenderlich.platform_channel_events

import android.app.Activity
import android.content.Context
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.os.Build
import androidx.annotation.RequiresApi
import io.flutter.plugin.common.EventChannel

class NetworkStreamHandler(private var activity: Activity?) : EventChannel.StreamHandler {
    private var eventSink: EventChannel.EventSink? = null

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
        startListeningNetworkChanges()

    }

    override fun onCancel(arguments: Any?) {}

    private val networkCallback = @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    object : ConnectivityManager.NetworkCallback() {

    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun startListeningNetworkChanges() {
        val manager = activity?.getSystemService(Context.CONNECTIVITY_SERVICE) as? ConnectivityManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            manager?.registerDefaultNetworkCallback(networkCallback)
        } else {
            val request = NetworkRequest.Builder()
                .addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                .build()
            manager?.registerNetworkCallback(request, networkCallback)
        }
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun stopListeningNetworkChanges() {
        val manager = activity?.getSystemService(Context.CONNECTIVITY_SERVICE) as? ConnectivityManager
        manager?.unregisterNetworkCallback(networkCallback)
    }

}