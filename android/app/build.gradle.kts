plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.fadyyy_new"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.toVersion("17")
        targetCompatibility = JavaVersion.toVersion("17")
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.fadyyy_new"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 23
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    ndkVersion = "27.0.12077973"
}

dependencies {
    implementation(platform("com.google.firebase:firebase-bom:33.10.0"))  // ✅ Firebase BOM
    implementation("com.google.firebase:firebase-analytics")  // ✅ Firebase Analytics
    implementation("com.google.firebase:firebase-auth-ktx")  // ✅ Firebase Authentication
    implementation("com.google.firebase:firebase-firestore-ktx")  // ✅ Firebase Firestore
}

flutter {
    source = "../.."
}

apply(plugin = "com.google.gms.google-services")