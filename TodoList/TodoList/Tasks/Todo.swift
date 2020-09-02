//
//  Todo.swift
//  TodoList
//
//  Created by 하혜선 on 2020/09/01.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit

// TODO: Codable과 Equatable 추가
struct Todo: Codable, Equatable {
    let id: Int
    
    var isDone: Bool
    var detail: String
    var isToday: Bool
    
    mutating func update(isDone: Bool, detail: String, isToday: Bool){
        self.isDone = isDone
        self.detail = detail
        self.isToday = isToday
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
