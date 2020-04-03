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
        setupTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.separatorColor = Colors.separatorColor
        tableView.register(ProfileCell.self, forCellReuseIdentifier: cellId)
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
}


// MARK: - UITableView Delegate & DataSource
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProfileCell
        cell.userNameLabel.text = "Test Name"
        cell.userEmailLabel.text = "Test Email"
        cell.userPhoneLabel.text = "1234567890"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = ProfileDetailsVC()
        self.navigationController?.pushViewController(detailsVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
