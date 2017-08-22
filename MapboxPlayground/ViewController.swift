//
//  ViewController.swift
//  MapboxPlayground
//
//  Created by Hongchao on 8/18/17.
//  Copyright © 2017 MicroStrategy. All rights reserved.
//

import UIKit
import Mapbox

class ViewController: UIViewController {

    var tableView: UITableView!
    let cellTextArray = ["Add custom image annotation view",
                         "Add custom circle annotation view",
                         "Data-driven circles",
                         "Dynamically style interactive points",
                         "Dynamically style a line",
                         "Dynamically style circles",
                         "Add a shape collection feature",
                         "Cluster point data",
                         "Add multiple annotations",
                         "Annotation models",
                         "Custom marker image",
                         "Draw a polygon",
                         "Draw a GeoJSON line",
                         "Add fill extrusions",
                         "Change light for fill extrusions",
                         "Add and toggle a layer",
                         "Draggable annotation view",
                         "Restric map panning to an area",
                         "Select a feature within a layer",
                         "Animate a line",
                         "Camera Animation",
                         "Callout delegagte usage",
                         "Custom callout view",
                         "Point conversion"]
    let viewControllersArray: [UIViewController] = [MapboxCustomImageAnnotationViewViewController(),
                                                    MapboxAddCustomCircleAnnotationViewViewController(),
                                                    MapboxDataDrivenCirclesViewController(),
                                                    MapboxDynamicallyStyleInteractivePointsViewController(),
                                                    MapboxDynamicallyStyleALineViewController(),
                                                    MapboxDynamicallyStyleCirclesViewController(),
                                                    MapboxAddAShapeCollectionFeatureViewController(),
                                                    MapboxClusterPointDataViewController(),
                                                    MapboxAddMultipleAnnotationsViewController(),
                                                    MapboxAnnotationModelsViewController(),
                                                    MapboxCustomMarkerImageViewController(),
                                                    MapboxDrawAPolygonViewController(),
                                                    MapboxDrawAGeoJSONLineViewController(),
                                                    MapboxAddFillExtrusionsViewController(),
                                                    MapboxChangeLightForFillExtrusionsViewController(),
                                                    MapboxToggleALayerViewController(),
                                                    MapboxDraggableAnnotationViewViewController(),
                                                    MapboxRestrictMapPanningViewController(),
                                                    MapboxSelectAFeatureWithinALayerViewController(),
                                                    MapboxAnimateALineViewController(),
                                                    MapboxCameraAnimationViewController(),
                                                    MapboxCalloutDelegateUsageViewController(),
                                                    MapboxCustomCalloutViewViewController(),
                                                    MapboxPointConversionViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView = UITableView(frame: view.bounds)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTextArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = cellTextArray[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let targetViewController = viewControllersArray[indexPath.row]
        self.navigationController?.pushViewController(targetViewController, animated: true)
        targetViewController.title = cellTextArray[indexPath.row]
    }
}

