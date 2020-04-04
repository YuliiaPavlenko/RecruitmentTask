//
//  CustomLabel.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 04/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

class CustomLabel {
    
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
}
