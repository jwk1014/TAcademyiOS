//
//  Todo+CoreDataProperties.swift
//  ta20160927_coredata
//
//  Created by 김정원 on 2016. 9. 27..
//  Copyright © 2016년 김정원. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Todo {

    @NSManaged var title: String?
    @NSManaged var dueDate: NSDate?

}
