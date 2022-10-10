// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SDSMealAPI",
    defaultLocalization: "ko",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .macCatalyst(.v13),
    ],
    products: [
        .library(
            name: "SDSMealAPI",
            targets: [
                "SDSMealAPI",
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/jaemyeong/ErrorKit.git", .upToNextMajor(from: "0.1.7")),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", .upToNextMajor(from: "2.4.3")),
    ],
    targets: [
        .target(
            name: "SDSMealAPI",
            dependencies: [
                .product(name: "SwiftSoup", package: "SwiftSoup", condition: .when(platforms: [.iOS])),
                .product(name: "ErrorKit", package: "ErrorKit", condition: .when(platforms: [.iOS])),
            ]),
        .testTarget(
            name: "SDSMealAPITests",
            dependencies: [
                "SDSMealAPI",
            ],
            resources: [
                .process("Resources"),
            ]
        ),
    ]
)
