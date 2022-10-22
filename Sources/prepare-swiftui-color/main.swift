//
//  main.swift
//  
//
//  Created by p-x9 on 2022/10/22.
//  
//

import Foundation

enum CommandError: LocalizedError {
    case invalidArguments
}

func run() throws {
    let arguments = ProcessInfo().arguments
    
    guard arguments.count == 3 else {
        throw CommandError.invalidArguments
    }
    
    let mediaAssetsPath = arguments[1]
    let outputPath = arguments[2]
    
    let assetURL = URL(fileURLWithPath: mediaAssetsPath)
    let outputURL = URL(fileURLWithPath: outputPath)
    
    let generator = Generator(assetURL: assetURL, outputURL: outputURL)

    try generator.generate()
}

do {
    try run()
    exit(0)
} catch {
    exit(1)
}
