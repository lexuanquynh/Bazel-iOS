load("@rules_apple//apple:ios.bzl", "ios_application", "ios_unit_test")
load("@rules_swift//swift:swift.bzl", "swift_library")
load("@rules_xcodeproj//xcodeproj:defs.bzl", "xcodeproj")

load(
    "@rules_xcodeproj//xcodeproj:defs.bzl",
    "top_level_target",
    "xcodeproj",
)

# Domain Framework
swift_library(
    name = "Domain",
    module_name = "Domain",
    srcs = glob(["Domain/Sources/**/*.swift"]),
    visibility = ["//visibility:public"],
)

# Data Framework
swift_library(
    name = "Data",
    module_name = "Data",
    srcs = glob(["Data/Sources/**/*.swift"]),
    deps = [":Domain"],
    visibility = ["//visibility:public"],
)

# Presentation Framework
swift_library(
    name = "Presentation",
    module_name = "Presentation",
    srcs = glob(["Presentation/Sources/**/*.swift"]),
    deps = [":Domain", ":Data"],
    visibility = ["//visibility:public"],
)

# Common Framework
swift_library(
    name = "Common",
    module_name = "Common",
    srcs = glob(["Common/Sources/**/*.swift"]),
    visibility = ["//visibility:public"],
)

# Main App
swift_library(
    name = "AppLibrary",
    module_name = "CleanApp",
    srcs = glob(["CleanApp/Sources/**/*.swift"]),
    deps = [
        ":Domain",
        ":Data",
        ":Presentation",
        ":Common",
    ],
)

ios_application(
    name = "CleanApp",
    bundle_id = "codetoanbug.Chat-iOS",
    families = ["iphone", "ipad"],
    infoplists = [":CleanApp/Info.plist"],
    minimum_os_version = "15.0",
    # infoplists = [":CleanApp/Info.plist"],
    provisioning_profile = ":CleanApp/Profiles/DevProfilecodetoanbugChatiOS.mobileprovision",
    deps = [":AppLibrary"],
    visibility = ["//visibility:public"],
)


# Unit Tests
swift_library(
    name = "CleanAppTestsLib",
    testonly = True,
    srcs = glob(["CleanAppTests/Sources/**/*.swift"]),
    deps = [
        ":AppLibrary",
        ":Domain",
        ":Data",
        ":Presentation",
    ],
    visibility = ["//visibility:public"],
)

ios_unit_test(
    name = "CleanAppTests",
    bundle_id = "com.codetoanbug.CleanAppTests",
    minimum_os_version = "15.0",
    deps = [":CleanAppTestsLib"],
    test_host = ":CleanApp",
    visibility = ["//visibility:public"],
)

# Xcode Project
# xcodeproj(
#     name = "CleanAppXcodeProj",
#     project_name = "CleanApp",
#     tags = ["manual"],
#     top_level_targets = [
#         ":CleanApp",
#         ":CleanAppTests",
#     ],
# )

xcodeproj(
    name = "CleanAppXcodeProj",
    project_name = "CleanApp",
    tags = ["manual"],
    top_level_targets = [
        top_level_target(":CleanApp", target_environments = ["device", "simulator"]),
        ":CleanAppTests",
    ],
)