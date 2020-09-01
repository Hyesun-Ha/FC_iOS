//
//  Todo.swift
//  TodoList
//
//  Created by 하혜선 on 2020/09/01.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit

// TODO: Codable과 Equatable 추가
struct Todo {
    let id: Int
    
    var isDone: Bool
    var detail: String
    var isToday: Bool
}
