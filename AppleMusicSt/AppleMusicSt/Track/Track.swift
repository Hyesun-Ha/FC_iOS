//
//  Track.swift
//  AppleMusicSt
//
//  Created by 하혜선 on 2020/08/25.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit

struct Track {
    let title: String
    let artist: String
    let albumName: String
    let artwork: UIImage
    
    init(title: String, artist: String, albumName: String, artwork: UIImage) {
        self.title = title
        self.artist = artist
        self.albumName = albumName
        self.artwork = artwork
    }
}
