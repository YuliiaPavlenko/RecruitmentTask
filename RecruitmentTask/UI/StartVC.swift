//
//  StartVC.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 02/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

class StartVC: UIViewController {

    let logoImageView: UIImageView = {
       let imageView = UIImageView()
       imageView.image = UIImage(named: "applover.png")
       imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        someImageViewConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggle(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func toggle(_ sender: UITapGestureRecognizer) {
        let vc = ProfileViewController()
        self.navigationController?.pushViewController(vc, animated: true)
//        UIView.transition(from: logoImageView, to: secondView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
    }
    
    func someImageViewConstraints() {
        let widthHeight: CGFloat = 156.81
        logoImageView.widthAnchor.constraint(equalToConstant: widthHeight).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: widthHeight).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
    }
}
