//
//  BountyInfo.swift
//  BountyList
//
//  Created by 하혜선 on 2020/08/19.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit

struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
