//
//  ProfileDetailsVC.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 03/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

class ProfileDetailsVC: UIViewController {
    
    // MARK: - Create Labels
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "testUserPicture.png")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let profileName = CustomLabel.profileNameLabel
    private let profileEmail = CustomLabel.profileDetailsLabel
    private let profilePhone = CustomLabel.profileDetailsLabel
    
    private let addressTitleLabel = CustomLabel.titleLabel
    private let addressLabel = CustomLabel.addressLabel
    
    private let companyTitleLabel = CustomLabel.titleLabel
    private let companyLabel = CustomLabel.addressLabel
    
    private let siteTitleLabel = CustomLabel.titleLabel
    private let siteLabel = CustomLabel.addressLabel
    
    // MARK: - Set Constraints
    private func setConstraints() {
        profileImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: view.frame.size.height * 0.4, enableInsets: false)

//        let stackView = UIStackView(arrangedSubviews: [profileName, profileEmail, profilePhone])
//        stackView.distribution = .equalSpacing
//        stackView.axis = .vertical
//        stackView.spacing = 7
//        view.addSubview(stackView)
//        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 218, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }
    
    private func addSubviews() {
        view.addSubview(profileImage)
        view.addSubview(profileName)
        view.addSubview(profileEmail)
        view.addSubview(profilePhone)
        view.addSubview(addressLabel)
        view.addSubview(companyTitleLabel)
        view.addSubview(companyLabel)
        view.addSubview(siteTitleLabel)
        view.addSubview(siteLabel)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        customizeNavigationBar()
        addSubviews()
        setConstraints()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func customizeNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }  
}
