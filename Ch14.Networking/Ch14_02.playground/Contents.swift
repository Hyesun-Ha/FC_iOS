/*
Ch14-02. 스위프트 Networking
URLSession 실습
*/

import UIKit

// URL

let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=Shinee"
let url = URL(string: urlString)

url?.absoluteString
url?.scheme
url?.host
url?.path
url?.query
url?.baseURL

let baseURL = URL(string: "https://itunes.apple.com")
let relativeURL = URL(string: "search?media=music&entity=song&term=Shinee", relativeTo: baseURL)

relativeURL?.absoluteString
relativeURL?.scheme
relativeURL?.host
relativeURL?.path
relativeURL?.query
relativeURL?.baseURL

// URLComponents
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")

let mediaQuerry = URLQueryItem(name: "media", value: "music")
let entityQuerry = URLQueryItem(name: "entity", value: "song")
let termQuerry = URLQueryItem(name: "term", value: "샤이니")

urlComponents?.queryItems?.append(mediaQuerry)
urlComponents?.queryItems?.append(entityQuerry)
urlComponents?.queryItems?.append(termQuerry)

urlComponents?.url?.scheme
urlComponents?.string
urlComponents?.queryItems?.last?.value

