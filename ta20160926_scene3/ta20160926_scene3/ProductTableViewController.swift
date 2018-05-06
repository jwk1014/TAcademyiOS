//
//  ProductTableViewController.swift
//  ta20160926_scene3
//
//  Created by 김정원 on 2016. 9. 26..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit

struct Product{
    var name : String
}

class ProductTableViewController: UITableViewController{
    
    var products = [
        Product(name: "ball"),
        Product(name: "car"),
        Product(name: "coffee")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("URL_CELL",forIndexPath: indexPath)
        cell.textLabel?.text = products[indexPath.row].name
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPathForCell(cell)!
        let selected = products[indexPath.row].name
        
        let controller = segue.destinationViewController as! FirstViewController
        controller.data = "https://en.wikipedia.org/wiki/\(selected)"
    }
    
}
