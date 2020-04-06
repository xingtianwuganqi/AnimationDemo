//
//  CircleView.swift
//  swiftText
//
//  Created by jingjun on 2019/4/18.
//  Copyright © 2019 景军. All rights reserved.
//

import UIKit

protocol CircleDelegate: NSObjectProtocol {
    func circleAnimationStop()
}

class CircleView: UIView {

    var lineWidth : CGFloat = 3
    var strokeColor : UIColor = UIColor(red: 25.0 / 255.0, green: 155.0 / 255.0, blue: 200.0 / 255.0, alpha: 1)
    var circle: CAShapeLayer = CAShapeLayer()
    weak var delegate : CircleDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        let startAngle : CGFloat = -90.0 / 180.0 * CGFloat(Double.pi)
        let endAngle : CGFloat = -90.01 / 180.0 * CGFloat(Double.pi)
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2, y: frame.size.height / 2),
                                      radius: frame.size.height/2 - 2,
                                      startAngle: startAngle,
                                      endAngle: endAngle,
                                      clockwise: true)
        circle.path = circlePath.cgPath
        circle.lineCap = CAShapeLayerLineCap.round
        circle.fillColor = UIColor.clear.cgColor
        circle.lineWidth = lineWidth
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func strokeChart() {
        circle.lineWidth = lineWidth
        circle.strokeColor = strokeColor.cgColor
        self.layer.addSublayer(circle)
        let pathAnimation: CABasicAnimation = CABasicAnimation()
        pathAnimation.keyPath = "strokeEnd"
        pathAnimation.delegate = self
        pathAnimation.duration = 3.0
        pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        pathAnimation.setValue("strokeEndAnimationcircle", forKey: "groupborderkeycircle")
        circle.add(pathAnimation, forKey: "strokeEndAnimationcircle")
    }

}
extension CircleView : CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.circle.removeFromSuperlayer()
        delegate?.circleAnimationStop()
    }
}
