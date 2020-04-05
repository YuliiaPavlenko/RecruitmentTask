//
//  Address.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 04/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import Foundation

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}
