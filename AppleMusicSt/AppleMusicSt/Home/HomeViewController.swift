//
//  ViewController.swift
//  AppleMusicSt
//
//  Created by 하혜선 on 2020/08/24.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: 트랙매니저에서 트랙갯수 가져오기
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: 셀 구성하기
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackCollectionViewCell", for: indexPath) as? TrackCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    // TODO: 헤더 뷰 작성
}

extension HomeViewController: UICollectionViewDelegate {
    // 클릭 했을 때 동작
    // TODO: 곡 클릭시 플레이어뷰 띄우기
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
