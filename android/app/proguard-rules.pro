# Keep all Google Play Services Auth classes
-keep class com.google.android.gms.auth.** { *; }
-keep class com.google.android.gms.common.** { *; }
-keep class com.google.android.gms.tasks.** { *; }
-keep class com.google.android.gms.auth.api.credentials.** { *; }

# Keep Otpless-related classes
-keep class com.otpless.** { *; }

# Optional: Keep any Parcelable models if necessary
-keepclassmembers class * implements android.os.Parcelable {
    static ** CREATOR;
}

# Optional: If you still want to suppress warnings (though not recommended)
-dontwarn com.google.android.gms.auth.api.credentials.**
