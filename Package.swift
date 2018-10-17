// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftMatrix",
    dependencies: [
        .package(url: "https://github.com/lf-araujo/CNCURSES.git", from: "0.0.1")
    ],
    targets: [
        .target(
            name: "SwiftMatrix"
            )
    ]
)
