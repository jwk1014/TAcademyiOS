//
//  ViewController.swift
//  ta20160927_realm
//
//  Created by 김정원 on 2016. 9. 27..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit
import RealmSwift

class Todo : Object {
    dynamic var title = ""
    dynamic var dueDate : NSDate?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addTodo("제목", dueDate: NSDate())
        print(NSHomeDirectory())
    }

    func addTodo(title : String, dueDate : NSDate){
        let todo = Todo()
        todo.title = title
        todo.dueDate = dueDate
        
        do{
            let realm = try Realm()
            try realm.write {
                realm.add(todo)
            }
        }catch let error{
            print(error)
        }
    }

}

