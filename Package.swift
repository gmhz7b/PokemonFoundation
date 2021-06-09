// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PokemonFoundation",
    defaultLocalization: "en",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "PokemonFoundation",
            targets: ["PokemonFoundation"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/gmhz7b/CodableExtensions.git",
            from: "1.0.0"
        ),
        .package(
            url: "https://github.com/gmhz7b/CommonKit.git",
            from: "1.0.0"
        ),
        .package(
            url: "https://github.com/gmhz7b/ServiceKit.git",
            from: "1.0.0"
        )
    ],
    targets: [
        .target(
            name: "PokemonFoundation",
            dependencies: [
                "CodableExtensions",
                "CommonKit",
                "ServiceKit"
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "PokemonFoundationTests",
            dependencies: ["PokemonFoundation"]
        )
    ]
)
