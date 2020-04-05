//
//  ProfileDetailsViewController.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 03/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit
import PKHUD

class ProfileDetailsViewController: UIViewController {
    let tableView = UITableView()
    let cellId = "cellId"
    var profileDetailsPresenter = ProfileDetailsPresenter()
    var profileDetails = ProfileDetailsItemViewModel()
    var postsList = [PostViewModel]()

    // MARK: - Create UI Elements
    private let profileImage = ProfileDetailsViewElements.createProfileImage()
    private let editView = ProfileDetailsViewElements.createEditView()
    private let editImageView = ProfileDetailsViewElements.createEditImageView()

    private let profileName = ProfileDetailsViewElements.createProfileNameLabel()
    private let profileEmail = ProfileDetailsViewElements.createProfileDetailsLabel()
    private let profilePhone = ProfileDetailsViewElements.createProfileDetailsLabel()

    private let addressTitleLabel = ProfileDetailsViewElements.createTitleLabel()
    private let addressLabel = ProfileDetailsViewElements.createAddressLabel()

    private let companyTitleLabel = ProfileDetailsViewElements.createTitleLabel()
    private let companyLabel = ProfileDetailsViewElements.createAddressLabel()

    private let siteTitleLabel = ProfileDetailsViewElements.createTitleLabel()
    private let siteLabel = ProfileDetailsViewElements.createAddressLabel()

    private let activityLabel = ProfileDetailsViewElements.createTitleLabel()

    // MARK: - Set Constraints
    private func setConstraints() {
        let profileInfoStackView = ProfileDetailsViewElements.createVerticalStackView(arrangedSubviews: [profileName, profileEmail, profilePhone])
        let addressStackView = ProfileDetailsViewElements.createVerticalStackView(arrangedSubviews: [addressTitleLabel, addressLabel])
        let companyStackView = ProfileDetailsViewElements.createVerticalStackView(arrangedSubviews: [companyTitleLabel, companyLabel])
        let siteStackView = ProfileDetailsViewElements.createVerticalStackView(arrangedSubviews: [siteTitleLabel, siteLabel])

        view.addSubview(profileInfoStackView)
        view.addSubview(addressStackView)
        view.addSubview(companyStackView)
        view.addSubview(siteStackView)

        profileImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: view.frame.size.height * 0.4, enableInsets: false)
        editView.anchor(top: nil, left: nil, bottom: profileImage.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -33, paddingRight: 26, width: 66, height: 66, enableInsets: true)
        editImageView.anchor(top: editView.topAnchor, left: editView.leftAnchor, bottom: nil, right: nil, paddingTop: 17, paddingLeft: 17, paddingBottom: 0, paddingRight: 0, width: 34, height: 34, enableInsets: true)
        profileInfoStackView.anchor(top: nil, left: view.leftAnchor, bottom: profileImage.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 25, paddingBottom: 16, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        addressStackView.anchor(top: profileImage.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 28, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        companyStackView.anchor(top: addressStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 14, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 0, enableInsets: false)
        siteStackView.anchor(top: companyStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 14, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 0, enableInsets: false)
        activityLabel.anchor(top: siteStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 14, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        profileDetailsPresenter.viewDelegate = self
        view.backgroundColor = .white
        customizeNavigationBar()
        addSubviews()
        setConstraints()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profileDetailsPresenter.viewIsPrepared()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        setNeedsStatusBarAppearanceUpdate()
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
        view.addSubview(editView)
        editView.addSubview(editImageView)
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        configureConstraintsForTableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ActivityCell.self, forCellReuseIdentifier: cellId)
        
        tableView.separatorColor = .clear
    }
    
    func configureConstraintsForTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: activityLabel.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    private func customizeNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    private func setProfileInformation() {
        profileImage.image = UIImage(named: profileDetails.image!)
        profileName.text = profileDetails.name ?? "Maria Smith"
        profileEmail.text = profileDetails.email ?? "m.smith@gmail.com"
        profilePhone.text = profileDetails.phone ?? "+48 000 000 000"
        addressTitleLabel.text = "Address"
        addressLabel.text = profileDetails.address ?? "ul. Świeradowska 77, 50-559 Wrocław"
        companyTitleLabel.text = "Company"
        companyLabel.text = profileDetails.company ?? "Applover Software House , ul. Świeradowska 77, 50-559 Wrocław"
        siteTitleLabel.text = "Website"
        siteLabel.text = profileDetails.website ?? "Applover.pl"
        activityLabel.text = "Activity"
    }

}

// MARK: - UITableView Delegate & DataSource
extension ProfileDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ActivityCell
        let currentItem = postsList[indexPath.row]
        cell.postTitle.text = currentItem.postTitle?.capitalized ?? "No posts"
        cell.postBody.text = currentItem.postBody?.capitalized ?? "No posts"
        cell.profileImage.image = UIImage(named: currentItem.postImage)
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

}

// MARK: ProfileDetailsViewDelegate
extension ProfileDetailsViewController: ProfileDetailsViewDelegate {
    func showProfileDetails(_ data: ProfileDetailsItemViewModel) {
        profileDetails = data
        setProfileInformation()
    }

    func showPosts(_ data: [PostViewModel]) {
        postsList = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func showProfileDetailsError() {
        let alert = CustomErrorAlert.setUpErrorAlert(nil)
        present(alert, animated: true)
    }

    func showDownloadPostsDataError(withMessage: DisplayErrorModel) {
        let alert = CustomErrorAlert.setUpErrorAlert(withMessage)
        present(alert, animated: true)
    }

    func showProgress() {
        HUD.show(.progress)
    }

    func hideProgress() {
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
            HUD.hide()
        }
    }
}
