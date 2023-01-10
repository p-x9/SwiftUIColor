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
        .executable(
            name: "prepare-swiftui-color",
            targets: ["prepare-swiftui-color"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftUIColor",
            dependencies: [],
            resources: [
                .process("Assets")
            ],
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
            url: "https://github.com/p-x9/SwiftUIColor/releases/download/0.0.5/prepare-swiftui-color-bin.artifactbundle.zip",
            checksum: "9cf5f4101e4b6880cfd7d085eeb5747416a0a56b7c03175d9a8c593004b70309"
        ),
//        DUBUG
//        .binaryTarget(name: "prepare-swiftui-color-bin", path: "./prepare-swiftui-color-bin.artifactbundle.zip"),
        .testTarget(
            name: "SwiftUIColorTests",
            dependencies: ["SwiftUIColor"]
        ),
    ]
)
