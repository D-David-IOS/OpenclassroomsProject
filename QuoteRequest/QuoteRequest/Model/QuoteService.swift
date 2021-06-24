//
//  QuoteService.swift
//  QuoteRequest
//
//  Created by Debehogne David on 22/06/2021.
//

import Foundation

class QuoteService {
    private static let quoteUrl = URL(string: "http://api.forismatic.com/api/1.0/")!
    private static let pictureUrl = URL(string: "https://source.unsplash.com/random/1000x1000")!
    
    static func getQuote(callback: @escaping (Bool, Quote?)-> Void) {
        var request = URLRequest(url: quoteUrl)
        request.httpMethod = "POST"
        let body = "method=getQuote&format=json&lang=en"
        request.httpBody = body.data(using: .utf8)
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, error == nil {
                    if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                        if let responseJSON = try? JSONDecoder().decode([String: String].self, from: data),
                           let text = responseJSON["quoteText"],
                           let author = responseJSON["quoteAuthor"] {
                            getImage {(data) in
                                if let data = data {
                                    let quote = Quote(text: text, author: author, imageData: data)
                                    callback(true, quote)
                                } else {
                                    callback(false, nil)
                                }
                            }
                        }else {
                            callback(false, nil)
                        }
                    } else {
                        callback(false, nil)
                    }
                } else {
                    callback(false, nil)
                }
            }
        }
        task.resume()
    }
    private static func getImage(completionHandler : @escaping (Data?)-> Void){
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: pictureUrl) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, error == nil {
                    if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                        completionHandler(data)
                    } else {
                        completionHandler(nil)
                    }
                } else {
                    completionHandler(nil)
                }
            }
        }
        task.resume()
    }
}
