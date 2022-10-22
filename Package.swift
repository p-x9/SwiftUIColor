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
                .process("Resources")
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
            url: "https://github.com/p-x9/SwiftUIColor/releases/download/0.0.2/prepare-swiftui-color-bin.artifactbundle.zip",
            checksum: "6505ec1f5c8fc7f6151a04e403952a770483cbfebfc98db54a0b1697ee7b7419"
        ),
        .testTarget(
            name: "SwiftUIColorTests",
            dependencies: ["SwiftUIColor"]
        ),
    ]
)
