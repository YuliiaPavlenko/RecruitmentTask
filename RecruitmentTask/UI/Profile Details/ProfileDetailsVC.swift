//
//  ProfileDetailsVC.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 03/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

class ProfileDetailsVC: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        customizeNavigationBar()
    }
    
    private func customizeNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}
