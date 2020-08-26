//
//  ViewController.swift
//  AppleMusicSt
//
//  Created by 하혜선 on 2020/08/24.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let trackManager: TrackManager = TrackManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trackManager.tracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackCollectionViewCell", for: indexPath) as? TrackCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let item = trackManager.track(at: indexPath.item)
        cell.updateUI(item: item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TrackCollectionHeaderView", for: indexPath) as? TrackCollectionHeaderView else {
                return UICollectionReusableView()
            }
            
            guard let item = trackManager.todaysTrack else {
                return UICollectionReusableView()
            }
            
            header.update(with: item)
            header.tapHandler = { item in
                let playerStoryBoard = UIStoryboard.init(name: "Player", bundle: nil)
                
                guard let playerVC = playerStoryBoard.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else {
                    return
                }
            
                playerVC.simplePlayer.replaceCurrentItem(with: item)
                self.present(playerVC, animated: true, completion: nil)
            }
            
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let playerStoryBoard = UIStoryboard.init(name: "Player", bundle: nil)
        
        guard let playerVC = playerStoryBoard.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else {
            return
        }
        
        let item = trackManager.tracks[indexPath.item]
        playerVC.simplePlayer.replaceCurrentItem(with: item)
        
        present(playerVC, animated: true, completion: nil)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 20
        let spacing: CGFloat = 20
        let width: CGFloat = (collectionView.bounds.width - spacing) / 2 - margin
        let height: CGFloat = width + 60
        
        return CGSize(width: width, height: height)
    }
}
