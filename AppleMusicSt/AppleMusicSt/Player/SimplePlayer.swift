//
//  SimplePlayer.swift
//  AppleMusicSt
//
//  Created by 하혜선 on 2020/08/25.
//  Copyright © 2020 하혜선. All rights reserved.
//

import AVFoundation

class SimplePlayer {
    // TODO: 싱글톤 만들기, 왜 만드는가?
    static let shared = SimplePlayer()
    
    private let player = AVPlayer()
    
    var currentItem: AVPlayerItem? {
        return player.currentItem
    }
    
    var currentTime: Double {
        // TODO: currentTime 구하기
        return player.currentItem?.currentTime().seconds ?? 0
    }
    
    var totalDurationTime: Double {
        // TODO: totalDurationTime 구하기
        return player.currentItem?.duration.seconds ?? 0
    }
    
    var isPlaying: Bool {
        return player.isPlaying
    }
    
    func play() {
        player.play()
    }
    
    func pause() {
        player.pause()
    }
    
    func seek(to time: CMTime) {
        player.seek(to: time)
    }
    
    func replaceCurrentItem(with Item: AVPlayerItem?) {
        player.replaceCurrentItem(with: Item)
    }
    
    func addPeriodicTimeObserver(forInterval: CMTime, queue: DispatchQueue?, using: @escaping (CMTime) -> Void) {
        player.addPeriodicTimeObserver(forInterval: forInterval, queue: queue, using: using)
    }
}

extension AVPlayer {
    var isPlaying : Bool {
        guard self.currentItem != nil else {
            return false
        }
        
        return self.rate != 0
    }
}
