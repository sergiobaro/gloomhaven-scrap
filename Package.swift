// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "gloomhaven-scrap",
    products: [
        .executable(name: "gloomhaven-scrap", targets: ["gloomhaven-scrap"]),
        .library(name: "GloomhavenScrap", targets: ["GloomhavenScrap"])
    ],
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "1.7.5")
    ],
    targets: [
        .target(
            name: "gloomhaven-scrap",
            dependencies: ["GloomhavenScrap"]),
        .target(
            name: "GloomhavenScrap",
            dependencies: ["SwiftSoup"]),
        .testTarget(
            name: "GloomhavenScrapTests",
            dependencies: ["GloomhavenScrap"]),
    ]
)
