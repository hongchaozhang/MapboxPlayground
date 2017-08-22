//
//  MapboxDataDrivenCirclesViewController.swift
//  MapboxPlayground
//
//  Created by Hongchao on 8/21/17.
//  Copyright © 2017 MicroStrategy. All rights reserved.
//

import Foundation
import UIKit
import Mapbox

class MapboxDataDrivenCirclesViewController: MapboxBaseViewController {

    fileprivate func addCustomSourceLayer(to style: MGLStyle) {
        // "mapbox://examples.2uf7qges" is a map ID referencing a tileset. For more
        // more information, see mapbox.com/help/define-map-id/
        let source = MGLVectorSource(identifier: "trees", configurationURL: URL(string: "mapbox://zhanghongchao.2sn0jiud")!)

        style.addSource(source)

        let layer = MGLCircleStyleLayer(identifier: "tree-style", source: source)

        // The source name from the source's TileJSON metadata: mapbox.com/api-documentation/#retrieve-tilejson-metadata
        layer.sourceLayerIdentifier = "trees-7lkucu"

        // Stops based on age of tree in years.
        let stops = [
            0: MGLStyleValue(rawValue: UIColor(red:1.00, green:0.72, blue:0.85, alpha:1.0)),
            2: MGLStyleValue(rawValue: UIColor(red:0.69, green:0.48, blue:0.73, alpha:1.0)),
            4: MGLStyleValue(rawValue: UIColor(red:0.61, green:0.31, blue:0.47, alpha:1.0)),
            7: MGLStyleValue(rawValue: UIColor(red:0.43, green:0.20, blue:0.38, alpha:1.0)),
            16: MGLStyleValue(rawValue: UIColor(red:0.33, green:0.17, blue:0.25, alpha:1.0))
        ]

        // Style the circle layer color based on the above categorical stops
        layer.circleColor = MGLStyleValue<UIColor>(interpolationMode: .interval,
                                                   sourceStops: stops,
                                                   attributeName: "AGE",
                                                   options: nil)

        layer.circleRadius = MGLStyleValue(rawValue: 3)

        style.addLayer(layer)

        // Set the map’s center coordinate and zoom level.
        mapView.setCenter(CLLocationCoordinate2D(latitude: 38.897, longitude: -77.039), zoomLevel: 10.5, animated: false)
    }

    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        addCustomSourceLayer(to: style)
    }
}


