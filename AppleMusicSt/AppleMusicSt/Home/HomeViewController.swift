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
        // TODO: 트랙매니저에서 트랙갯수 가져오기
        return trackManager.tracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: 셀 구성하기
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackCollectionViewCell", for: indexPath) as? TrackCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let item = trackManager.track(at: indexPath.item)
        cell.updateUI(item: item)
        
        return cell
    }
    
    // TODO: 헤더 뷰 작성
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
            
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    // 클릭 했을 때 동작
    // TODO: 곡 클릭시 플레이어뷰 띄우기
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
    // 컬렉션뷰의 사이즈
    // TODO: 셀사이즈 구하기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 20
        let spacing: CGFloat = 20
        let width: CGFloat = (collectionView.bounds.width - spacing) / 2 - margin
        let height: CGFloat = width + 60
        
        return CGSize(width: width, height: height)
    }
}
