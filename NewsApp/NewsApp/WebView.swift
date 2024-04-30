//
//  WebView.swift
//  NewsApp
//
//  Created by Polina Stelmakh on 28.02.2024.
//

import Foundation
import SwiftUI
import WebKit

// Define a SwiftUI UIViewRepresentable structure for displaying a web view
struct WebView: UIViewRepresentable {
    var url: String
    
    // Method to create a new WKWebView
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let view = WKWebView()
        
        // Load the URL request into the web view
        view.load(URLRequest(url: URL(string: url)!))
        
        return view
    }
    
    // Method to update the existing WKWebView
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        // No additional updates needed
    }
}

