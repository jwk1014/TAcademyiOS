//
//  ViewController.swift
//  ta20160927_sqlite
//
//  Created by 김정원 on 2016. 9. 27..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        openDB()
    }
    
    func openDB() {
        var db : COpaquePointer = nil
        let docPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        let filePath = "\(docPath)/todo.sqlite"
        
        // SQLite 클라이언트에서 열기 쉽도록
        print("docPath : \(docPath)")
        
        let retOpen = sqlite3_open(filePath, &db)
        assert(SQLITE_OK == retOpen, "데이터베이스 오픈 실패")
        
        let sql = "CREATE TABLE IF NOT EXISTS TODO ( TITLE text, DUEDATE date )"
        var error : UnsafeMutablePointer<Int8> = nil
        let ret = sqlite3_exec(db, sql, nil, nil, &error)
        
        assert(SQLITE_OK == ret, "테이블 생성 실패")
    }
    
}

