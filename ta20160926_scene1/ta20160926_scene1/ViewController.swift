//
//  ViewController.swift
//  ta20160926_scene1
//
//  Created by 김정원 on 2016. 9. 26..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func eventButton(sender: AnyObject) {
        changeScene()
    }
    func changeScene(){
        let window1 = self.view.window
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let window2 = appDelegate.window
        
        let storyboard1 = UIStoryboard(name:"Main",bundle: nil)
        let storyboard2 = self.storyboard
        
        let sceneB = SceneBViewController()
        let sceneB2 = storyboard2?.instantiateViewControllerWithIdentifier("SCENE_B")
        window2?.rootViewController = sceneB2;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

