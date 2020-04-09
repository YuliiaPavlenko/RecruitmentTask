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
        setupCellConfiguration()
        setupCellTapHandling()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        configureConstraintsForTableView()

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
                 cellType: ProfileCell.self)) { //3
                  row, user, cell in
                  cell.configureWithUser(user: user) //4
        }
        .disposed(by: disposeBag) //5
    }
    
    func setupCellTapHandling() {
      tableView
        .rx
        .modelSelected(ProfileModel.self)
        .subscribe(onNext: { [unowned self] user in
          if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
            self.profilePresenter.profileClicked(selectedRowIndexPath.row)
            self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
          }
        })
        .disposed(by: disposeBag)
    }
    
}
