package com.clearpath.xray_flutter.model

import android.content.Context
import android.os.ParcelFileDescriptor

data class VpnModel(
    val context: Context,
    val vpnInterface: ParcelFileDescriptor,
    val socksPort: Int,
    val mtu: Int = 9000,
    val ipv4Client: String = "172.31.0.1",
    val ipv6Client: String = "fc00::172:31:0:1",
    val enableIPv6: Boolean = false,
    val bypassLan: Boolean = true,
    val addHttpProxy: Boolean = false,
    val perAppProxyEnabled: Boolean = false,
    val perAppProxyList: List<String> = emptyList(),
    val bypassAppProxy: Boolean = false,
)