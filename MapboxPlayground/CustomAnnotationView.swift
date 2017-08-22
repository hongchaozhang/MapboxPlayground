//
//  CustomImageAnnotationView.swift
//  MapboxPlayground
//
//  Created by Hongchao on 8/18/17.
//  Copyright © 2017 MicroStrategy. All rights reserved.
//

import Foundation
import UIKit
import Mapbox

class CustomImageAnnotationView: MGLAnnotationView {
    override init(annotation: MGLAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        let image = UIImage(named: "custom_annotation_view_icon.png")
        let imageView = UIImageView(image: image)
        self.bounds = imageView.bounds
        self.addSubview(imageView)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Animate the border width in/out, creating an iris effect.
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.duration = 0.1
        layer.opacity = selected ? 0.5: 1
        layer.add(animation, forKey: "opacity")
    }
}
