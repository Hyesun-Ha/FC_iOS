//
//  Storage.swift
//  TodoList
//
//  Created by 하혜선 on 2020/09/02.
//  Copyright © 2020 하혜선. All rights reserved.
//

import Foundation

public class Storage: NSObject {
    private override init() { }
    
    enum Directory {
        case documents
        case caches
        
        var url: URL {
            let path: FileManager.SearchPathDirectory
            switch self {
            case .documents:
                path = .documentDirectory
            case .caches:
                path = .cachesDirectory
            }
            return FileManager.default.urls(for: path, in: .userDomainMask).first!
        }
    }
    
    static func retrive<T: Decodable>(_ fileName: String, from directory: Directory, as type: T.Type) -> T? {
        let url = directory.url.appendingPathComponent(fileName, isDirectory: false)
        
        guard FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        
        guard let data = FileManager.default.contents(atPath: url.path) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        
        do {
            let model = try decoder.decode(type, from: data)
            return model
        } catch let error {
            print("---> Failed to decode msg: \(error.localizedDescription)")
            return nil
        }
    }
    
}
