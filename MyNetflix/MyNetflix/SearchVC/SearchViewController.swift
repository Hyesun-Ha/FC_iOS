//
//  SearchViewController.swift
//  MyNetflix
//
//  Created by 하혜선 on 2020/09/17.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
}

// MARK: Keyboard
extension SearchViewController: UISearchBarDelegate {
    private func dissmissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dissmissKeyboard()
        
        // 검색어가 있는지 확인
        guard let searchTerm = searchBar.text, searchTerm.isEmpty == false else {
            return
        }
        
        // 네트워킹을 통한 검색
        // - 최종 목표: searchTerm 을 가지고 네트워킹을 통해 검색
        // - [] 검색 API가 필요
        // - [] 검색 모델을 받아올 모델 Movie, Response
        // - [] 검색 결과를 받아와서 Collectionview로 표현
        
    }
}

// MARK: CollectionView
extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = resultCollectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else {
                return UICollectionViewCell()
        }
        return cell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 8
        let itemSpacing: CGFloat = 10
        let width: CGFloat = (collectionView.bounds.width - margin * 2 - itemSpacing * 2) / 3
        let height: CGFloat = width / 7 * 10
        
        return CGSize(width: width, height: height)
    }
}

// MARK: ResultCell
class ResultCell: UICollectionViewCell {
    @IBOutlet weak var movieThumbnail: UIImageView!
}
