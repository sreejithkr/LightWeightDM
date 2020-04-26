// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LightWeightDM",
    products: [
        .library(
            name: "LightWeightDM",
            targets: ["LightWeightDM"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "LightWeightDM",
            dependencies: []),
        .testTarget(
            name: "LightWeightDMTests",
            dependencies: ["LightWeightDM"]),
    ]
)
