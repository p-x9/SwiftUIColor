# SwiftUIColor

Make system color defined in `UIColor`/`NSColor` available to SwiftUI Color.

## About
In this library, colors are defined in an asset file.
<img width="1379" alt="image" src="https://user-images.githubusercontent.com/50244599/197352199-499cec35-bc47-43ae-8fe4-9b785cab1faa.png">

Create an extension file for SwiftUI.Color using the Swift Package Plugin.
Files are generated by prebuildCommand.

<img width="1379" alt="image" src="https://user-images.githubusercontent.com/50244599/197352377-13e2b057-f389-468a-9659-a7240d0b4c2c.png">

## Usage
1. import
   ```swift
   import SwiftUIColor
   ```
2. Use
   ```swift
   // universal system colors
   Color.universal.systemRed
   // color list
   let colors: [Color] = Color.universal.colors
   
   // iOS system colors
   Color.iOS.systemBackground
   // color list
   let colors: [Color] = Color.iOS.colors

   // macOS system colors
   Color.macOS.secondarySystemFillColor
   // color list
   let colors: [Color] = Color.macOS.colors
   ```

