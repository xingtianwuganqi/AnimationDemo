//
//  testView.swift
//  testDemo
//
//  Created by test7659 on 2019/8/21.
//  Copyright © 2019 test7659. All rights reserved.
//

import UIKit

class RoundView: UIView {
    
    var line : CAShapeLayer = CAShapeLayer()
    var pathAnimation : CABasicAnimation = CABasicAnimation()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white


        let path = UIBezierPath(arcCenter: CGPoint(x: self.frame.width / 2,y: self.frame.width / 2), radius: self.frame.width / 2 - 5, startAngle: 0, endAngle: (CGFloat(Double.pi) * 2), clockwise: true)
        
        let backLayer = CAShapeLayer()
        backLayer.frame = self.bounds
        backLayer.fillColor = UIColor.clear.cgColor
        backLayer.strokeColor = UIColor.init(red: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1).cgColor
        backLayer.lineWidth = 10
        backLayer.path = path.cgPath
        backLayer.strokeEnd = 1
        self.layer.addSublayer(backLayer)
        
        let linePath = UIBezierPath(arcCenter: CGPoint(x: self.frame.width / 2,y: self.frame.width / 2), radius: self.frame.width / 2 - 20, startAngle: 0, endAngle: (CGFloat(Double.pi) * 2), clockwise: true)
        
        let linebackLayer = CAShapeLayer()
        linebackLayer.frame = self.bounds
        linebackLayer.fillColor = UIColor.clear.cgColor
        linebackLayer.strokeColor = UIColor.init(red: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1).cgColor
        linebackLayer.lineWidth = 2
        linebackLayer.path = linePath.cgPath
        linebackLayer.strokeEnd = 1
        self.layer.addSublayer(linebackLayer)
        
        line.lineCap = .round
        line.lineJoin = .round
        line.lineWidth = 10
        line.fillColor = UIColor.clear.cgColor

        line.strokeEnd = 0
        self.layer.addSublayer(line)
        
    }
    
    func drawLineChart(num: CGFloat) { // 设置最终状态
        line.strokeEnd = num  // 表示绘制完成
        pathAnimation.toValue = num
        line.add(pathAnimation, forKey: nil)
    }
    
    override func draw(_ rect: CGRect) {
        let pathLine = UIBezierPath()
        pathLine.lineWidth = 10
        pathLine.lineCapStyle = .round
        pathLine.lineJoinStyle = .round
        
        pathLine.addArc(withCenter: CGPoint(x: self.frame.width / 2,y: self.frame.width / 2), radius: self.frame.width / 2 - 5, startAngle: (CGFloat(Double.pi) * 0.75), endAngle: (CGFloat(Double.pi) * 0.25), clockwise: true)
        
        line.path = pathLine.cgPath
        line.strokeColor = UIColor.red.cgColor
        
        pathAnimation.keyPath = "strokeEnd" // 表明该动画效果为一点点绘制
        pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear) // 设置绘制速度为匀速
        pathAnimation.fromValue = 0.0
        pathAnimation.autoreverses = false // 动画的相反执行效果为false
        pathAnimation.duration = 2.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func TO_RADIAUS(radius : CGFloat) -> CGFloat{
        print(Double.pi)
        return (CGFloat(Double.pi) * radius) / 180
    }
    
}
