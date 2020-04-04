//
//  ActivityCell.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 04/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {
    
    public let postTitle = CustomLabel.createTitleLabel()
    public let postBody = CustomLabel.createPostLabel()
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "applover.png")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(postTitle)
        addSubview(postBody)
        addSubview(profileImage)
        
        let activityStackView = CustomStackView.createVerticalStackView(arrangedSubviews: [postTitle, postBody])
        addSubview(activityStackView)
        
        profileImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 16, paddingLeft: 26, paddingBottom: 12, paddingRight: 0, width: 40, height: 0, enableInsets: false)
        activityStackView.anchor(top: topAnchor, left: profileImage.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 12, paddingBottom: 0, paddingRight: 22, width: 0, height: 62, enableInsets: false)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
