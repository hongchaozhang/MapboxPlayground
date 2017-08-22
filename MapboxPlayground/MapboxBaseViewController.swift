//
//  MapboxBaseViewController.swift
//  MapboxPlayground
//
//  Created by Hongchao on 8/21/17.
//  Copyright © 2017 MicroStrategy. All rights reserved.
//

import Foundation
import UIKit
import Mapbox

class MapboxBaseViewController: UIViewController, MGLMapViewDelegate {
    var mapView: MGLMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView = MGLMapView(frame: view.bounds)
//        mapView.styleURL = MGLStyle.lightStyleURL()
//        mapView.tintColor = .darkGray
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapView)
        mapView.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
