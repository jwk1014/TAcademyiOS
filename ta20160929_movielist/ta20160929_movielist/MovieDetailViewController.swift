//
//  MovieDetailViewController.swift
//  ta20160929_movielist
//
//  Created by 김정원 on 2016. 9. 29..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit
import Alamofire

class MovieDetailViewController: UIViewController {
    
    var id : Int!

    @IBOutlet weak var naviItem: UINavigationItem!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request(.GET, "http://localhost:3000/movies/\(id)", parameters: ["foo": "bar"])
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    self.naviItem.title = ((JSON as! NSDictionary)["title"] as! String?)
                    self.idLabel.text = "ID : \(self.id)"
                    self.directorLabel.text = "Director : "+((JSON as! NSDictionary)["director"] as! String)
                    self.yearLabel.text = "Year : "+String((JSON as! NSDictionary)["year"] as! Int)
                    self.synopsisLabel.text = ((JSON as! NSDictionary)["synopsis"] as! String)
                }
        }
    }
}
