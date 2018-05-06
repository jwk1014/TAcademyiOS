//
//  ViewController.swift
//  ta20160922_table2
//
//  Created by 김정원 on 2016. 9. 22..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ProductCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var data = [Product]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...30 {
            data.append(Product(code:"CODE"+String(i),name:"NAME"+String(i),content:"CONTENT"+String(i)))
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PRODUCT_CELL", forIndexPath: indexPath) as! ProductCell
        cell.productLabel1.text = data[indexPath.row].name
        cell.ProductLabel2.text = data[indexPath.row].content
        cell.productCode = data[indexPath.row].code
        cell.delegate = self;
        return cell
    }
    
    func addCart(code: String) {
        print(code)
    }

}

