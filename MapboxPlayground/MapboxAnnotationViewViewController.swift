//
//  MapboxCustomImageAnnotationViewViewController.swift
//  MapboxPlayground
//
//  Created by Hongchao on 8/21/17.
//  Copyright © 2017 MicroStrategy. All rights reserved.
//

import Foundation
import UIKit
import Mapbox

class MapboxCustomImageAnnotationViewViewController: MapboxBaseViewController {

    fileprivate func addCustomImageAnnotationView() {
        let point = MGLPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: 45.52258, longitude: -122.6732)
        point.title = "Voodoo Doughnut"
        point.subtitle = "22 SW 3rd Avenue Portland Oregon, U.S.A."

        mapView.addAnnotation(point)
        mapView.setCenter(point.coordinate, animated: false)
    }

    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        // Always try to show a callout when an annotation is tapped.
        return true
    }

    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        return CustomImageAnnotationView(annotation: annotation, reuseIdentifier: "custom_annotation_view")
    }

    // Wait until the style is loaded before modifying the map style.
    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        addCustomImageAnnotationView()
    }
}

