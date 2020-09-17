//
//  SearchAPI.swift
//  MyNetflix
//
//  Created by 하혜선 on 2020/09/17.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit

class SearchAPI: NSObject {
    static func search(_ term: String, completion: @escaping ([Movie]) -> Void) {
        completion([])
        
        let session = URLSession(configuration: .default)
        
        var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")
        let mediaQuery = URLQueryItem(name: "media", value: "movie")
        let entityQuery = URLQueryItem(name: "entity", value: "movie")
        let termQuery = URLQueryItem(name: "term", value: term)
        
        urlComponents?.queryItems?.append(mediaQuery)
        urlComponents?.queryItems?.append(entityQuery)
        urlComponents?.queryItems?.append(termQuery)
        
        guard let requestURL = urlComponents?.url else {
            print("---> requestURL not exist")
            return
        }
        
        let dataTask = session.dataTask(with: requestURL) {
            data, response, error in
            let sucessRange = 200..<300
            
            guard error == nil, let statusCode = (response as? HTTPURLResponse)?.statusCode, sucessRange.contains(statusCode) else {
                print("---> error: \(String(describing: error?.localizedDescription))")
                return
            }

            guard let resultData = data else {
                completion([])
                return
            }
                    
            let movies = SearchAPI.parseMovies(resultData)
            completion(movies)
        }
        
        dataTask.resume()
    }
    
    static func parseMovies(_ data: Data) -> [Movie] {
        let decoder = JSONDecoder()

        do {
            let response = try decoder.decode(Response.self, from: data)
            let movies = response.movies

            return movies
        } catch let error {
            print("---> Parsing error:: \(error.localizedDescription)")
            return []
        }
    }
}

struct Movie: Codable {
    let title: String
    let director: String
    let thumbnailPath: String
    let previewURL: String
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case director = "artistName"
        case thumbnailPath = "artworkUrl100"
        case previewURL = "previewUrl"
    }
}

struct Response: Codable {
    let resultCount: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case movies = "results"
    }
}
