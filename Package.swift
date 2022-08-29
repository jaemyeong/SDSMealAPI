// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "SDSMealAPI",
    defaultLocalization: "ko",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
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
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
        .package(url: "https://github.com/jaemyeong/ErrorKit.git", .upToNextMajor(from: "0.1.7")),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", .upToNextMajor(from: "2.4.3")),
    ],
    targets: [
        .target(
            name: "SDSMealAPI",
            dependencies: [
                "SwiftSoup",
                "ErrorKit",
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
