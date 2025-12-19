package com.clearpath.xray_flutter

import android.content.Intent
import android.net.VpnService
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.clearpath.xray_flutter.service.SimpleVpnService

class MainActivity : FlutterActivity() {
    private val CHANNEL = "vpn_control"
    private val REQUEST_CODE_VPN_PERMISSION = 24
    
    private var pendingConfig: String? = null
    private var pendingSocksPort: Int? = null
    private var pendingResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "startVpn") {
                val config = call.argument<String>("config")
                val socksPort = call.argument<Int>("socksPort")
                
                val intent = VpnService.prepare(this)
                if (intent != null) {
                    pendingConfig = config
                    pendingSocksPort = socksPort
                    pendingResult = result
                    startActivityForResult(intent, REQUEST_CODE_VPN_PERMISSION)
                } else {
                    startVpnService(config, socksPort)
                    result.success(null)
                }
            } else if (call.method == "stopVpn") {
                val intent = Intent(this, SimpleVpnService::class.java)
                stopService(intent)
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode == REQUEST_CODE_VPN_PERMISSION) {
            if (resultCode == RESULT_OK) {
                startVpnService(pendingConfig, pendingSocksPort)
                pendingResult?.success(null)
            } else {
                pendingResult?.error("PERMISSION_DENIED", "VPN permission denied by user", null)
            }
            pendingConfig = null
            pendingSocksPort = null
            pendingResult = null
        }
        super.onActivityResult(requestCode, resultCode, data)
    }

    private fun startVpnService(config: String?, socksPort: Int?) {
        val intent = Intent(this, SimpleVpnService::class.java)
        intent.putExtra("config", config)
        intent.putExtra("socksPort", socksPort)
        startService(intent)
    }
}
