//
//  AppDelegate.swift
//  ta20160926_scene1
//
//  Created by 김정원 on 2016. 9. 26..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        print("didFinishLaunchingWithOptions")
        return true
    }//1

    func applicationWillResignActive(application: UIApplication) {
        print("applicationWillResignActive")
    }//3

    func applicationDidEnterBackground(application: UIApplication) {
        print("applicationDidEnterBackground")
    }

    func applicationWillEnterForeground(application: UIApplication) {
        print("applicationWillEnterForeground")
    }

    func applicationDidBecomeActive(application: UIApplication) {
        print("applicationDidBecomeActive")
    }//2

    func applicationWillTerminate(application: UIApplication) {
        print("applicationWillTerminate")
    }


}

