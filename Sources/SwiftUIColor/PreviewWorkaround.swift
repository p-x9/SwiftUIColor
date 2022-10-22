//
//  PreviewWorkaround.swift
//  
//
//  Created by p-x9 on 2022/10/23.
//  
//

import Foundation

// ref: https://developer.apple.com/forums/thread/664295

private class CurrentBundleFinder {}

extension Foundation.Bundle {
    static var myModule: Bundle = {
        /* The name of your local package, prepended by "LocalPackages_" for iOS and "PackageName_" for macOS. You may have same PackageName and TargetName*/
        let bundleNameIOS = "SwiftUIColor_SwiftUIColor"
        let bundleNameMacOs = "SwiftUIColor_SwiftUIColor"
        let candidates = [
            /* Bundle should be present here when the package is linked into an App. */
            Bundle.main.resourceURL,
            /* Bundle should be present here when the package is linked into a framework. */
            Bundle(for: CurrentBundleFinder.self).resourceURL,
            /* For command-line tools. */
            Bundle.main.bundleURL,
            /* Bundle should be present here when running previews from a different package (this is the path to "…/Debug-iphonesimulator/"). */
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent(),
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent(),
        ]
        
        for candidate in candidates {
            let bundlePathiOS = candidate?.appendingPathComponent(bundleNameIOS + ".bundle")
            let bundlePathMacOS = candidate?.appendingPathComponent(bundleNameMacOs + ".bundle")
            if let bundle = bundlePathiOS.flatMap(Bundle.init(url:)) {
                return bundle
            } else if let bundle = bundlePathMacOS.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle")
    }()
}
