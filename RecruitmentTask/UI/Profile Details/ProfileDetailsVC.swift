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

    private let profileName = CustomLabel.createProfileNameLabel()
    private let profileEmail = CustomLabel.createProfileDetailsLabel()
    private let profilePhone = CustomLabel.createProfileDetailsLabel()
    
    
    private let addressTitleLabel = CustomLabel.createTitleLabel()
    private let addressLabel = CustomLabel.createAddressLabel()
    
    private let companyTitleLabel = CustomLabel.createTitleLabel()
    private let companyLabel = CustomLabel.createAddressLabel()
    
    private let siteTitleLabel = CustomLabel.createTitleLabel()
    private let siteLabel = CustomLabel.createAddressLabel()
    
    private let activityLabel = CustomLabel.createTitleLabel()
    
    // MARK: - Set Constraints
    private func setConstraints() {
        let profileInfoStackView = createProfileInfoStackView(arrangedSubviews: [profileName, profileEmail, profilePhone])
        let addressStackView = createProfileInfoStackView(arrangedSubviews: [addressTitleLabel, addressLabel])
        let companyStackView = createProfileInfoStackView(arrangedSubviews: [companyTitleLabel, companyLabel])
        let siteStackView = createProfileInfoStackView(arrangedSubviews: [siteTitleLabel, siteLabel])
        
        profileImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: view.frame.size.height * 0.4, enableInsets: false)
        profileInfoStackView.anchor(top: nil, left: view.leftAnchor, bottom: profileImage.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 25, paddingBottom: 16, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        addressStackView.anchor(top: profileImage.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 28, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        companyStackView.anchor(top: addressStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 14, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 0, enableInsets: false)
        siteStackView.anchor(top: companyStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 14, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 0, enableInsets: false)
        activityLabel.anchor(top: siteStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 14, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
    }
    
    private func createProfileInfoStackView(arrangedSubviews: [UILabel]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 7
        view.addSubview(stackView)
        return stackView
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
        view.addSubview(activityLabel)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        customizeNavigationBar()
        addSubviews()
        setConstraints()
        addTestInfo()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func customizeNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func addTestInfo() {
        profileName.text = "Maria Smith"
        profileEmail.text = "m.smith@gmail.com"
        profilePhone.text = "+48 000 000 000"
        addressTitleLabel.text = "Adres"
        addressLabel.text = "ul. Świeradowska 77, 50-559 Wrocław"
        companyTitleLabel.text = "Firma"
        companyLabel.text = "Applover Software House, ul. Świeradowska 77, 50-559 Wrocław"
        siteTitleLabel.text = "Strona"
        siteLabel.text = "Applover.pl"
        activityLabel.text = "Aktywność"
    }
}
