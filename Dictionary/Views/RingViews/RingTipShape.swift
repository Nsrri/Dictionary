//
//  RingTipShape.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 15.01.23.
//

import Foundation
import SwiftUI



struct RingTipShape: Shape {
    
    var currentPercentage: Double
    var thickness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        let angle = CGFloat((360 * currentPercentage) * .pi / 180)
        let controlRadius: CGFloat = rect.width / 2 - thickness
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let x = center.x + controlRadius * cos(angle)
        let y = center.y + controlRadius * sin(angle)
        let pointCenter = CGPoint(x: x , y: y)
        
        path.addEllipse(in:
                            CGRect(x: pointCenter.x - thickness / 2, y: pointCenter.y - thickness / 2, width: thickness, height: thickness)
        
        )
        return path
    }
    var animatableData: Double {
        get{return currentPercentage}
        set{currentPercentage = newValue}
    }
}
