//
//  SearchViewController.swift
//  MyNetflix
//
//  Created by 하혜선 on 2020/09/17.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = resultCollectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else {
                return UICollectionViewCell()
        }
        return cell
    }
    
    
}

class ResultCell: UICollectionViewCell {
    @IBOutlet weak var movieThumbnail: UIImageView!
}
