//
//  Router.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 04/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import Foundation

class Router {
    static let posts = Config.baseURL + "/posts"
    static let users = Config.baseURL + "/users"

    static func postsForUser(_ id: Int) -> String {
        return posts + "?userId=\(id)"
    }
}
