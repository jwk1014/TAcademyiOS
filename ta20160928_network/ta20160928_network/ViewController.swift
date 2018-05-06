//
//  ViewController.swift
//  ta20160928_network
//
//  Created by 김정원 on 2016. 9. 28..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://www.ibiblio.org/wm/paint/auth/munch/munch.scream.jpg")!
        let data = NSData(contentsOfURL: url)!
        let image = UIImage(data: data)
        imageView.image = image
    }


}

