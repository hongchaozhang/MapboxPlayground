//
//  MapboxPointConversionViewController.swift
//  MapboxPlayground
//
//  Created by Hongchao on 8/22/17.
//  Copyright © 2017 MicroStrategy. All rights reserved.
//

import Foundation
import Mapbox

class MapboxPointConversionViewController: MapboxBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add a single tap gesture recognizer. This gesture requires the built-in MGLMapView tap gestures (such as those for zoom and annotation selection) to fail.
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap(tap:)))
        for recognizer in mapView.gestureRecognizers! where recognizer is UITapGestureRecognizer {
            singleTap.require(toFail: recognizer)
        }
        mapView.addGestureRecognizer(singleTap)

        // Convert `mapView.centerCoordinate` (CLLocationCoordinate2D)
        // to screen location (CGPoint).
        let centerScreenPoint: CGPoint = mapView.convert(mapView.centerCoordinate, toPointTo: mapView)
        print("Screen center: \(centerScreenPoint) = \(mapView.center)")
    }

    func handleSingleTap(tap: UITapGestureRecognizer) {
        // Convert tap location (CGPoint)
        // to geographic coordinate (CLLocationCoordinate2D).
        let tapCoordinate: CLLocationCoordinate2D = mapView.convert(tap.location(in: mapView), toCoordinateFrom: mapView)
        print("You tapped at: \(tapCoordinate.latitude), \(tapCoordinate.longitude)")

        // Create an array of coordinates for our polyline, starting at the center of the map and ending at the tap coordinate.
        var coordinates: [CLLocationCoordinate2D] = [mapView.centerCoordinate, tapCoordinate]

        // Remove any existing polyline(s) from the map.
        if mapView.annotations?.count != nil, let existingAnnotations = mapView.annotations {
            mapView.removeAnnotations(existingAnnotations)
        }

        // Add a polyline with the new coordinates.
        let polyline = MGLPolyline(coordinates: &coordinates, count: UInt(coordinates.count))
        mapView.addAnnotation(polyline)
    }
}
