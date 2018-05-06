//
//  ViewController.swift
//  ta20160929_movielist
//
//  Created by 김정원 on 2016. 9. 29..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var datas = [MovieSimple]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "http://localhost:3000/movies", parameters: ["foo": "bar"])
            .responseJSON { response in
                //print(response.request)  // original URL request
                //print(response.response) // URL response
                //print(response.data)     // server data
                //print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    //print("JSON: \((JSON as! NSDictionary)["data"]?[0]?["id"])")
                    for i in 0..<(JSON["count"] as! Int){
                        self.datas.append(MovieSimple(id: (JSON as! NSDictionary)["data"]?[i]?["id"] as! Int, title: (JSON as! NSDictionary)["data"]?[i]?["title"] as! String ))
                    }
                    self.tableView.reloadData()
                }
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MOVIE_CELL", forIndexPath: indexPath) as! MovieTableViewCell
        cell.label.text = "[" + String(datas[indexPath.row].id) + "]   " + datas[indexPath.row].title
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let cell = sender as! UITableViewCell
        
        let indexPath = tableView.indexPathForCell(cell)!
        let selected  = datas[indexPath.row]
        
        print("사용자가 선택한 데이터 : \(selected)")
        
        let detailVC = segue.destinationViewController as! MovieDetailViewController
        detailVC.id = selected.id

    }

}

