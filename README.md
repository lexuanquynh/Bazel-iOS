### Clean:
```bash
bazel clean --expunge
```

Build:
```bash
bazel build //:CleanApp
```

Test:
```bash
bazel test //:CleanAppTests
```
Gen xcode project:
```bash
bazel run //:CleanAppXcodeProj
```

Để tìm tài khoản build:
```bash
security find-identity -v -p codesigning
```

1. Provisioning Profile:
Download the appropriate provisioning profile (.mobileprovision) from the Apple Developer Portal. This should match your app's bundle ID (com.example.CleanApp) and certificate. For development, use a development profile; for distribution, use an App Store or Ad Hoc profile.

2. Place the Provisioning Profile
Directory: Place the .mobileprovision file in a directory within your project, such as CleanApp/Profiles/. For example, create a file named CleanApp_Development.mobileprovision in CleanApp/Profiles/.

Recommended Path: CleanApp/Profiles/CleanApp_Development.mobileprovision
