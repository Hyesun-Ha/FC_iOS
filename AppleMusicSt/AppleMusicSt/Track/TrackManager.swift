//
//  TrackManager.swift
//  AppleMusicSt
//
//  Created by 하혜선 on 2020/08/25.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit
import AVFoundation

class TrackManager {
    var tracks: [AVPlayerItem] = []
    var albums: [Album] = []
    var todaysTrack: AVPlayerItem?
    
    init() {
        self.tracks = loadTracks()
        self.albums = loadAlbums(tracks: tracks)
        self.todaysTrack = self.tracks.randomElement()
    }
    
    func loadAlbums(tracks: [AVPlayerItem]) -> [Album] {
        var albums: [Album] = []

        let trackList = tracks.compactMap { $0.convertToTrack() }
        let albumDics = Dictionary(grouping: trackList, by: { track in  track.albumName })

        for (key, value) in albumDics {
            let title = key
            let tracks = value
            let album = Album(title: title, tracks: tracks)
            albums.append(album)
        }

        return albums
    }
    
    func loadTracks() -> [AVPlayerItem] {
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? []
        let tracks = urls.map{ AVPlayerItem(url: $0) }
        
        return tracks
    }
    
    func track(at index: Int) -> Track? {
        return tracks[index].convertToTrack()
    }
}
