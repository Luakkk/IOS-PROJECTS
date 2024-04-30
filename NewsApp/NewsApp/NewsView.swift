//
//  NewsView.swift
//  NewsApp
//
//  Created by Polina Stelmakh on 28.02.2024.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

// SwiftUI view for the search functionality
struct Smth: View {
    // State variable to store the search text
    @State var searchText: String = ""
    // State variable to control navigation to the Everything view
    @State private var isNavigateToEverything = false
    // Observed object for fetching news data
    @ObservedObject var list: GetData
    
    // Initializer with a default search term of "apple"
    init(searchText: String = "apple") {
        self.list = GetData(search: searchText)
    }
    
    var body: some View {
        // NavigationView to enable navigation components
        NavigationView {
            VStack {
                // TextField for user input of the search query
                TextField("Search", text: $searchText, onCommit: {
                    // When user presses return/done after typing search text
                    // Update the search query for GetData
                    list.search = searchText
                    // Activate the navigation link to navigate to Everything view
                    isNavigateToEverything = true
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                Spacer()
                
                // NavigationLink to navigate to Everything view
                NavigationLink(
                    destination: TopHeadlinesNews(newsAbout: searchText, navTitle: "news"),
                    isActive: $isNavigateToEverything
                ) {
                    EmptyView()
                }
                .hidden() // Hide the navigation link; activation is controlled by isNavigateToEverything
            }
        }
    }
}

// SwiftUI view for displaying top headlines news
struct TopHeadlinesNews: View {
    // State variable to store the search term
    @State var newsAbout: String = "apple"
    // State variable to store the navigation title
    @State var navTitle: String = ""
    // Observed object for fetching news data
    @ObservedObject var list: GetData
    
    // Initializer with parameters for the search term and navigation title
    init(newsAbout: String, navTitle: String) {
        self.list = GetData(search: newsAbout)
        self.navTitle = navTitle
    }
    
    var body: some View {
        // NavigationView for enabling navigation components
        NavigationView {
            // List to display news items fetched by GetData
            List(list.datas) { i in
                // NavigationLink to navigate to the WebView for detailed news view
                NavigationLink(
                    destination: WebView(url: i.url)
                        .navigationBarTitle("", displayMode: .inline)
                ) {
                    // VStack to structure the content within each list item
                    VStack(spacing: 15) {
                        // Display news image using SDWebImageSwiftUI
                        if i.image != "" {
                            WebImage(url: URL(string: i.image)!, options: .highPriority, context: nil)
                                .resizable()
                                .frame(height: 195)
                                .cornerRadius(20)
                        }
                        // VStack for news title and description
                        VStack(alignment: .leading, spacing: 10) {
                            Text(i.title)
                                .fontWeight(.heavy)
                            Text(i.desc)
                                .lineLimit(5)
                        }
                    }
                    .padding(.vertical, 16) // Padding for spacing
                }
            }
            .navigationTitle(navTitle) // Set the navigation title
        }
    }
}

