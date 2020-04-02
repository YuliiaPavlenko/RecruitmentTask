//
//  StartVC.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 02/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit
import PureLayout

class StartVC: UIViewController {

    let someImageView: UIImageView = {
       let theImageView = UIImageView()
       theImageView.image = UIImage(named: "applover.png")
       theImageView.translatesAutoresizingMaskIntoConstraints = false
       return theImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(someImageView)
        someImageViewConstraints()
    }
    
    func someImageViewConstraints() {
        let widthHeight: CGFloat = 156.81
        someImageView.widthAnchor.constraint(equalToConstant: widthHeight).isActive = true
        someImageView.heightAnchor.constraint(equalToConstant: widthHeight).isActive = true
        someImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        someImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
    }
}
