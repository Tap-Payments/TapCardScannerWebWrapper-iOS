// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TapCardScannerWebWrapper-iOS",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TapCardScannerWebWrapper-iOS",
            targets: ["TapCardScannerWebWrapper-iOS"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Tap-Payments/TapCardVlidatorKit-iOS.git",
            from: "1.0.0"
        ),
        .package(
            url: "https://github.com/Tap-Payments/SharedDataModels-iOS.git",
            from: "0.0.5"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TapCardScannerWebWrapper-iOS",
            dependencies: ["TapCardVlidatorKit-iOS",
                           "SharedDataModels-iOS"],
            resources: [.process("Assets")]),
    ],
    swiftLanguageVersions: [.v5]
)
