//
//  MapboxRestrictMapPanningViewController.swift
//  MapboxPlayground
//
//  Created by Hongchao on 8/22/17.
//  Copyright © 2017 MicroStrategy. All rights reserved.
//

import Foundation
import Mapbox

class MapboxRestrictMapPanningViewController: MapboxBaseViewController {

    private var colorado: MGLCoordinateBounds!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Denver, Colorado
        let center = CLLocationCoordinate2D(latitude: 39.748947, longitude: -104.995882)

        // Starting point
        mapView.setCenter(center, zoomLevel: 10, direction: 0, animated: false)

        // Colorado’s bounds
        let ne = CLLocationCoordinate2D(latitude: 40.989329, longitude: -102.062592)
        let sw = CLLocationCoordinate2D(latitude: 36.986207, longitude: -109.049896)
        colorado = MGLCoordinateBounds(sw: sw, ne: ne)

    }

    // This example uses Colorado’s boundaries to restrict the camera movement.
    func mapView(_ mapView: MGLMapView, shouldChangeFrom oldCamera: MGLMapCamera, to newCamera: MGLMapCamera) -> Bool {

        // Get the current camera to restore it after.
        let currentCamera = mapView.camera

        // From the new camera obtain the center to test if it’s inside the boundaries.
        let newCameraCenter = newCamera.centerCoordinate

        // Set the map’s visible bounds to newCamera.
        mapView.camera = newCamera
        let newVisibleCoordinates = mapView.visibleCoordinateBounds

        // Revert the camera.
        mapView.camera = currentCamera

        // Test if the newCameraCenter and newVisibleCoordinates are inside self.colorado.
        let inside = MGLCoordinateInCoordinateBounds(newCameraCenter, self.colorado)
        let intersects = MGLCoordinateInCoordinateBounds(newVisibleCoordinates.ne, self.colorado) && MGLCoordinateInCoordinateBounds(newVisibleCoordinates.sw, self.colorado)

        return inside && intersects
    }
}
