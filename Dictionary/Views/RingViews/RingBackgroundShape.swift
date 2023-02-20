//
//  RingBackgroundShape.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 15.01.23.
//

import Foundation
import SwiftUI

struct RingBackgroundShape: Shape {
    
    var thickness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.width / 2, y: rect.height / 2), radius: rect.width / 2 - thickness, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: false)
        
        return path
            .strokedPath(.init(lineWidth: thickness, lineCap: .round, lineJoin: .round))
    }
}
