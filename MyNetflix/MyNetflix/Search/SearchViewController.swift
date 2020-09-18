//
//  SearchViewController.swift
//  MyNetflix
//
//  Created by 하혜선 on 2020/09/17.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    var movies: [Movie] = []
    
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
        
        guard let searchTerm = searchBar.text, searchTerm.isEmpty == false else {
            return
        }
        
        print("---> 검색어: \(String(describing: searchBar.text))")
        
        SearchAPI.search(searchTerm){ movies in
            print("총 개수: \(movies.count), 첫 번째 영화 제목: \(String(describing: movies.first?.title))")
            
            DispatchQueue.main.async {
                self.movies = movies
                self.resultCollectionView.reloadData()
            }
        }
    }
}

// MARK: CollectionView
extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = resultCollectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else {
                return UICollectionViewCell()
        }
        
        let movie = movies[indexPath.item]
        
        guard let thumbnailURL = URL(string: movie.thumbnailPath) else {
            return UICollectionViewCell()
        }
        
        cell.movieThumbnail.kf.setImage(with: thumbnailURL)
        
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
