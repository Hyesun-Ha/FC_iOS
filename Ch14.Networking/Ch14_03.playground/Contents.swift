/*
Ch14-03. 스위프트 Networking
URLSession 실습2
*/

import UIKit

// URLSession

// 1. URLSessionConfiguration
// 2. URLSession
// 3. URLSessionTask 를 이용해서 서버와 네트워킹

// URLSessionTask

// - dataTask
// - uploadTask
// - downloadTask

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

// URL
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")

let mediaQuerry = URLQueryItem(name: "media", value: "music")
let entityQuerry = URLQueryItem(name: "entity", value: "song")
let termQuerry = URLQueryItem(name: "term", value: "샤이니")

urlComponents?.queryItems?.append(mediaQuerry)
urlComponents?.queryItems?.append(entityQuerry)
urlComponents?.queryItems?.append(termQuerry)

let requestURL = urlComponents?.url

struct Response: Codable {
    let resultCount: Int
    let tracks: [Track]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case tracks = "results"
    }
}

struct Track: Codable {
    let title: String
    let artistName: String
    let thumbnailPath: String
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case artistName
        case thumbnailPath = "artworkUrl100"
    }
}

let dataTask = session.dataTask(with: requestURL!) { (data, response, error) in
    guard error == nil else {
        return
    }
    
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
        return
    }
    
    let successRange = 200..<300
    
    guard successRange.contains(statusCode) else {
        // handle response error
        return
    }
    
    guard let resultData = data else {
        return
    }
    
//    let resultString = String(data: resultData, encoding: .utf8)
//    print("---> Result: \(String(describing: resultString))")
    
    // 목표: TrackList Object 가져오기
    
    // 하고 싶은 것들
    // Data -> Track 목록으로 가져오고 싶다 [Track]
    // - Track 오브젝트를 만들어야겠다
    // Data 에서 Struct로 파싱하고 싶다. > Codable을 이용해서 만들자
    // - Json 형태의 파일, 데이터 > Object로 만들 때 Codable을 이용하겠다
    // - Response, Track 이렇게 두개 만들어야겠다
    
    // 해야 할일
    // - Response, Track Struct
    // - struct의 프로퍼티 이름과 실제 데이터의 키를 맞추기(Codable Decoding 가능하게 하기 위해서)
    // - 파싱하기(Decoding)
    // - TrackList 가져오기
    
    // 파싱 및 track 가져오기
    
    do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(Response.self, from: resultData)
        let tracks = response.tracks
        
        print("---> tracks: \(tracks.count)")
        print("---> tracks: \(tracks.last?.title), \(tracks.last?.thumbnailPath)")
    } catch let error {
        print("---> error: \(error.localizedDescription)")
    }
    
}

dataTask.resume()
