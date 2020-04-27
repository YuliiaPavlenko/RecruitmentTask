//
//  ProfilePresenter.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 02/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol ProfileViewDelegate: class {
    func showProfileDetails()
    func showDownloadUsersDataError(withMessage: DisplayErrorModel)
    func showProgress()
    func hideProgress()
}

class ProfilePresenter {
//    var usersList = [ProfileModel]()
    var usersList: BehaviorRelay<[ProfileModel]> = BehaviorRelay(value: [])

    var originalUsers = [User]()

    weak var viewDelegate: ProfileViewDelegate?

    func profileClicked(_ atIndex: Int) {
        Cache.shared.setSelectedUser(originalUsers[atIndex])
        Cache.shared.setUserImage(usersList.value[atIndex].image!)
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
                    let user = ProfileModel(name: user.name, email: user.email, phone: user.phone, image: self.getRandomImage())
                    let newUser = self.usersList.value + [user]
                    self.usersList.accept(newUser)
                    Cache.shared.setUserImage(self.getRandomImage())
                }
//                self.viewDelegate?.showUsersData(self.usersList.value)
            } else {
                if let error = error {
                    self.viewDelegate?.showDownloadUsersDataError(withMessage: DisplayError.usersList.displayMessage(rtError: error))
                }
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
