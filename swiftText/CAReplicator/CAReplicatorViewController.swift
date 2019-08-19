//
//  CAReplicatorViewController.swift
//  swiftText
//
//  Created by jingjun on 2019/4/28.
//  Copyright © 2019 景军. All rights reserved.
//

import UIKit

class CAReplicatorViewController: UIViewController {

    var section = 0
    var row = 0
    
    var replicatorLayer : CAReplicatorLayer = CAReplicatorLayer()
    var iv_earch : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        if row == 0 {
            
            let backgroundImg = UIImageView.init(frame: CGRect(x: 0, y: 0, width: ScreenW, height: ScreenH))
            self.view.addSubview(backgroundImg)
            backgroundImg.image = UIImage(named: "背景图")
            
            iv_earch = UIImageView(frame: CGRect(x: (ScreenW - 50) / 2 + 150, y: (ScreenH - 50) / 2, width: 50, height: 50))
            iv_earch?.image = UIImage(named: "ico_home_active")
            let iv_sun = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            iv_sun.center = self.view.center
            iv_sun.image = UIImage(named: "tabBar_publish_icon")
            replicatorLayer.addSublayer(iv_earch!.layer)
            replicatorLayer.addSublayer(iv_sun.layer)

            
            animation()

        }else{
            self.jumpAnimation()

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    // 恒星旋转动画
    func animation() {
        let path : UIBezierPath = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: self.view.center.x, y: self.view.center.y), radius: 150, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        path.close()
        
        let animation : CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
        animation.path = path.cgPath
        animation.duration = 10
        animation.repeatCount = MAXFLOAT
        replicatorLayer.instanceCount = 100 // 有100个重复的图层
        replicatorLayer.instanceDelay = 0.2 // 每0.2秒复制 一个layer图层
        self.view.layer.addSublayer(replicatorLayer)
        iv_earch?.layer.add(animation, forKey: nil)
    }

    // 音量跳动动画效果
    func jumpAnimation() {
        let replicatorLayer : CAReplicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = CGRect(x: 0, y: 0, width: 414, height: 200)
        replicatorLayer.instanceCount = 20
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(20, 0, 0) // 设置复制图层之间的渐变效果，这里设置图层沿x方向，每隔20个点复制一份
        replicatorLayer.backgroundColor = UIColor.black.cgColor
        replicatorLayer.masksToBounds = true // 图层超出生效范围之外的部分剪掉
        
        let layer = CALayer()
        layer.frame = CGRect(x: 14, y: 200, width: 10, height: 100)
        layer.backgroundColor = UIColor.red.cgColor
        replicatorLayer.addSublayer(layer)
        
        self.view.layer.addSublayer(replicatorLayer)
        
        let animation = CABasicAnimation()
        animation.keyPath = "position.y"
        animation.duration = 0.5
        animation.fromValue = 200
        animation.toValue = 180
        animation.autoreverses = true
        animation.repeatCount = MAXFLOAT
        layer.add(animation, forKey: nil)
    }
}
