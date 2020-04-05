//
//  UIAlertController+Utils.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 05/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

extension UIAlertController {

    static func errorAlert(withMessage message: String?) -> UIAlertController {
        let alert = UIAlertController(title: "error".capitalized, message: message, preferredStyle: .alert)
        return alert
    }
}
