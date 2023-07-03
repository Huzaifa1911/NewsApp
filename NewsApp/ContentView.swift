//
//  ContentView.swift
//  NewsApp
//
//  Created by Huzaifa Arshad on 12/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                HomeScreen()
                    .tabItem {
                        Label("Home",systemImage: "house")
                    }
                Profile()
                    .tabItem {
                        Label("Profile",systemImage: "person")
                    }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
