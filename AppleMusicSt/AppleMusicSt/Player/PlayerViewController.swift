//
//  PlayerViewController.swift
//  AppleMusicSt
//
//  Created by 하혜선 on 2020/08/25.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class PlayerViewController: UIViewController {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var playControlButton: UIButton!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var totalDurationLabel: UILabel!
    
    let simplePlayer = SimplePlayer.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTintColor()
        updateTrackInfo()
    }

}

extension PlayerViewController {
    func updateTrackInfo() {
        guard let track = simplePlayer.currentItem?.convertToTrack() else {
            return
        }
        
        thumbnailImageView.image = track.artwork
        titleLabel.text = track.title
        artistLabel.text = track.artist
    }
    
    func updateTintColor() {
        playControlButton.tintColor = DefaultStyle.Colors.tint
        timeSlider.tintColor = DefaultStyle.Colors.tint
    }
 }
