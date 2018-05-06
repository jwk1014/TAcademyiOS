//
//  ViewController.swift
//  ta20190930_map
//
//  Created by 김정원 on 2016. 9. 30..
//  Copyright © 2016년 김정원. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = CLLocationCoordinate2DMake(37.55, 127.0)
        let span = MKCoordinateSpanMake(0.5, 0.5)
        let region = MKCoordinateRegionMake(center, span)
        mapView.setRegion(region, animated: true)
        
        let camera = mapView.camera
        camera.centerCoordinate = CLLocationCoordinate2DMake(35.16,129.16)
        camera.altitude = 1500
        camera.pitch = 45.0
        mapView.setCamera(camera, animated: true)
    }


}

