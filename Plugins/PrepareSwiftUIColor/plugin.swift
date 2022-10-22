//
//  plugin.swift
//  
//
//  Created by p-x9 on 2022/10/22.
//  
//

import Foundation
import PackagePlugin

@main
struct PrepareDebugMenu: BuildToolPlugin {
    func createBuildCommands(context: PackagePlugin.PluginContext, target: PackagePlugin.Target) async throws -> [PackagePlugin.Command] {
        let executablePath = try context.tool(named: "prepare-swiftui-color-bin").path
        
        let mediaPath = context.package.directory.appending("Sources/SwiftUIColor/Resources/Media.xcassets")
        let outputPath = context.package.directory.appending("Sources/SwiftUIColor/")
        
        return [
            .prebuildCommand(
                displayName: "Prepare SwiftUI Color",
                executable: executablePath,
                arguments: [
                    mediaPath.string,
                    outputPath.string
                ],
                outputFilesDirectory: outputPath
            )
        ]
    }
}
