//
//  HomeViewController.swift
//  MyNetflix
//
//  Created by 하혜선 on 2020/09/17.
//  Copyright © 2020 하혜선. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        // Miffy에 대한 정보를 검색 API로 가져온다.
        // 거기서 Miffy 객체 하나를 가져온다.
        // 그 객체를 이용해서 PlayerViewController를 띄운다
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
