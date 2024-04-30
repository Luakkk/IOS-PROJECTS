//
//  Data.swift
//  NewsApp
//
//  Created by Polina Stelmakh on 28.02.2024.
//

import Foundation
import SwiftyJSON

// Define a data model structure for news
struct DataType: Identifiable {
    var id: String
    var title: String
    var desc: String
    var url: String
    var image: String
}

// Observable object class for fetching and storing news data
class GetData: ObservableObject {
    
    // Published array to store fetched news data
    @Published var datas = [DataType]()
    
    // Default search term is "apple"
    var search: String = "apple"
    
    // Initializer method to fetch news data
    init(search: String = "apple") {
        // Construct the API endpoint URL
        let urlString = "https://newsapi.org/v2/everything?q=" + search + "&apiKey=43bad964a94e4185b464d6eb3976c1d7"
                
        // Convert the URL string to a URL
        guard let url = URL(string: urlString) else {
            // Invalid URL, print an error message and return
            print("Invalid URL")
            return
        }
        
        // Create a URLSession for network requests
        let session = URLSession(configuration: .default)
        
        // Start a data task to fetch news data
        session.dataTask(with: url) { (data, _, err) in
            if err != nil {
                // An error occurred, print the error message and return
                print((err?.localizedDescription)!)
                return
            }
            
            // Parse JSON data using SwiftyJSON
            let json = try! JSON(data: data!)
            
            // Loop through articles in the JSON response
            for i in json["articles"] {
                let title = i.1["title"].stringValue
                let description = i.1["description"].stringValue
                let url = i.1["url"].stringValue
                let image = i.1["urlToImage"].stringValue
                let id = i.1["publishedAt"].stringValue
                
                // Append a new DataType instance to the datas array
                DispatchQueue.main.async {
                    self.datas.append(DataType(id: id, title: title, desc: description, url: url, image: image))
                }
            }
        }.resume() // Resume the data task to initiate the request
    }
}



//class GetData: ObservableObject {
//    
//    @Published var datas = [DataType]()
//    var search: String = "apple"
//    var searchS: String = "sport"
//    var searchC: String = "cars"
//    init(search: String = "apple") {
//        let urlString = "https://newsapi.org/v2/everything?q=" + search + "&apiKey=43bad964a94e4185b464d6eb3976c1d7"
//                
//        // convert url string to url
//        guard let url = URL(string: urlString) else {
//            // invalid
//            print("Invalid URL")
//            return
//        }
//        let session = URLSession(configuration: .default)
//        session.dataTask(with: url) { (data, _, err) in
//            if err != nil {
//                print((err?.localizedDescription)!)
//                return
//            }
//            let json = try! JSON(data: data!)
//            
//            for i in json["articles"] {
//                let title = i.1["title"].stringValue
//                let description = i.1["description"].stringValue
//                let url = i.1["url"].stringValue
//                let image = i.1["urlToImage"].stringValue
//                let id = i.1["publishedAt"].stringValue
//                
//                DispatchQueue.main.async {
//                    
//                    self.datas.append(DataType(id: id, title: title, desc: description, url: url, image: image))
//                }
//                
//                
//            }
//        }.resume()
//    }
//    init(searchC: String = "cars") {
//        let urlString = "https://newsapi.org/v2/everything?q=" + search + "&apiKey=f5e5ebd4d32440a99ce6d02597fdf690"
//                
//        // convert url string to url
//        guard let url = URL(string: urlString) else {
//            // invalid
//            print("Invalid URL")
//            return
//        }
//        let session = URLSession(configuration: .default)
//        session.dataTask(with: url) { (data, _, err) in
//            if err != nil {
//                print((err?.localizedDescription)!)
//                return
//            }
//            let json = try! JSON(data: data!)
//            
//            for i in json["articles"] {
//                let title = i.1["title"].stringValue
//                let description = i.1["description"].stringValue
//                let url = i.1["url"].stringValue
//                let image = i.1["urlToImage"].stringValue
//                let id = i.1["publishedAt"].stringValue
//                
//                DispatchQueue.main.async {
//                    
//                    self.datas.append( DataType(id: id, title: title, desc: description, url: url, image: image))
//                }
//                
//                
//            }
//        }.resume()
//    }
//    init(searchS: String = "sport") {
//        let urlString = "https://newsapi.org/v2/everything?q=" + search + "&apiKey=f5e5ebd4d32440a99ce6d02597fdf690"
//                
//        // convert url string to url
//        guard let url = URL(string: urlString) else {
//            // invalid
//            print("Invalid URL")
//            return
//        }
//        let session = URLSession(configuration: .default)
//        session.dataTask(with: url) { (data, _, err) in
//            if err != nil {
//                print((err?.localizedDescription)!)
//                return
//            }
//            let json = try! JSON(data: data!)
//            
//            for i in json["articles"] {
//                let title = i.1["title"].stringValue
//                let description = i.1["description"].stringValue
//                let url = i.1["url"].stringValue
//                let image = i.1["urlToImage"].stringValue
//                let id = i.1["publishedAt"].stringValue
//                
//                DispatchQueue.main.async {
//                    
//                    self.datas.append(DataType(id: id, title: title, desc: description, url: url, image: image))
//                }
//                
//                
//            }
//        }.resume()
//    }
//}
