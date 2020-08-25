//
//  SimplePlayer.swift
//  AppleMusicSt
//
//  Created by 하혜선 on 2020/08/25.
//  Copyright © 2020 하혜선. All rights reserved.
//

import AVFoundation

class SimplePlayer: NSObject {
    static let shared = SimplePlayer()
    
    private let player = AVPlayer()
    
    var currentItem: AVPlayerItem? {
        return player.currentItem
    }
    
    func replaceCurrentItem(with Item: AVPlayerItem?) {
        player.replaceCurrentItem(with: Item)
    }
}
