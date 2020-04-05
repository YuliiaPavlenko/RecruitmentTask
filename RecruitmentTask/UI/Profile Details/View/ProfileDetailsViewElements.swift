//
//  ProfileDetailsViewElements.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 04/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

class ProfileDetailsViewElements {
    
    static func createProfileImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = Colors.separatorColor
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }

    static func createEditView() -> RoundedView {
        let view = RoundedView()
        view.backgroundColor = Colors.green
        view.contentMode = .scaleAspectFill
        return view
    }

    static func createEditImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pencil.png")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    static func createPostImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true
        return imageView
    }

    static func createTitleLabel() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = Fonts.subtitleBold
        titleLabel.textAlignment = .left
        return titleLabel
    }

    static func createAddressLabel() -> UILabel {
        let addressLabel = UILabel()
        addressLabel.textColor = Colors.bodyText
        addressLabel.font = Fonts.bodyRegular
        addressLabel.textAlignment = .left
        addressLabel.numberOfLines = 0
        return addressLabel
    }

    static func createPostLabel() -> UILabel {
        let postLabel = UILabel()
        postLabel.textColor = Colors.bodyText
        postLabel.font = Fonts.subtitle
        postLabel.textAlignment = .left
        postLabel.numberOfLines = 0
        return postLabel
    }

    static func createProfileNameLabel() -> UILabel {
        let postLabel = UILabel()
        postLabel.textColor = .white
        postLabel.font = Fonts.bigTitleBold
        postLabel.textAlignment = .left
        postLabel.numberOfLines = 0
        return postLabel
    }

    static func createProfileDetailsLabel() -> UILabel {
        let postLabel = UILabel()
        postLabel.textColor = .white
        postLabel.font = Fonts.subtitleBold
        postLabel.textAlignment = .left
        postLabel.numberOfLines = 0
        return postLabel
    }
    
    static func createVerticalStackView(arrangedSubviews: [UILabel]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 7
        return stackView
    }
}
