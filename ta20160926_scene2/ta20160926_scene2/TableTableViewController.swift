//
//  TableTableViewController.swift
//  ta20160926_scene2
//
//  Created by 김정원 on 2016. 9. 26..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController{
    
    var urls = [
        "www.naver.com",
        "www.daum.net",
        "www.google.co.kr"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urls.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("URL_CELL",forIndexPath: indexPath)
        cell.textLabel?.text = urls[indexPath.row]
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPathForCell(cell)!
        let selected = urls[indexPath.row]
        
        let controller = segue.destinationViewController as! ViewController
        controller.data = "https://\(selected)"
    }

}
