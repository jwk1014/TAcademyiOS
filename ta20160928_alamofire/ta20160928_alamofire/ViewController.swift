//
//  ViewController.swift
//  ta20160928_alamofire
//
//  Created by 김정원 on 2016. 9. 28..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "https://httpbin.org/image/png")!
        imageView.af_setImageWithURL(url)
    }


}

