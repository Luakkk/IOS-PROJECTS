//
//  ContentView.swift
//  NewsApp
//
//  Created by Polina Stelmakh on 28.02.2024.
//

import SwiftUI

// SwiftUI view structure for the main content of the app
struct ContentView: View {
    
    // State variable to keep track of the selected tab
    @State private var selectedTab = 0
    
    // Body of the view
    var body:
    
    some View {
        // TabView is used for creating a tab-based interface
        TabView(selection: $selectedTab) {
            
            // First Tab: TopHeadlinesNews View
            TopHeadlinesNews(newsAbout: "apple", navTitle: "News about Apple")
                .tabItem {
                    // Display a tab item with an image and label
                    if selectedTab == 0 {
                        Label("Top headlines", systemImage: "newspaper")
                    } else {
                        Label("Top headlines", systemImage: "newspaper")
                    }
                }.tag(0) // Assign a tag to the tab for identification
            
            // Second Tab: Search View
            NavigationView {
                Smth()
                    .navigationTitle("Search")
            }
            .tabItem {
                // Display a tab item with an image and label
                if selectedTab == 1 {
                    Label("Search", systemImage: "magnifyingglass")
                } else {
                    Label("Search", systemImage: "magnifyingglass")
                }
            }
            .tag(1) // Assign a tag to the tab for identification
        }
    }
}

// Preview the ContentView in Xcode's canvas
#Preview {
    ContentView()
}

/*import SwiftUI
import SwiftyJSON



struct ContentView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Apple")
                }
                Section {
                    Text("Cars")
                }
                Section {
                    Text("Sport")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
        TabView(selection: $selectedTab) {
            
            TopHeadlinesNews(newsAbout: "apple", navTitle: "News about Apple")
                .tabItem {
                    if selectedTab == 0 {
                        Label("Top headlines", systemImage: "newspaper")
                    } else {
                        Label("Top headlines", systemImage: "newspaper")
                    }
                }.tag(0)
            
            NavigationView {
                Smth()
                .navigationTitle("Search")
            }.tabItem {
                    if selectedTab == 1 {
                        Label("Search", systemImage: "magnifyingglass")
                    } else {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                }.tag(1)
        }
    }
}




#Preview {
    ContentView()
}*/
