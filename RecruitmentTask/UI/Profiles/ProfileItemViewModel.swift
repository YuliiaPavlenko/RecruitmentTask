//
//  ProfileItemViewModel.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 05/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import Foundation

struct ProfileItemViewModel {
    var name: String?
    var email: String?
    var phone: String?
//    var image: String?

    init(name: String?, email: String?, phone: String?) {
        self.name = name
        self.email = email
        self.phone = phone
    }
}
