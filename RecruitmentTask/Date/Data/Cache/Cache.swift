//
//  Cache.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 05/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import Foundation

class Cache {
    static let shared = Cache()
    private var selectedUser: User?

    func setSelectedUser(_ user: User) {
        selectedUser = user
    }
    
    func getSelectedUser() -> User? {
        return selectedUser
    }
}
