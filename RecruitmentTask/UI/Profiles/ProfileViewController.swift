//
//  ProfileViewController.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 02/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    let tableView = UITableView()
    let cellId = "cellId"
    let rowHeight: CGFloat = 64
    var profilePresenter = ProfilePresenter()
    var profilesList = [ProfileItemViewModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        customizeNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePresenter.viewDelegate = self
        setupTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.separatorColor = Colors.separatorColor
        tableView.register(ProfileCell.self, forCellReuseIdentifier: cellId)
        refreshData()
    }
    
    func setupTableView() {
      view.addSubview(tableView)
      tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func customizeNavigationBar() {
        self.title = "Profiles"
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.barTintColor = Colors.green
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Colors.white, .font: Fonts.navigationTitle!]
    }
    
    func refreshData() {
        profilePresenter.getUsers()
    }
}


// MARK: - UITableView Delegate & DataSource
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profilesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProfileCell
        let currentItem = profilesList[indexPath.row]
        cell.userNameLabel.text = currentItem.name
        cell.userEmailLabel.text = currentItem.email
        cell.userPhoneLabel.text = currentItem.phone
        cell.profileImage.image = UIImage(named: currentItem.image!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        profilePresenter.profileClicked(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: ProfileViewDelegate
extension ProfileViewController: ProfileViewDelegate {
    func showUsersData(_ data: [ProfileItemViewModel]) {
        profilesList = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showProfileDetails() {
        let detailsVC = ProfileDetailsVC()
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func showDownloadUsersDataError(withMessage: String?) {
        let alert = CustomErrorAlert.setUpErrorAlert(withMessage)
        present(alert, animated: true)
    }
}
