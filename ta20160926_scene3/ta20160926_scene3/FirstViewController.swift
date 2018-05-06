//
//  FirstViewController.swift
//  ta20160926_scene3
//
//  Created by 김정원 on 2016. 9. 26..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var data : String!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewWillAppear(animated: Bool) {
        if let url = NSURL(string: data) {
            let request = NSURLRequest(URL: url)
            webView.loadRequest(request)
        }
    }

}

