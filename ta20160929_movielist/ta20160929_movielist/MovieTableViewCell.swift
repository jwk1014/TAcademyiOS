//
//  MovieTableViewCell.swift
//  ta20160929_movielist
//
//  Created by 김정원 on 2016. 9. 29..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit

struct MovieSimple{
    var id : Int!
    var title : String!
}

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
