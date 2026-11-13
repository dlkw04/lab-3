// Fix AGP AndroidLocationsException caused by duplicate ANDROID_PREFS_ROOT in Windows environment
run {
    System.clearProperty("ANDROID_PREFS_ROOT")
    System.clearProperty("ANDROID_SDK_HOME")
    try {
        val processEnvClass = Class.forName("java.lang.ProcessEnvironment")
        for (fieldName in listOf("theEnvironment", "theCaseInsensitiveEnvironment", "theUnmodifiableEnvironment")) {
            try {
                val field = processEnvClass.getDeclaredField(fieldName)
                field.isAccessible = true
                @Suppress("UNCHECKED_CAST")
                val map = field.get(null) as? MutableMap<String, String>
                map?.remove("ANDROID_PREFS_ROOT")
                map?.remove("ANDROID_SDK_HOME")
            } catch (_: Exception) {}
        }
    } catch (_: Exception) {}
}

pluginManagement {
    val flutterSdkPath =
        run {
            val properties = java.util.Properties()
            file("local.properties").inputStream().use { properties.load(it) }
            val flutterSdkPath = properties.getProperty("flutter.sdk")
            require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
            flutterSdkPath
        }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.11.1" apply false
    id("org.jetbrains.kotlin.android") version "2.2.20" apply false
}

include(":app")
