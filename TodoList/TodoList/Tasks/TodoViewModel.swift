//
//  TodoViewModel.swift
//  TodoList
//
//  Created by 하혜선 on 2020/08/31.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit

class TodoViewModel {
    enum Section: Int, CaseIterable {
        case today
        case upcoming
        
        var title: String {
            switch self {
            case .today:
                return "Today"
            default:
                return "Upcoming"
            }
        }
    }
}
