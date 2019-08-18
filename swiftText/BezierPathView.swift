//
//  BezierPathView.swift
//  swiftText
//
//  Created by jingjun on 2019/4/24.
//  Copyright © 2019 景军. All rights reserved.
//

import UIKit

class BezierPathView: UIView {

    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let line : UIBezierPath = UIBezierPath()
        line.lineWidth = 20
        line.lineCapStyle = .round
        line.lineJoinStyle = .round
        let PNGreen = UIColor.white
        PNGreen.set()
        line.move(to: CGPoint(x: 100, y: 100))
        line.addLine(to: CGPoint(x: 200, y: 200))
        line.addLine(to: CGPoint(x: 230, y: 100))
        line.close()
//        let color1 = UIColor(red: 255.0 / 255.0, green: 127.0 / 255.0, blue: 79.0 / 255.0, alpha: 1.0)
//        let color2 = UIColor(red: 77.0 / 255.0, green: 186.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0)
//
//        color1.setStroke()
//        color2.setFill()
//        line.fill() // 填充
        line.stroke() // 连线
    }

}
