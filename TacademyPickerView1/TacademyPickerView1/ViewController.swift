//
//  ViewController.swift
//  TacademyPickerView1
//
//  Created by 김정원 on 2016. 9. 21..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    var data : [UIImage] = [UIImage]();

    override func viewDidLoad() {
        super.viewDidLoad()
        data = [
            UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("img0", ofType: "png")!)!,
            UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("img1", ofType: "png")!)!,
            UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("img2", ofType: "png")!)!,
            UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("img3", ofType: "png")!)!,
            UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("img4", ofType: "png")!)!,
            UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("img5", ofType: "png")!)!
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }

    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        return UIImageView(image:data[row])
    }

}

