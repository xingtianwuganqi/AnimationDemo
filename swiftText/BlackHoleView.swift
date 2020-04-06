//
//  BlackHoleView.swift
//  swiftText
//
//  Created by jingjun on 2019/4/3.
//  Copyright © 2019 景军. All rights reserved.
//

import UIKit

class BlackHoleView: UIView {

    var blackHoleRadius: Float = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func blackHoleIncrease(_ radius: Float) {
        blackHoleRadius = radius
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.addArc(center: CGPoint(x: self.center.x, y: self.center.y),
                    radius: CGFloat(blackHoleRadius),
                    startAngle: 0,
                    endAngle: CGFloat(Double.pi * 2),
                    clockwise: false) // true 顺时针，false 逆时针
        
        ctx?.fillPath() // 填充
    }
}
