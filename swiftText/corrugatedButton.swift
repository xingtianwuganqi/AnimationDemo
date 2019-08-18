//
//  corrugatedButton.swift
//  swiftText
//
//  Created by jingjun on 2019/4/17.
//  Copyright © 2019 景军. All rights reserved.
//

import UIKit

class corrugatedButton: UIButton {

    var circleCenterX : CGFloat = 0
    var circleCenterY : CGFloat = 0
    var timer: Timer?
    var viewRadius = 0
    let targerAnimColor = UIColor(red: 216.0 / 255.0, green: 114.0 / 255.0, blue: 213.0 / 255.0, alpha: 0.8)
    var countNum = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 50 / 255.0, green: 185.0 / 255.0, blue: 170.0 / 255.0, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startButtonAnimation(_ msenderBt: UIButton,mevent: UIEvent) {
        self.isUserInteractionEnabled = false
        let button: UIView = msenderBt as UIView
        let touchSet : NSSet = mevent.touches(for: button)! as NSSet
        var touchArray : [AnyObject] = touchSet.allObjects as [AnyObject]
        let touch1 : UITouch = touchArray[0] as! UITouch
        let point1 : CGPoint = touch1.location(in: button)
        self.circleCenterX = point1.x
        self.circleCenterY = point1.y
        
        timer = Timer.scheduledTimer(timeInterval: 0.02,
                                     target: self,
                                     selector: #selector(timeaction),
                                     userInfo: nil,
                                     repeats: true)
        
        RunLoop.main.add(timer!, forMode: RunLoop.Mode.common)
        
    }
    
    override func draw(_ rect: CGRect) {
        let ctx : CGContext = UIGraphicsGetCurrentContext()!
        let endangle : CGFloat = CGFloat(Double.pi * 2)
        ctx.addArc(center: CGPoint(x: circleCenterX, y: circleCenterY),
                   radius: CGFloat(viewRadius),
                   startAngle: 0,
                   endAngle: endangle,
                   clockwise: false)
        let storckColor : UIColor = targerAnimColor
        storckColor.setStroke()
        storckColor.setFill()
        ctx.fillPath()
    }
    
    @objc func timeaction() {
        countNum += 1
        let dismissTime : DispatchTime = DispatchTime.now() + Double(Int64(0 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: dismissTime) {
            self.viewRadius += 5
            self.setNeedsDisplay()
        }
        if countNum > 50 {
            countNum = 0
            viewRadius = 0
            timer?.invalidate()
            DispatchQueue.main.asyncAfter(deadline: dismissTime) {
                self.viewRadius = 0
                self.setNeedsDisplay()
            }
            self.isUserInteractionEnabled = true
        }
    }
}
