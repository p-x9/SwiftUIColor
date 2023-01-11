//
//  ContentView.swift
//  Example
//
//  Created by p-x9 on 2023/01/10.
//  
//

import SwiftUI
import SwiftUIColor

protocol ColorNamePairRepresentable {
    static var colorNamePairs: [(name: String, color: Color)] { get }
    static var colorNames: [String] { get }
    static var colors: [Color] { get }
}

extension ColorNamePairRepresentable {
    static var colorNamePairs: [(name: String, color: Color)] {
        zip(colorNames, colors)
            .map { $0 }
            .sorted { lhs, rhs in
                lhs.name < rhs.name
            }
    }
}

extension Color.iOS: ColorNamePairRepresentable {}
extension Color.macOS: ColorNamePairRepresentable {}
extension Color.tvOS: ColorNamePairRepresentable {}
extension Color.watchOS: ColorNamePairRepresentable {}
extension Color.universal: ColorNamePairRepresentable {}


struct ContentView: View {
    var body: some View {
        TabView {

            // universal
            ColorList(
                title: "universal",
                colorNamePairs: Color.universal.colorNamePairs
            )
            .tabItem {
                Label("universal", systemImage: "circle.grid.cross.fill")
            }

            // iOS
            ColorList(
                title: "iOS",
                colorNamePairs: Color.iOS.colorNamePairs
            )
            .tabItem {
                Label("iOS", systemImage: "ipodshuffle.gen3")
            }

            // macOS
            ColorList(
                title: "macOS",
                colorNamePairs: Color.macOS.colorNamePairs
            )
            .tabItem {
                Label("macOS", systemImage: "macwindow")
            }

            // tvOS
            ColorList(
                title: "tvOS",
                colorNamePairs: Color.tvOS.colorNamePairs
            )
            .tabItem {
                Label("tvOS", systemImage: "appletv")
            }

            // watchOS
            ColorList(
                title: "watchOS",
                colorNamePairs: Color.watchOS.colorNamePairs
            )
            .tabItem {
                Label("watchOS", systemImage: "applewatch.watchface")
            }

        }
    }
}


struct ColorList: View {
    let title: String
    let colorNamePairs: [(name: String, color: Color)]

    var colors: [Color] {
        colorNamePairs.map(\.color)
    }

    var colorNames: [String] {
        colorNamePairs.map(\.name)
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(colors.indices, id: \.self) { index in
                    HStack {
                        Text(colorNames[index])
                        Spacer()
                        colors[index]
                            .frame(width: 140)
                    }
                }
            }
            .navigationTitle(title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
