//
//  ProfileViewController.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 02/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit
import PKHUD
import RxSwift


class ProfileViewController: UIViewController {
    let tableView = UITableView()
//    let cellId = "cellId"
    var profilePresenter = ProfilePresenter()
    var profileViewModel = [ProfileModel]()
    private let disposeBag = DisposeBag()
//    var profileViewModel = [ProfileViewModel]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        customizeNavigationBar(animated)
//        setupUsersObserver()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        profilePresenter.viewDelegate = self
        setupTableView()
        profilePresenter.viewIsPrepared()
        setupUsersObserver()
//        setupCellConfiguration()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        configureConstraintsForTableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.separatorColor = Colors.separatorColor
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.Identifier)
    }
    
    fileprivate func configureConstraintsForTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

    func customizeNavigationBar(_ animated: Bool) {
        title = "Profiles"
        navigationItem.setHidesBackButton(true, animated: animated)
        navigationController?.navigationBar.barTintColor = Colors.green
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Colors.white, .font: Fonts.navigationTitle!]
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
}

// MARK: - UITableView Delegate & DataSource
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profilePresenter.usersList.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.Identifier, for: indexPath) as? ProfileCell else {
          //Something went wrong with the identifier.
          return UITableViewCell()
        }
        
        let user = profilePresenter.usersList.value[indexPath.row]
        cell.configureWithUser(user: user)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        profilePresenter.profileClicked(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

// MARK: ProfileViewDelegate
extension ProfileViewController: ProfileViewDelegate {
//    func showUsersData(_ data: [ProfileModel]) {
////        profileViewModel = data
////        DispatchQueue.main.async {
////            self.tableView.reloadData()
////        }
//    }

    func showProfileDetails() {
        let detailsVC = ProfileDetailsViewController()
        navigationController?.pushViewController(detailsVC, animated: true)
    }

    func showDownloadUsersDataError(withMessage: DisplayErrorModel) {
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

//MARK: Rx Setup
private extension ProfileViewController {
    func setupUsersObserver() {
        profilePresenter.usersList.asObservable().subscribe(onNext: {
            [unowned self] _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            }).disposed(by: disposeBag)
    }
    
    func setupCellConfiguration() {
      //1
      profilePresenter.usersList
        .bind(to: tableView
          .rx //2
          .items(cellIdentifier: ProfileCell.Identifier,
                 cellType: ProfileCell.self.self)) { //3
                  row, user, cell in
                  cell.configureWithUser(user: user) //4
        }
        .disposed(by: disposeBag) //5
    }
}
