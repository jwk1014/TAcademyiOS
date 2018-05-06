//
//  ViewController.swift
//  ta20160927_coredata
//
//  Created by 김정원 on 2016. 9. 27..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSHomeDirectory())
        //addTodo("제목", dueDate: NSDate())
        resolveAll()
    }
    
    func resolveAll(){
        let request = NSFetchRequest(entityName: "Todo")
        
        let date = NSDate(timeIntervalSinceNow: -600);
        let predicte = NSPredicate(format: "dueDate <= %@", date);
        request.predicate = predicte
        
        let appDelegete = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegete.managedObjectContext
        let todos = try? context.executeFetchRequest(request) as! [Todo]
        for todo in todos! {
            print(String(todo.title),String(todo.dueDate),"\n")
        }
    }
    
    func addTodo(title:String,dueDate:NSDate){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let todo = NSEntityDescription.insertNewObjectForEntityForName("Todo",inManagedObjectContext:context) as! Todo
        
        todo.title = title
        todo.dueDate = dueDate
        do{
            try context.save()
            print("succ")
        }catch{
            print("Error")
        }
    }


}

