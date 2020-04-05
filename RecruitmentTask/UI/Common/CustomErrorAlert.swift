//
//  CustomErrorAlert.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 05/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

class CustomErrorAlert {

    static func setUpErrorAlert(_ withMessage: String?) -> UIAlertController {
        let message = "Error getting data from API." + " \(String(describing: withMessage!))"
        let alert = UIAlertController.errorAlert(withMessage: message)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_: UIAlertAction!) in
        }))
        return alert
    }
}
