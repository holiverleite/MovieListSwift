//
//  CALayerExtension.swift
//  MoviesSwift
//
//  Created by Haroldo Leite on 06/06/19.
//  Copyright © 2019 holiverleite. All rights reserved.
//

import UIKit

extension CALayer {
    
    static func setDropShadow(layer : CALayer, radius : CGFloat, opacity : Float) {
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = radius
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = opacity
    }
    
    static func removeDropShadow(layer: CALayer){
        CALayer.setDropShadow(layer: layer, radius: 0, opacity: 0)
    }
    
}
