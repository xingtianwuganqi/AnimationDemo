//
//  BarChartView.swift
//  swiftText
//
//  Created by jingjun on 2019/4/25.
//  Copyright © 2019 景军. All rights reserved.
//

import UIKit

class BarChartView: UIView {
    let PNGreen : UIColor = UIColor(red: 77.0 / 255.0, green: 186.0 / 255.0, blue: 122.0 / 255.00, alpha: 1.0)

    var chartLine : CAShapeLayer = CAShapeLayer()
    var pathAnimation = CABasicAnimation()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.clipsToBounds = true
        chartLine.lineCap = CAShapeLayerLineCap.square
        chartLine.lineJoin = CAShapeLayerLineJoin.round
        chartLine.fillColor = UIColor.gray.cgColor
        chartLine.lineWidth = 30.0
        chartLine.strokeEnd = 0.0 // 绘制结束的地方站总路径的百分比，为0时表示未进行绘制
        self.layer.addSublayer(chartLine)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawLineChart() {
        chartLine.strokeEnd = 1.0
        chartLine.add(pathAnimation, forKey: nil)
    }
    
    override func draw(_ rect: CGRect) {
        let line : UIBezierPath = UIBezierPath()
        line.lineWidth = 30.0
        line.lineCapStyle = .square
        line.lineJoinStyle = .round
        
        for i in 0...4 {
            let x: CGFloat = CGFloat(60 + 70 * i)
            let y: CGFloat = CGFloat(100 + 20 * i)
            line.move(to: CGPoint(x: x, y: 215))
            line.addLine(to: CGPoint(x: x, y: y))
        }
        
        chartLine.path = line.cgPath
        chartLine.strokeColor = PNGreen.cgColor
        
        pathAnimation.keyPath = "strokeEnd"
        pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        pathAnimation.autoreverses = false //动画的相反执行效果为false
        pathAnimation.duration = 1.0
        
    }
    
    
    
}
