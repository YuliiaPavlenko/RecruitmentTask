//
//  ProfileDetailsItemViewModel.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 05/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import Foundation

struct ProfileDetailsItemViewModel {
    var name: String?
    var email: String?
    var phone: String?
//    var image: String
    var address: String?
    var company: String?
    var website: String?
//    var activityTitle: String?
//    var activityBody: String?

//    init(name: String?, email: String?, phone: String?,
//         image: String, address: String?, company: String?,
//         site: String?, activityTitle: String?, activityBody: String?) {
//        self.name = name
//        self.email = email
//        self.phone = phone
//        self.image = image
//        self.address = address
//        self.company = company
//        self.site = site
//        self.activityTitle = activityTitle
//        self.activityBody = activityBody
//    }
    init(name: String?, email: String?, phone: String?,
         address: String?, company: String?, site: String?) {
        self.name = name
        self.email = email
        self.phone = phone
        self.address = address
        self.company = company
        self.website = site
    }
    
    init() {}
}
