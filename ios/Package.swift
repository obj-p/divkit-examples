// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "ios",
    platforms: [
        .iOS(.v18),
    ],
    products: [
        .library(name: "Previews", targets: ["Previews"]),
    ],
    dependencies: [
        .package(url: "https://github.com/divkit/divkit-ios", from: "30.20.0")
    ],
    targets: [
        .target(
            name: "Previews",
            dependencies: [
                .product(name: "DivKit", package: "divkit-ios"),
                .product(name: "DivKitExtensions", package: "divkit-ios")
            ],
            resources: [
                .process("Content")
            ]
        ),
    ]
)
