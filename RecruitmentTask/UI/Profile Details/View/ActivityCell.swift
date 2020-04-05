//
//  ActivityCell.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 04/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {

    let postTitle = ProfileDetailsViewElements.createTitleLabel()
    let postBody = ProfileDetailsViewElements.createPostLabel()
    let profileImage = ProfileDetailsViewElements.createPostImage()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(postTitle)
        addSubview(postBody)
        addSubview(profileImage)

        let activityStackView = ProfileDetailsViewElements.createVerticalStackView(arrangedSubviews: [postTitle, postBody])
        addSubview(activityStackView)

        profileImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 16, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 81, height: 74, enableInsets: false)
        activityStackView.anchor(top: topAnchor, left: profileImage.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 12, paddingBottom: 0, paddingRight: 22, width: 0, height: 62, enableInsets: false)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
