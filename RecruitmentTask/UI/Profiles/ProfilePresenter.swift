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
    func showProgress()
    func hideProgress()
}

class ProfilePresenter {
    var usersList = [ProfileItemViewModel]()

    var originalUsers = [User]()

    weak var viewDelegate: ProfileViewDelegate?

    func profileClicked(_ atIndex: Int) {
        Cache.shared.setSelectedUser(originalUsers[atIndex])
        Cache.shared.setUserImage(usersList[atIndex].image!)
        viewDelegate?.showProfileDetails()
    }

    func viewIsPrepared() {
        viewDelegate?.showProgress()
        
        NetworkManager.shared.getUsers { [weak self] (users, error) in
            guard let self = self else { return }
            
            self.viewDelegate?.hideProgress()

            if let users = users {
                self.originalUsers = users

                for user in users {
                    let user = ProfileItemViewModel(name: user.name, email: user.email, phone: user.phone, image: self.getRandomImage())
                    self.usersList.append(user)
                    Cache.shared.setUserImage(self.getRandomImage())
                }
                
                self.viewDelegate?.showUsersData(self.usersList)
            } else {
                self.viewDelegate?.showDownloadUsersDataError(withMessage: error?.debugDescription)
            }
        }
    }

    private func getRandomImage() -> String {
        let hardcodedImages = ["Userpic.png", "Userpic-1.png", "Userpic-2.png"]
        let imageIndex = Int(arc4random_uniform(UInt32(hardcodedImages.count)))
        let selectedImage = hardcodedImages[imageIndex]
        return selectedImage
    }
}
