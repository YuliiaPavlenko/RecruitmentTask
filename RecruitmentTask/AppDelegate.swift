//
//  AppDelegate.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 02/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let rootViewController = StartVC(nibName: nil, bundle: nil)
        let navigationController = UINavigationController(rootViewController: rootViewController)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}
