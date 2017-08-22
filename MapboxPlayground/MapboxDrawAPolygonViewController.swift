//
//  MapboxDrawAPolygonViewController.swift
//  MapboxPlayground
//
//  Created by Hongchao on 8/22/17.
//  Copyright © 2017 MicroStrategy. All rights reserved.
//

import Foundation
import Mapbox

class MapboxDrawAPolygonViewController: MapboxBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.setCenter(CLLocationCoordinate2D(latitude: 45.520486, longitude: -122.673541), zoomLevel: 11, animated: false)
    }

    override func viewDidAppear(_ animated: Bool) {
        // Draw the polygon after the map has initialized
        drawShape()
    }

    func drawShape() {
        // Create a coordinates array to hold all of the coordinates for our shape.
        var coordinates = [
            CLLocationCoordinate2D(latitude: 45.522585, longitude: -122.685699),
            CLLocationCoordinate2D(latitude: 45.534611, longitude: -122.708873),
            CLLocationCoordinate2D(latitude: 45.530883, longitude: -122.678833),
            CLLocationCoordinate2D(latitude: 45.547115, longitude: -122.667503),
            CLLocationCoordinate2D(latitude: 45.530643, longitude: -122.660121),
            CLLocationCoordinate2D(latitude: 45.533529, longitude: -122.636260),
            CLLocationCoordinate2D(latitude: 45.521743, longitude: -122.659091),
            CLLocationCoordinate2D(latitude: 45.510677, longitude: -122.648792),
            CLLocationCoordinate2D(latitude: 45.515008, longitude: -122.664070),
            CLLocationCoordinate2D(latitude: 45.502496, longitude: -122.669048),
            CLLocationCoordinate2D(latitude: 45.515369, longitude: -122.678489),
            CLLocationCoordinate2D(latitude: 45.506346, longitude: -122.702007),
            CLLocationCoordinate2D(latitude: 45.522585, longitude: -122.685699)
        ]

        let shape = MGLPolygon(coordinates: &coordinates, count: UInt(coordinates.count))

        mapView.addAnnotation(shape)
    }

    func mapView(_ mapView: MGLMapView, alphaForShapeAnnotation annotation: MGLShape) -> CGFloat {
        return 0.5
    }
    func mapView(_ mapView: MGLMapView, strokeColorForShapeAnnotation annotation: MGLShape) -> UIColor {
        return .white
    }

    func mapView(_ mapView: MGLMapView, fillColorForPolygonAnnotation annotation: MGLPolygon) -> UIColor {
        return UIColor(red: 59/255, green: 178/255, blue: 208/255, alpha: 1)
    }
    
}
