//
//  LineChartView.swift
//  swiftText
//
//  Created by jingjun on 2019/4/25.
//  Copyright © 2019 景军. All rights reserved.
//

import UIKit

class LineChartView: UIView {
    
    let PNGreen : UIColor = UIColor(red: 77.0 / 255.0, green: 186.0 / 255.0, blue: 122.0 / 255.00, alpha: 1.0)
    
    var chartLine : CAShapeLayer = CAShapeLayer()
    var pathAnimation : CABasicAnimation = CABasicAnimation()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.clipsToBounds = true
        chartLine.lineCap = CAShapeLayerLineCap.round
        chartLine.lineJoin = CAShapeLayerLineJoin.round
        chartLine.fillColor = UIColor.white.cgColor
        chartLine.lineWidth = 10.0
        chartLine.strokeEnd = 0.0 // 绘制结束的地方站总路径的百分比，为0时表示还未绘制
        self.layer.addSublayer(chartLine)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawLineChart() { // 设置最终状态
        chartLine.strokeEnd = 1.0  // 表示绘制完成
        chartLine.add(pathAnimation, forKey: nil)
    }
    
    override func draw(_ rect: CGRect) {
        let line : UIBezierPath = UIBezierPath()
        line.lineWidth = 10.0
        line.lineCapStyle = CGLineCap.round
        line.lineJoinStyle = CGLineJoin.round
        line.move(to: CGPoint(x: 70,y: 80))
        line.addLine(to: CGPoint(x: 140, y: 100))
        line.addLine(to: CGPoint(x: 210, y: 240))
        line.addLine(to: CGPoint(x: 280, y: 170))
        line.addLine(to: CGPoint(x: 350, y: 220))
        
        chartLine.path = line.cgPath
        chartLine.strokeColor = PNGreen.cgColor
        
        pathAnimation.keyPath = "strokeEnd" // 表明该动画效果为一点点绘制
        pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear) // 设置绘制速度为匀速
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        pathAnimation.autoreverses = false // 动画的相反执行效果为false
        pathAnimation.duration = 2.0
    }
}
