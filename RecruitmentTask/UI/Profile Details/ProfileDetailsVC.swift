//
//  ProfileDetailsVC.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 03/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

class ProfileDetailsVC: UIViewController {
    let tableView = UITableView()
    let cellId = "cellId"
    
    // MARK: - Create UI Elements
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
        let profileInfoStackView = CustomStackView.createVerticalStackView(arrangedSubviews: [profileName, profileEmail, profilePhone])
        let addressStackView = CustomStackView.createVerticalStackView(arrangedSubviews: [addressTitleLabel, addressLabel])
        let companyStackView = CustomStackView.createVerticalStackView(arrangedSubviews: [companyTitleLabel, companyLabel])
        let siteStackView = CustomStackView.createVerticalStackView(arrangedSubviews: [siteTitleLabel, siteLabel])
        
        view.addSubview(profileInfoStackView)
        view.addSubview(addressStackView)
        view.addSubview(companyStackView)
        view.addSubview(siteStackView)
        
        profileImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: view.frame.size.height * 0.4, enableInsets: false)
        profileInfoStackView.anchor(top: nil, left: view.leftAnchor, bottom: profileImage.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 25, paddingBottom: 16, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        addressStackView.anchor(top: profileImage.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 28, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        companyStackView.anchor(top: addressStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 14, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 0, enableInsets: false)
        siteStackView.anchor(top: companyStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 14, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 0, enableInsets: false)
        activityLabel.anchor(top: siteStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 14, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
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
        view.addSubview(tableView)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        customizeNavigationBar()
        addSubviews()
        setConstraints()
        addTestInfo()
        setupTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ActivityCell.self, forCellReuseIdentifier: cellId)
    }
      
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }

    func setupTableView() {
      tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.topAnchor.constraint(equalTo: activityLabel.bottomAnchor).isActive = true
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.separatorColor = .clear
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

// MARK: - UITableView Delegate & DataSource
extension ProfileDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ActivityCell
        cell.postTitle.text = "Tytuł"
        cell.postBody.text = "Applover Software House, ul. Świeradowska 77, 50-559 Wrocław. Applover Software House, ul. Świeradowska 77, 50-559 Wrocław. Applover Software House, ul. Świeradowska 77, 50-559 Wrocław"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
    
}
