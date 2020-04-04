//
//  ProfileCell.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 02/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
     
    public let userNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = Fonts.title
        nameLabel.textAlignment = .left
        return nameLabel
    }()
    
    
    public let userEmailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.textColor = Colors.graySubtitle
        emailLabel.font = Fonts.subtitle
        emailLabel.textAlignment = .left
        emailLabel.numberOfLines = 0
        return emailLabel
    }()
    
    public let userPhoneLabel: UILabel = {
        let phoneLabel = UILabel()
        phoneLabel.textColor = Colors.graySubtitle
        phoneLabel.font = Fonts.subtitle
        phoneLabel.textAlignment = .left
        phoneLabel.numberOfLines = 0
        return phoneLabel
    }()
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "applover.png")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(userNameLabel)
        addSubview(userEmailLabel)
        addSubview(userPhoneLabel)
        addSubview(profileImage)
        
        profileImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 12, paddingLeft: 26, paddingBottom: 12, paddingRight: 0, width: 40, height: 0, enableInsets: false)
        userNameLabel.anchor(top: topAnchor, left: profileImage.rightAnchor, bottom: nil, right: nil, paddingTop: 11, paddingLeft: 19, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 19, enableInsets: false)
        
        let userDataStackView = CustomStackView.createHorizontalStackView(arrangedSubviews: [userEmailLabel, userPhoneLabel])
        addSubview(userDataStackView)
        userDataStackView.anchor(top: userNameLabel.bottomAnchor, left: profileImage.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 19, paddingBottom: 0, paddingRight: 10, width: 0, height: 0, enableInsets: false)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
