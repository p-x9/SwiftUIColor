# SwiftUIColor

Make system color defined in `UIColor`/`NSColor` available to SwiftUI Color.

## Usage
1. import
   ```swift
   import SwiftUIColor
   ```
2. Use

   Get the color for each platform
   ```swift
   // universal system colors
   let color = Color.universal.systemRed

   // iOS system colors
   let color = Color.iOS.systemBackground

   // macOS system colors
   let color = Color.macOS.secondarySystemFillColor

   // and watchOS, tvOS...
   ```

   Another Style
   ```swift
   // universal system colors
   let color: Color = .universal(.systemRed)

   // iOS system colors
   let color: Color = .iOS(systemBackground)

   // macOS system colors
   let color: Color = macOS(.secondarySystemFillColor)

   // and watchOS, tvOS...
   ```

   list of colors
   ```swift
   // universal color list
   let colors: [Color] = Color.universal.colors

   list of color names
   ```swift
   // universal color name list
   let colors: [Color] = Color.universal.colorNames
   ```

## Example
|  universal  |  iOS  |  macOS  |
| ---- | ---- | ---- |
|  ![universal](https://user-images.githubusercontent.com/50244599/213266065-c2a80ef4-4612-4684-b03a-2d5ed424358a.PNG)  |  ![iOS](https://user-images.githubusercontent.com/50244599/213266082-b09044df-5b45-408e-a1e7-84c055777f63.PNG)  |  ![macOS](https://user-images.githubusercontent.com/50244599/213266087-daf724fd-2142-4b96-b00c-cfc47a2b7a63.PNG)  |

|  tvOS  |  watchOS  |
| ---- | ---- |
|  ![tvOS](https://user-images.githubusercontent.com/50244599/213266103-99a41ad1-4154-4ec1-99c8-aae210aceb4e.PNG)  |  ![watchOS](https://user-images.githubusercontent.com/50244599/213266108-bc9c1ce9-982f-441a-91a4-d4c03f179204.PNG) |

## Development
In this library, colors are defined in an asset file.
<img width="1379" alt="image" src="https://user-images.githubusercontent.com/50244599/197352199-499cec35-bc47-43ae-8fe4-9b785cab1faa.png">

Based on this asset file, the following code is generated.

<img width="1379" alt="image" src="https://user-images.githubusercontent.com/50244599/197352377-13e2b057-f389-468a-9659-a7240d0b4c2c.png">

If you have updated the asset file, use the following command to update the code

```sh
swift run -c release --package-path . prepare-swiftui-color Sources/SwiftUIColor/Assets/Media.xcassets/ Sources/SwiftUIColor/
```

## License
SwiftUIColor is released under the MIT License. See [LICENSE](./LICENSE)
