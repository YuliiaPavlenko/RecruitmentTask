//
//  StartVC.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 02/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

class StartVC: UIViewController {

    var startPresenter = StartPresenter()

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
        
        startPresenter.viewDelegate = self
        
        setupView()
        setupGestureRecognizer()
    }
    
    fileprivate func setupGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    fileprivate func setupView() {
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        setImageViewConstraints()
    }

    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        startPresenter.screenClicked()
    }

    func setImageViewConstraints() {
        let widthHeight: CGFloat = 156.81
        logoImageView.widthAnchor.constraint(equalToConstant: widthHeight).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: widthHeight).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
    }
}

// MARK: StartViewDelegate
extension StartVC: StartViewDelegate {
    func showProfileVC() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
        //        UIView.transition(from: logoImageView, to: secondView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
    }
}
