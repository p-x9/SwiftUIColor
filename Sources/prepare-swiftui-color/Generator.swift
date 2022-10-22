//
//  Generator.swift
//  
//
//  Created by p-x9 on 2022/10/22.
//  
//

import Foundation

extension String {
    static var tab: String {
        "    "
    }
}

class Generator {
    private let fileManger = FileManager.default
    
    let assetURL: URL
    let outputURL: URL
    
    private var header: String {
        """
        // swiftlint:disable all
        
        import SwiftUI
        
        public extension Color {
        
        """
    }
    
    public init(assetURL: URL, outputURL: URL) {
        self.assetURL = assetURL
        self.outputURL = outputURL
    }
    
    public func generate() throws {
        let childDirectories = try fileManger.subpathsOfDirectory(atPath: assetURL.path)
        try childDirectories.forEach {
            try generate(for: assetURL.appendingPathComponent($0))
        }
        try generate(for: assetURL, outputFileName: "Color+")
    }
}

extension Generator {
    private func generate(for directory: URL, outputFileName: String? = nil) throws {
        guard fileManger.fileExists(atPath: directory.path) else { return }
        let suffix = outputFileName ?? directory.lastPathComponent
        
        let colorNames = try? fileManger.contentsOfDirectory(atPath: directory.path)
            .filter {
                $0.hasSuffix(".colorset")
            }
            .compactMap {
                $0.components(separatedBy: ".colorset").first
            }
        
        let tab = String.tab
        var output = header
        
        output +=
        """
        \(tab)enum \(suffix) {
        
        """
        
        guard let colorNames, !colorNames.isEmpty else { return }
        
        colorNames.forEach {
            guard let propertyName = $0.components(separatedBy: "_").last else { return }
            output +=
            """
            \(tab)\(tab)static let \(propertyName) = Color("\($0)", bundle: .module)\n
            """
        }
        
        output +=
        """
        \(tab)}
        }
        """
        
        let outputURL = self.outputURL.appendingPathComponent("Color+\(suffix).generated.swift")
        if fileManger.fileExists(atPath: outputURL.path) {
            try? fileManger.removeItem(at: outputURL)
        }
        
        guard let data = output.data(using: .utf8) else { return }
        
        try data.write(to: outputURL)
    }
}
