//swift-tools-version:5.10.0

import PackageDescription

let package = Package(
    name: "TextFieldStepper",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "TextFieldStepper",
            targets: ["TextFieldStepper"]),
    ],
    targets: [
        .target(
            name: "TextFieldStepper",
            dependencies: []),
    ]
)
