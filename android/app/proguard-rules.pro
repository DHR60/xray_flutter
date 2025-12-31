# Keep TProxyService and its native methods to prevent NoSuchMethodError during JNI registration
-keep class com.clearpath.xray_flutter.service.TProxyService {
    *;
}
