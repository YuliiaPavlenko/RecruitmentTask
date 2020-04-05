//
//  PostViewModel.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 05/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

struct PostViewModel {
    var postTitle: String?
    var postBody: String?
    var postImage: String

    init(postTitle: String?, postBody: String?, postImage: String) {
        self.postTitle = postTitle
        self.postBody = postBody
        self.postImage = postImage
    }
}
