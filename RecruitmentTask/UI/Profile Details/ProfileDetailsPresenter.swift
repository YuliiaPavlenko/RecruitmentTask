//
//  ProfileDetailsPresenter.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 05/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

protocol ProfileDetailsViewDelegate: class {
    func showProfileDetails(_ data: ProfileDetailsModel)
    func showProfileDetailsError()
    func showPosts(_ data: [PostModel])
    func showDownloadPostsDataError(withMessage: DisplayErrorModel)
    func showProgress()
    func hideProgress()
}

class ProfileDetailsPresenter {
    var profileDetails = [ProfileDetailsModel]()
    var postsList = [PostModel]()
    weak var viewDelegate: ProfileDetailsViewDelegate?

    func viewIsPrepared() {
        let selectedUser = Cache.shared.getSelectedUser()
        let userImage = Cache.shared.getUserImage()

        if let user = selectedUser {
            let profileData = ProfileDetailsModel(name: user.name, email: user.email, phone: user.phone, image: userImage, address: prepareAdrressToDisplay(user.address), company: prepareCompanyAddressToDisplay(user.company), site: user.website)
            viewDelegate?.showProfileDetails(profileData)
            
            viewDelegate?.showProgress()
            NetworkManager.shared.getPostsForUser(userId: user.id) { [weak self] (posts, error) in
                guard let self = self else { return }
                self.viewDelegate?.hideProgress()

                if let posts = posts {

                    for post in posts {
                        let post = PostModel(postTitle: post.title, postBody: post.body, postImage: self.getRandomImage())
                        self.postsList.append(post)
                    }
                    self.viewDelegate?.showPosts(self.postsList)
                } else {
                    if let error = error {
                        self.viewDelegate?.showDownloadPostsDataError(withMessage: DisplayError.posts.displayMessage(rtError: error))
                    }
                }
            }

        } else {
            viewDelegate?.showProfileDetailsError()
        }
    }

    private func prepareAdrressToDisplay(_ address: Address) -> String {
        return "\(address.street), \(address.zipcode) \(address.city)"
    }

    private func prepareCompanyAddressToDisplay(_ company: Company) -> String {
        return "\(company.name), \(company.catchPhrase), \(company.bs)"
    }
    
    private func getRandomImage() -> String {
        let hardcodedImages = ["postImage.png", "postImage-1.png", "postImage-2.png"]
        let imageIndex = Int(arc4random_uniform(UInt32(hardcodedImages.count)))
        let selectedImage = hardcodedImages[imageIndex]
        return selectedImage
    }
}
