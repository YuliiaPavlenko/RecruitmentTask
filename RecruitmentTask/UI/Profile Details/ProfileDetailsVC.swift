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
    let rowHeight: CGFloat = 74
    var profileDetailsPresenter = ProfileDetailsPresenter()
    var profileDetails = ProfileDetailsItemViewModel()
    var postsList = [PostViewModel]()
    
    // MARK: - Create UI Elements
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = Colors.separatorColor
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let editImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = Colors.green
        imageView.image = UIImage(named: "pencil.png")
//        imageView.layer.cornerRadius = imageView.frame.height / 2
//        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.setRounded()
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
        editImageView.layer.masksToBounds = true
        editImageView.layer.cornerRadius = editImageView.bounds.width / 2
        
        profileImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: view.frame.size.height * 0.4, enableInsets: false)
        editImageView.anchor(top: nil, left: nil, bottom: profileImage.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -33, paddingRight: 26, width: 66, height: 66, enableInsets: false)
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
        view.addSubview(editImageView)
        view.addSubview(tableView)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        profileDetailsPresenter.viewDelegate = self
        view.backgroundColor = .white
        customizeNavigationBar()
        addSubviews()
        setConstraints()
        setupTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ActivityCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profileDetailsPresenter.viewIsPrepared()
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
    
    private func setInfo() {
        profileImage.image = UIImage(named: profileDetails.image!)
        profileName.text = profileDetails.name
        profileEmail.text = profileDetails.email
        profilePhone.text = profileDetails.phone
        addressTitleLabel.text = "Adres"
        addressLabel.text = profileDetails.address
        companyTitleLabel.text = "Firma"
        companyLabel.text = profileDetails.company
        siteTitleLabel.text = "Strona"
        siteLabel.text = profileDetails.website
        activityLabel.text = "Aktywność"
    }

}

// MARK: - UITableView Delegate & DataSource
extension ProfileDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ActivityCell
        let currentItem = postsList[indexPath.row] 
        cell.postTitle.text = currentItem.postTitle
        cell.postBody.text = currentItem.postBody
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
}

// MARK: ProfileDetailsViewDelegate
extension ProfileDetailsVC: ProfileDetailsViewDelegate {
    func showProfileDetails(_ data: ProfileDetailsItemViewModel) {
        profileDetails = data
        setInfo()
    }
    
    func showPosts(_ data: [PostViewModel]) {
        postsList = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showProfileDetailsError() {
        let message = "Error getting data from API."
        let alert = UIAlertController.errorAlert(withMessage: message)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_: UIAlertAction!) in
        }))
        present(alert, animated: true)
    }
    
    func showDownloadPostsDataError(withMessage: String?) {
        let alert = CustomErrorAlert.setUpErrorAlert(withMessage)
        present(alert, animated: true)
    }
}
