//
//  HomeViewController.swift
//  MyNetflix
//
//  Created by 하혜선 on 2020/09/17.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        // Miffy에 대한 정보를 검색 API로 가져온다.
        // 거기서 Miffy 객체 하나를 가져온다.
        // 그 객체를 이용해서 PlayerViewController를 띄운다
        SearchAPI.search("Miffy") {
            movies in
            guard let miffy = movies.first else {
                return
            }
            
            DispatchQueue.main.async {
                guard let url = URL(string: miffy.previewURL) else {
                    return
                }
                
                let item = AVPlayerItem(url: url)
                
                let sb = UIStoryboard(name: "Player", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
                
                vc.player.replaceCurrentItem(with: item)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
            }
        }
    }
    
}
