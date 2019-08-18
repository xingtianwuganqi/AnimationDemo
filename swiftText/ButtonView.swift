//
//  ButtonView.swift
//  swiftText
//
//  Created by jingjun on 2019/4/18.
//  Copyright © 2019 景军. All rights reserved.
//

import UIKit

class ButtonView: UIView {

    let FreshBlue : UIColor = UIColor(red: 25.0 / 255.0, green: 155.0 / 255.0, blue: 200.0 / 255.0, alpha: 1.0)
    let FreshGreen : UIColor = UIColor(red: 150.0 / 255.0, green: 203.0 / 255.0, blue: 25.0 / 255.0, alpha: 1.0)
    var view : UIView?
    var viewBorder : UIView?
    
    var button_x : CGFloat = 0
    var button_y : CGFloat = 0
    var button_w : CGFloat = 0
    var button_h : CGFloat = 0
    var label : UILabel?
    var circleView: CircleView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        button_x = frame.origin.x
        button_y = frame.origin.y
        button_w = frame.size.width
        button_h = frame.size.height
        view = UIView(frame: CGRect(x: 0, y: 0, width: button_w, height: button_h))
        view!.backgroundColor = FreshBlue
        viewBorder = UIView(frame: CGRect(x: 0, y: 0, width: button_w, height: button_h))
        viewBorder?.backgroundColor = UIColor.clear
        viewBorder?.layer.borderColor = FreshBlue.cgColor
        viewBorder?.layer.borderWidth = 3
        self.addSubview(view!)
        self.addSubview(viewBorder!)
        
        circleView = CircleView(frame: self.bounds)
        self.addSubview(circleView!)
        circleView?.delegate = self
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: button_w, height: button_h))
        label?.text = "UpLoad"
        label?.textAlignment = .center
        label?.textColor = UIColor.white
        label?.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(label!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func startAnimation() {
        label?.removeFromSuperview()
        let animMakeBigger : CABasicAnimation = CABasicAnimation()
        animMakeBigger.keyPath = "cornerRadius"
        animMakeBigger.fromValue = 5.0
        animMakeBigger.toValue = button_h / 2.0
        
        let animBounds = CABasicAnimation()
        animBounds.keyPath = "bounds"
        animBounds.toValue = NSValue(cgRect: CGRect(x: button_x + (button_w - button_h) / 2, y: button_h, width: button_h, height: button_h))
        
        let animAlpha : CABasicAnimation = CABasicAnimation()
        animAlpha.keyPath = "opacity"
        animAlpha.toValue = 0
//        animAlpha.isRemovedOnCompletion = false
//        animAlpha.fillMode = kCAFillModeForwards
        
        let animGroup = CAAnimationGroup()
        animGroup.duration = 1
        animGroup.repeatCount = 1
        animGroup.isRemovedOnCompletion = false
        animGroup.fillMode = CAMediaTimingFillMode.forwards
        animGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animGroup.animations = [animMakeBigger,animBounds,animAlpha]
        
        let animborder : CABasicAnimation = CABasicAnimation()
        animborder.keyPath = "borderColor"
        animborder.toValue = UIColor(red: 224.0 / 255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1).cgColor
    
        let animGroupAll = CAAnimationGroup()
        animGroupAll.duration = 1
        animGroupAll.repeatCount = 1
        animGroupAll.isRemovedOnCompletion = false
        animGroupAll.fillMode = CAMediaTimingFillMode.forwards
        animGroupAll.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animGroupAll.animations = [animMakeBigger,animBounds,animborder]
        animGroupAll.delegate = self
        animGroupAll.setValue("allMyAnimationsBoard", forKey: "groupborderkey")
    
        CATransaction.begin()
        view?.layer.add(animGroup, forKey: "allMyAnimation")
        
        viewBorder?.layer.add(animGroupAll, forKey: "allMyAnimationsBoard")
        CATransaction.commit()
    }
    
    
    func startAnimationSpread() {
        let animMakeBigger : CABasicAnimation = CABasicAnimation()
        animMakeBigger.keyPath = "cornerRadius"
        animMakeBigger.fromValue = button_h / 2.0
        animMakeBigger.toValue = 0
        
        let animBounds = CABasicAnimation()
        animBounds.keyPath = "bounds"
        animBounds.fromValue = NSValue(cgRect: CGRect(x: button_x + (button_w - button_h) / 2, y: button_y, width: button_h, height: button_h))
        animBounds.toValue = NSValue(cgRect: CGRect(x: 0, y: 0, width: button_w, height: button_h))
        
        let animAlpha : CABasicAnimation = CABasicAnimation()
        animAlpha.keyPath = "opacity"
        animAlpha.fromValue = 0
        animAlpha.toValue = 1
        
        let animBackground: CABasicAnimation = CABasicAnimation()
        animBackground.keyPath = "backgroundColor"
        animBackground.toValue = FreshGreen.cgColor
        
        let group: CAAnimationGroup = CAAnimationGroup()
        group.duration = 1
        group.repeatCount = 1
        group.isRemovedOnCompletion = false
        group.fillMode = CAMediaTimingFillMode.forwards
        group.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        group.animations = [animMakeBigger,animBounds,animAlpha,animBackground]
        
        let animBorder = CABasicAnimation()
        animBorder.keyPath = "borderColor"
        animBorder.toValue = FreshGreen.cgColor
        
        let allGroup : CAAnimationGroup = CAAnimationGroup()
        allGroup.duration = 1
        allGroup.repeatCount = 1
        allGroup.isRemovedOnCompletion = false
        allGroup.fillMode = CAMediaTimingFillMode.forwards
        allGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        allGroup.animations = [animMakeBigger,animBounds,animAlpha,animBorder]
        
        CATransaction.begin()
        view?.layer.add(group, forKey: "allMyAnimationspread1")
        
        allGroup.setValue("allMyAnimationsBoardspread1", forKey: "groupborderkey1")
        allGroup.delegate = self
        
        viewBorder?.layer.add(allGroup, forKey: "allMyAnimationBoardspread1")
        CATransaction.commit()
    }
    
}
extension ButtonView : CAAnimationDelegate,CircleDelegate {
    func animationDidStart(_ anim: CAAnimation) {
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            let animType = anim.value(forKey: "groupborderkey")
            let animTypel = anim.value(forKey: "groupborderkey1")
            if animType != nil {
                if (animType as! NSString).isEqual(to: "allMyAnimationsBoard") {
                    circleView?.strokeChart()
                }
            }else if animTypel != nil {
                if (animTypel as! NSString).isEqual(to: "allMyAnimationsBoardspread1") {
                    label = UILabel(frame: CGRect(x: 0, y: 0, width: button_w, height: button_h))
                    label?.text = "Complete"
                    label?.textAlignment = .center
                    label?.textColor = UIColor.white
                    label?.font = UIFont.systemFont(ofSize: 20)
                    self.addSubview(label!)
                }
            }
        }
    }
    
    func circleAnimationStop() {
        self.startAnimationSpread()
    }
}
