//
//  ProfilePresenter.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 02/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

protocol ProfileViewDelegate: class {
    func showProfileDetails()
    func showUsersData(_ data: [ProfileItemViewModel])
    func showDownloadUsersDataError(withMessage: String?)

}

class ProfilePresenter {
    var usersList = [ProfileItemViewModel]()
    
    weak var viewDelegate: ProfileViewDelegate?

    func profileClicked() {
        viewDelegate?.showProfileDetails()
    }
    
    func getUsers() {
        NetworkManager.shared.getUsers() { [weak self] (users, error) in
            guard let self = self else { return }
//            self.viewDelegate?.hideProgress()

            if let users = users {
                for user in users {
                    let user = ProfileItemViewModel(name: user.name, email: user.email, phone: user.phone)
                    self.usersList.append(user)
                }
                self.viewDelegate?.showUsersData(self.usersList)
            } else {
                self.viewDelegate?.showDownloadUsersDataError(withMessage: error?.debugDescription)
            }
        }
    }
}
