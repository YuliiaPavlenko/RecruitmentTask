//
//  ProfileItemViewModel.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 05/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

struct ProfileModel {
    var name: String?
    var email: String?
    var phone: String?
    var image: String?

    init(name: String?, email: String?, phone: String?, image: String?) {
        self.name = name
        self.email = email
        self.phone = phone
        self.image = image
    }
}
