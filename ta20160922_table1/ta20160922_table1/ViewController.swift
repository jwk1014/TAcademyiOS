//
//  ViewController.swift
//  ta20160922_table1
//
//  Created by 김정원 on 2016. 9. 22..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var data : [String] = [String]()
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var moveButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var moving = false;
    
    @IBAction func eventAddButton(sender: UIButton) {
        let alert = UIAlertController(title: "데이터 값", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler({
            (textField : UITextField) -> Void in
            
        })
        let cancelAction = UIAlertAction(title: "취소", style: .Destructive, handler: {
            (action) -> Void in
            
        })
        let okAction = UIAlertAction(title: "확인", style: .Destructive, handler: {
            (action) -> Void in
            self.data.append(alert.textFields![0].text!)
            self.tableView.reloadData()
        })
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        presentViewController(alert, animated: true, completion: {()->() in})
    }
    func funcActionbutton(name: String, targetBtn: UIButton, oneBtn: UIButton, twoBtn: UIButton){
        let b = tableView.editing;
        if b {
            targetBtn.setTitle(name+"하기", forState: .Normal)
        }else{
            targetBtn.setTitle(name+"완료", forState: .Normal)
        }
        tableView.setEditing(!b, animated: true)
        oneBtn.enabled = b;
        twoBtn.enabled = b;
    }
    @IBAction func eventRemoveButton(sender: UIButton) {
        funcActionbutton("삭제", targetBtn: removeButton, oneBtn: addButton, twoBtn: moveButton)
    }
    @IBAction func eventMoveButton(sender: UIButton) {
        moving = !tableView.editing;
        funcActionbutton("이동", targetBtn: moveButton, oneBtn: addButton, twoBtn: removeButton)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...30{
            data.append("DATA "+String(i))
        }
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CELL_ID")
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL_ID", forIndexPath: indexPath)
        cell.textLabel!.text = data[indexPath.row]
        return cell
        /*
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL_ID")
        if nil == cell {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "CELL_ID");
            add_count += 1;
            print("add \(add_count)")
        }else{
            print("reuse")
        }
        //cell.imageView =
        cell!.textLabel!.text = "Cell \(indexPath.section) \(indexPath.row)"
        return cell!*/
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(data[indexPath.row]);
        let alert = UIAlertController(title: "데이터 값", message: data[indexPath.row]+"을 클릭하셨습니다.", preferredStyle: .Alert)
        presentViewController(alert, animated: true, completion: {()->() in
            DispatchUtils.delay(0.5, closure: { () -> () in alert.dismissViewControllerAnimated(true, completion: nil) } )
        } )
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "삭제"
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            data.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if !moving {
            return UITableViewCellEditingStyle.Delete;
        } else {
            return UITableViewCellEditingStyle.None;
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return moving;
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let tmp = data.removeAtIndex(sourceIndexPath.row)
        data.insert(tmp, atIndex: destinationIndexPath.row)
    }
    
    struct DispatchUtils {
        static func delay(delay:Double, closure:()->()) {
            dispatch_after(
                dispatch_time(
                    DISPATCH_TIME_NOW,
                    Int64(delay * Double(NSEC_PER_SEC))
                ),
                dispatch_get_main_queue(), closure)
        }
    }

}

