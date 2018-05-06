//
//  ProductCell.swift
//  ta20160922_table2
//
//  Created by 김정원 on 2016. 9. 22..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit

struct Product{
    var code: String!
    var name : String!
    var content : String!
}

protocol ProductCellDelegate : class{
    func addCart(code : String)
}

class ProductCell: UITableViewCell {
    
    weak var delegate : ProductCellDelegate!

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productLabel1: UILabel!
    @IBOutlet weak var ProductLabel2: UILabel!
    @IBOutlet weak var productButton: UIButton!
    var productCode : String!

    @IBAction func eventProductButton(sender: AnyObject) {
        delegate.addCart(productCode)
    }
}
