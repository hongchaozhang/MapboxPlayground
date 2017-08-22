//
//  MapboxCameraAnimationViewController.swift
//  MapboxPlayground
//
//  Created by Hongchao on 8/22/17.
//  Copyright © 2017 MicroStrategy. All rights reserved.
//

import Foundation
import Mapbox

class MapboxCameraAnimationViewController: MapboxBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.styleURL = MGLStyle.outdoorsStyleURL();

        // Mauna Kea, Hawaii
        let center = CLLocationCoordinate2D(latitude: 19.820689, longitude: -155.468038)

        // Optionally set a starting point.
        mapView.setCenter(center, zoomLevel: 7, direction: 0, animated: false)
    }

    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
        // Wait for the map to load before initiating the first camera movement.

        // Create a camera that rotates around the same center point, rotating 180°.
        // `fromDistance:` is meters above mean sea level that an eye would have to be in order to see what the map view is showing.
        let camera = MGLMapCamera(lookingAtCenter: mapView.centerCoordinate, fromDistance: 4500, pitch: 15, heading: 180)

        // Animate the camera movement over 5 seconds.
        mapView.setCamera(camera, withDuration: 5, animationTimingFunction: CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
    }
}
