package com.clearpath.xray_flutter.service

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Intent
import android.content.pm.ServiceInfo
import android.net.VpnService
import android.os.Build
import android.os.ParcelFileDescriptor
import com.clearpath.xray_flutter.core.Utils
import libv2ray.CoreCallbackHandler
import libv2ray.CoreController
import libv2ray.Libv2ray

class SimpleVpnService : VpnService() {
    private var vpnInterface: ParcelFileDescriptor? = null
    private lateinit var coreController: CoreController

    companion object {
        const val CHANNEL_ID = "vpn_service_channel"
    }

    override fun onCreate() {
        super.onCreate()
        // Initialize Libv2ray environment
        Libv2ray.initCoreEnv(filesDir.absolutePath, Utils.getDeviceIdForXUDPBaseKey())
        coreController = Libv2ray.newCoreController(object : CoreCallbackHandler {
            override fun onEmitStatus(p0: Long, p1: String?): Long = 0
            override fun shutdown(): Long = 0
            override fun startup(): Long = 0
        })
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (intent?.action == "STOP_VPN") {
            stopV2Ray()
            stopSelf()
            return START_NOT_STICKY
        }

        val config = intent?.getStringExtra("config")
        // val socksPort = intent?.getIntExtra("socksPort", 10808) ?: 10808

        if (config == null) {
            // If config is null, it might be a stop command or restart without config
            // For now, just return
            return START_NOT_STICKY
        }

        // Start Foreground Service
        createNotificationChannel()
        val notification = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
             Notification.Builder(this, CHANNEL_ID)
                .setContentTitle("XRay VPN")
                .setContentText("VPN is running")
                .setSmallIcon(android.R.drawable.ic_dialog_info)
                .build()
        } else {
             Notification.Builder(this)
                .setContentTitle("XRay VPN")
                .setContentText("VPN is running")
                .setSmallIcon(android.R.drawable.ic_dialog_info)
                .build()
        }
        
        if (Build.VERSION.SDK_INT >= 34) {
            startForeground(1, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_SPECIAL_USE)
        } else {
            startForeground(1, notification)
        }

        // Establish VPN Interface
        val builder = Builder()
        builder.setSession("XRayVPN")
        builder.addAddress("10.0.1.1", 24)
        builder.addRoute("0.0.0.0", 0)
        builder.setMtu(1500)
        
        // Exclude this app to prevent loopback
        try {
            builder.addDisallowedApplication(packageName)
        } catch (e: Exception) {
            e.printStackTrace()
        }

        // Start V2Ray Core
        try {
            vpnInterface = builder.establish()

            if (vpnInterface == null) {
                stopSelf()
                return START_NOT_STICKY
            }
            val tunFd = vpnInterface?.fd ?: 0
            coreController.startLoop(config, tunFd)
        } catch (e: Exception) {
            e.printStackTrace()
            stopSelf()
            return START_NOT_STICKY
        }

        return START_STICKY
    }

    override fun onDestroy() {
        super.onDestroy()
        stopV2Ray()
    }

    private fun stopV2Ray() {
        try {
            if (::coreController.isInitialized) {
                 coreController.stopLoop()
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
        try {
            vpnInterface?.close()
            vpnInterface = null
        } catch (e: Exception) {
            e.printStackTrace()
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            stopForeground(STOP_FOREGROUND_REMOVE)
        } else {
            stopForeground(true)
        }
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val serviceChannel = NotificationChannel(
                CHANNEL_ID,
                "VPN Service Channel",
                NotificationManager.IMPORTANCE_DEFAULT
            )
            val manager = getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(serviceChannel)
        }
    }
}
