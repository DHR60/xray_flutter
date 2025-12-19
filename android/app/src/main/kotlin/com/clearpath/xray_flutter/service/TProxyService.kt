package com.clearpath.xray_flutter.service

import android.util.Log
import com.clearpath.xray_flutter.BuildConfig
import com.clearpath.xray_flutter.model.TProxyModel
import java.io.File

class TProxyService(
    private val model: TProxyModel,
) {
    companion object {
        @JvmStatic
        @Suppress("FunctionName")
        private external fun TProxyStartService(configPath: String, fd: Int)
        @JvmStatic
        @Suppress("FunctionName")
        private external fun TProxyStopService()
        @JvmStatic
        @Suppress("FunctionName")
        private external fun TProxyGetStats(): LongArray?

        init {
            System.loadLibrary("hev-socks5-tunnel")
        }
    }

    /**
     * Starts the tun2socks process with the appropriate parameters.
     */
    fun startTun2Socks() {
        Log.i(BuildConfig.APPLICATION_ID, "Starting HevSocks5Tunnel via JNI")

        val configContent = buildConfig()
        val configFile = File(model.context.filesDir, "hev-socks5-tunnel.yaml").apply {
            writeText(configContent)
        }
        Log.i(BuildConfig.APPLICATION_ID, "Config file created: ${configFile.absolutePath}")
        Log.d(BuildConfig.APPLICATION_ID, "Config content:\n$configContent")

        try {
            Log.i(BuildConfig.APPLICATION_ID, "TProxyStartService...")
            TProxyStartService(configFile.absolutePath, model.vpnInterface.fd)
        } catch (e: Exception) {
            Log.e(BuildConfig.APPLICATION_ID, "HevSocks5Tunnel exception: ${e.message}")
        }
    }

    private fun buildConfig(): String {
        return buildString {
            appendLine("tunnel:")
            appendLine("  mtu: ${model.mtu}")
            appendLine("  ipv4: ${model.ipv4Client}")

            if (model.enableIPv6) {
                appendLine("  ipv6: '${model.ipv6Client}'")
            }

            appendLine("socks5:")
            appendLine("  port: ${model.socksPort}")
            appendLine("  address: 127.0.0.1")
            appendLine("  udp: 'udp'")

            // appendLine("misc:")
            // appendLine("  tcp-read-write-timeout: ${MmkvManager.decodeSettingsString(AppConfig.PREF_HEV_TUNNEL_RW_TIMEOUT) ?: AppConfig.HEVTUN_RW_TIMEOUT}")
            // appendLine("  udp-read-write-timeout: ${MmkvManager.decodeSettingsString(AppConfig.PREF_HEV_TUNNEL_RW_TIMEOUT) ?: AppConfig.HEVTUN_RW_TIMEOUT}")
            // appendLine("  log-level: ${MmkvManager.decodeSettingsString(AppConfig.PREF_HEV_TUNNEL_LOGLEVEL) ?: "warn"}")
        }
    }

    /**
     * Stops the tun2socks process
     */
    fun stopTun2Socks() {
        try {
            Log.i(BuildConfig.APPLICATION_ID, "TProxyStopService...")
            TProxyStopService()
        } catch (e: Exception) {
            Log.e(BuildConfig.APPLICATION_ID, "Failed to stop hev-socks5-tunnel", e)
        }
    }
}