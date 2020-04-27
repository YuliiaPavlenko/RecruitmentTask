//
//  ProfileViewElements.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 05/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

class ProfileViewElements {

    static func createUserNameLabel() -> UILabel {
        let nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = Fonts.title
        nameLabel.textAlignment = .left
        return nameLabel
    }

    static func createUserDetailsLabel() -> UILabel {
        let emailLabel = UILabel()
        emailLabel.textColor = Colors.graySubtitle
        emailLabel.font = Fonts.subtitle
        emailLabel.textAlignment = .left
        emailLabel.numberOfLines = 0
        return emailLabel
    }

    static func createProfileImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }

    static func createHorizontalStackView(arrangedSubviews: [UILabel]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }
}
