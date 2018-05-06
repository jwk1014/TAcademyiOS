//
//  ViewController.swift
//  ta20160929_imagepicker
//
//  Created by 김정원 on 2016. 9. 29..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imagePicker = UIImagePickerController()
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func eventButton(sender: AnyObject) {
        switch PHPhotoLibrary.authorizationStatus() {
        case .Authorized:
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(imagePicker, animated: true, completion: nil)
        case .Denied:
            print("Denied")
        case .NotDetermined:
            print("NotDetermined")
        case .Restricted:
            print("Restricted")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

}

