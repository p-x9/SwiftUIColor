//
//  ContentView.swift
//  Example
//
//  Created by p-x9 on 2023/01/10.
//  
//

import SwiftUI
import SwiftUIColor

struct ContentView: View {
    var body: some View {
        TabView {

            // iOS
            NavigationView {
                List {
                    ForEach(Color.iOS.colors.indices, id: \.self) { index in
                        HStack {
                            Text(Color.iOS.colorNames[index])
                            Spacer()
                            Color.iOS.colors[index]
                                .frame(width: 140)
                        }
                    }
                }
                .navigationTitle("iOS")
            }
            .tabItem {
                Label("iOS", systemImage: "ipodshuffle.gen3")
            }


            // macOS
            NavigationView {
                List {
                    ForEach(Color.macOS.colors.indices, id: \.self) { index in
                        HStack {
                            Text(Color.macOS.colorNames[index])
                            Spacer()
                            Color.macOS.colors[index]
                                .frame(width: 140)
                        }
                    }
                }
                .navigationTitle("macOS")
            }
            .tabItem {
                Label("macOS", systemImage: "macwindow")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
