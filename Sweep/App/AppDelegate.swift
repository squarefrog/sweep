//
//  AppDelegate.swift
//  Sweep
//
//  Created by Paul Williamson on 03/03/2019.
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()

        return true
    }

}
