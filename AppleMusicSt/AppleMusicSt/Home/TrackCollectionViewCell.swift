//
//  TrackCollectionViewCell.swift
//  AppleMusicSt
//
//  Created by 하혜선 on 2020/08/24.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit

class TrackCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var trackThumbnail: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var trackArtist: UILabel!
    
    
    override func awakeFromNib() {
        trackThumbnail.layer.cornerRadius = 8
        trackArtist.textColor = UIColor.systemGray
    }
    
    func updateUI(item: Track?) {
        guard let track = item else {
            return
        }
        
        trackThumbnail.image = track.artwork
        trackTitle.text = track.title
        trackArtist.text = track.artist
    }
}
