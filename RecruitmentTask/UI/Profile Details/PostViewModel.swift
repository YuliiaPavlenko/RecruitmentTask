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

    init(postTitle: String?, postBody: String?) {
        self.postTitle = postTitle
        self.postBody = postBody
    }
}
