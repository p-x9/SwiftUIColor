// swift-tools-version: 5.7


import PackageDescription

let package = Package(
    name: "SwiftUIColor",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "SwiftUIColor",
            targets: ["SwiftUIColor"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftUIColor",
            dependencies: [],
            plugins: [
                .plugin(name: "PrepareSwiftUIColor")
            ]
        ),
        .plugin(
            name: "PrepareSwiftUIColor",
            capability: .buildTool(),
            dependencies: [
                "prepare-swiftui-color-bin"
            ]
        ),
        .executableTarget(
            name: "prepare-swiftui-color"
        ),
        .binaryTarget(
            name: "prepare-swiftui-color-bin",
            url: "https://github.com/p-x9/SwiftUIColor/releases/download/0.0.1/prepare-swiftui-color-bin.artifactbundle.zip",
            checksum: "2bb7dc0986263df14b586c75260887846cc29a313a21fb9bea29941f4747f725"
        ),
        .testTarget(
            name: "SwiftUIColorTests",
            dependencies: ["SwiftUIColor"]
        ),
    ]
)
