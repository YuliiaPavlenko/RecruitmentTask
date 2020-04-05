//
//  ProfileCell.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 02/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

    let userNameLabel = ProfileViewElements.createUserNameLabel()
    let userEmailLabel = ProfileViewElements.createUserDetailsLabel()
    let userPhoneLabel = ProfileViewElements.createUserDetailsLabel()
    let profileImage = ProfileViewElements.createProfileImage()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubviews()

        profileImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 12, paddingLeft: 26, paddingBottom: 12, paddingRight: 0, width: 40, height: 0, enableInsets: false)
        userNameLabel.anchor(top: topAnchor, left: profileImage.rightAnchor, bottom: nil, right: nil, paddingTop: 11, paddingLeft: 19, paddingBottom: 0, paddingRight: 10, width: 0, height: 19, enableInsets: false)

        let userDataStackView = ProfileViewElements.createHorizontalStackView(arrangedSubviews: [userEmailLabel, userPhoneLabel])
        addSubview(userDataStackView)
        userDataStackView.anchor(top: userNameLabel.bottomAnchor, left: profileImage.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 19, paddingBottom: 0, paddingRight: 10, width: 0, height: 0, enableInsets: false)

    }

    private func addSubviews() {
        addSubview(userNameLabel)
        addSubview(userEmailLabel)
        addSubview(userPhoneLabel)
        addSubview(profileImage)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
