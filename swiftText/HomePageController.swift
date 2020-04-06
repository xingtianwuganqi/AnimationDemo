//
//  HomePageController.swift
//  swiftText
//
//  Created by jingjun on 2018/8/28.
//  Copyright © 2018年 景军. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import RxDataSources
import SnapKit
import ImageIO
import MobileCoreServices


class HomePageController: UIViewController {
    
    var section: Int = 0
    var row: Int = 0
    
//    typealias Reactor = HomePageReactor
    var disposeBag = DisposeBag()

//    let loginBtn = UIButton(type: .custom).then { (button) in
//        button.setTitle("登录", for: .normal)
//        button.backgroundColor = UIColor.green
//        button.frame = CGRect(x: 40, y: 200, width: ScreenW - 80, height: ScreenW - 80)
//    }
    
    let loginBtn = corrugatedButton(frame: CGRect(x: 40, y: 200, width: ScreenW - 80, height: ScreenW - 80)).then { (button) in
        button.setTitle("登录", for: .normal)
    }
    
    var index = 0
    
    let backImage = UIImageView().then { (view) in
        view.image = UIImage.init(named: "背景图")
        view.frame = CGRect(x: 0, y: 0, width: ScreenW, height: ScreenH)
    }
    
    let plane = UIImageView().then { (view) in
        view.image = UIImage.init(named: "sipp")
        view.frame = CGRect(x: 20, y: 100, width: 30, height: 30)
    }
    
    let likeImageView = UIImageView().then { (view) in
        view.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    }
    
    var timer : Timer?
    
    let blackHole = BlackHoleView().then { (view) in
        view.frame = UIScreen.main.bounds
        view.backgroundColor = UIColor.cyan
    }
    
//    init() {
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        view.addSubview(backImage)
        view.addSubview(loginBtn)
        view.addSubview(likeImageView)
        view.addSubview(plane)
        

        self.buttonCorrugatedAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { //[weak self] in
            switch self.section {
            case 0:
                switch self.row {
                case 0:
                    self.loginBtnAnimation()
                case 1:
                    self.transFormAnimation()
                case 2:
                    self.planeAnimation()
                case 3:
                    self.keyTransFromAnimation()
                case 4:
                    self.buildTimer()
                case 5:
                    self.buildCADisplayLink()
                case 6:
                    self.view.addSubview(self.blackHole)
                    
                    self.drawAnimation()
                case 7:
                    self.decompositionGifImage()

                case 8:
                    self.createGifImage()
                default:
                    return
                }
            case 1:
                switch self.row {
                case 0:
                    self.buttonLayerAnimation()
                case 1:
                    self.buttonLayerTransformAnimation()
                case 2:
                    self.buttonLayerRotationAnimation()
                case 3:
                    self.buttonLayerTranslationAnimation()
                case 4:
                    self.buttonLayerCornerRadiusAnimation()
                case 5:
                    self.buttonLayerBorderWidthAnimation()
                case 6:
                    self.buttonLayerBackgrandColorAnimation()
                case 7:
                    self.buttonLayerBorderColorAnimation()
                case 8:
                    self.buttonLayerOpacityAnimation()
                case 9:
                    self.buttonLayerShadowOffsetAnimation()
                case 10:
                    self.buttonKeyFrameAnimation()
                case 11:
                    self.buttonKeyFramePositionAnimation()
                case 12:
                    self.buttonAnimationGroup()
                default:
                    
                    return
                }
            default:
                return
            }
            
//
//
//            self.planeAnimation()
//            self.keyTransFromAnimation()
//            self.buildTimer()
//            self.buildCADisplayLink()
//            self.drawAnimation()
//            self.decompositionGifImage()
//            self.createGifImage()
//            self.buttonLayerAnimation()
//            self.buttonLayerTransformAnimation()
//            self.buttonLayerRotationAnimation()
//            self.buttonLayerTranslationAnimation()
//            self.buttonLayerCornerRadiusAnimation()
//            self.buttonLayerBorderWidthAnimation()
//            self.buttonLayerBackgrandColorAnimation()
//            self.buttonLayerBorderColorAnimation()
//            self.buttonLayerOpacityAnimation()
//            self.buttonLayerShadowOffsetAnimation()
//            self.buttonKeyFrameAnimation()
//            self.buttonKeyFramePositionAnimation()
//            self.buttonAnimationGroup()
            
        }
        
    }
    // 显示层动画
    // 缩放动画
    func loginBtnAnimation(){
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.5)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStop(#selector(self.animationEnd)) // 结束时需要执行的方法
        loginBtn.transform = CGAffineTransform.init(scaleX: 0.7, y: 1.4)
        UIView.commitAnimations()
    }

    @objc func animationEnd() {
        print("animationEnd")
    }
    
    // 旋转动画
    func transFormAnimation() {
        /*
 
         UIView.setAnimationDelegate(self) //
         在代理方法中，动画完成后flag并不会变成true，说明动画没有执行完，又重复调用self.transFormAnimation()，会导致内存泄漏
         
         func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
         print("animation stop")
         
         //        if flag {
         //             self.transFormAnimation()
         //        }
            self.transFormAnimation() //lag并不会变成true，说明动画没有执行完，又重复调用self.transFormAnimation()，会导致内存泄漏
         }
 
         */
        
//        UIView.beginAnimations(nil, context: nil)
//        UIView.setAnimationDuration(0.5)
//        let angleStart : CGFloat = CGFloat(Double.pi / 2)
//        index += 1
//        let angle = CGFloat(index) * angleStart
//        print(angle)
//        UIView.setAnimationDelegate(self) // 代理是给layer层的动画，这里开始动画后layer层动画不会停止，会导致内存泄漏
//        loginBtn.transform = CGAffineTransform.init(rotationAngle: angle)
//        UIView.commitAnimations()
        
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            let angleStart : CGFloat = CGFloat(Double.pi / 2)
            self?.index += 1
            let angle = CGFloat(self?.index ?? 0) * angleStart
            print(angle)
            self?.loginBtn.transform = CGAffineTransform.init(rotationAngle: angle)
        }) { [weak self](finish) in
            if finish {
                self?.transFormAnimation()
            }
        }
    }
    
    // 关键帧动画
    func planeAnimation() {
        
        /*
         calculationModeCubic : 立方
         calculationModeDiscrete : 离散
         calculationModePaced : 节奏
 
 
         */
        
        // 结束帧动画
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: UIView.KeyframeAnimationOptions.calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                self.plane.frame = CGRect(x: 70, y: 120, width: 35, height: 35)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 1, animations: {
                self.plane.frame = CGRect(x: 140, y: 320, width: 40, height: 40)
            })
            
        }) { (finish) in
            print("done")
        }
    }
    
    // 关键帧实现抽奖大转盘
    
    func keyTransFromAnimation() {
        UIView.animateKeyframes(withDuration: 1.2, delay: 0, options: UIView.KeyframeAnimationOptions.calculationModeCubic, animations: { [weak self] in
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3, animations: {
                self?.index += 1
                let angleStart : CGFloat = CGFloat(Double.pi / 2)
                let angle = CGFloat(self?.index ?? 0) * angleStart
                self?.loginBtn.transform = CGAffineTransform.init(rotationAngle: angle) // 在UIView的black中执行CGAffineTransform动画时self,要用weak修饰，修改frame时，self不用weak修饰不会造成内存泄漏
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3, animations: {
                self?.index += 1
                let angleStart : CGFloat = CGFloat(Double.pi / 2)
                let angle = CGFloat(self?.index ?? 0) * angleStart
                self?.loginBtn.transform = CGAffineTransform.init(rotationAngle: angle)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.3, animations: {
                self?.index += 1
                let angleStart : CGFloat = CGFloat(Double.pi / 2)
                let angle = CGFloat(self?.index ?? 0) * angleStart
                self?.loginBtn.transform = CGAffineTransform.init(rotationAngle: angle)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.3, animations: {
                self?.index += 1
                let angleStart : CGFloat = CGFloat(Double.pi / 2)
                let angle = CGFloat(self?.index ?? 0) * angleStart
                self?.loginBtn.transform = CGAffineTransform.init(rotationAngle: angle)
            })
        }) { (finish) in
            if finish {
                print("finish")

                self.keyTransFromAnimation()
            }
        }
    }
    // 逐帧动画实现（定时器，CADisplayLink，Draw）
    
    func buildTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                     target: self,
                                     selector: #selector(refreshImg),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func refreshImg() {
        self.likeImageView.image = UIImage(named: "dz_000\(index)")
        index += 1
        if index == 23 {
            index = 0
        }
    }
    
    // 基于CADisplayLink 逐帧动画
    func buildCADisplayLink () {
        let displayLink = CADisplayLink.init(target: self, selector: #selector(refreshImg))
        displayLink.preferredFramesPerSecond = 1 // 刷帧率 1/60s
        displayLink.add(to: RunLoop.current, forMode: RunLoop.Mode.default)
        
    }
    
    // 基于draw 方法 逐帧动画
    func drawAnimation() {
        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                     target: self,
                                     selector: #selector(drawBlackHole),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func drawBlackHole() {
        DispatchQueue.main.async {
            self.blackHole.blackHoleIncrease(Float(self.index))
            self.index += 1
        }
        if self.index == 200 {
            timer?.invalidate()
        }
    }
    
    // gif 动画的分解与合成
    /*  分解过程
     1.将gif 转换成nsdata
     2.将NSData 作为 ImageIO 模块的输入
     3.获取ImageIO的输出数据：UIImage
     4.将获得的UIImage 存储为jpg/png
 
 
    */
    // URL.init(fileURLWithPath:) 与 URL.init(String:) 的区别，file 不需要协议头，string 需要协议头
    func decompositionGifImage() {
        // 读取gif
        guard let gifPath = Bundle.main.path(forResource: "plane", ofType: "gif") else {
            return
        }
    
        guard let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: gifPath)) else {
            return
        }
        
        guard let gifDataSource : CGImageSource = CGImageSourceCreateWithData(data as CFData, nil) else {
            return
        }

        let gifImageCount : Int = CGImageSourceGetCount(gifDataSource)
        
        for i in 0..<gifImageCount {
            let imageref : CGImage = CGImageSourceCreateImageAtIndex(gifDataSource, i, nil)!
            let image: UIImage = UIImage.init(cgImage: imageref, scale: UIScreen.main.scale, orientation: UIImage.Orientation.up)
            let imageData = image.pngData()
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let endPath = (path as NSString).appendingPathComponent("gifPath")
            try? FileManager.default.createDirectory(atPath: endPath, withIntermediateDirectories: true, attributes: nil)
            let imagePath = (endPath as NSString).appendingPathComponent("gif-\(i).png")
            try? imageData?.write(to: URL.init(fileURLWithPath: imagePath))
            print(imagePath)
        }
    }
    
    func createGifImage() {
        var imageArr : [UIImage] = []
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let gifPath = (path as NSString).appendingPathComponent("gifPath")
        for i in 0..<24 {
            print("\(gifPath)/gif-\(i).png")
            let image = UIImage.init(contentsOfFile: "\(gifPath)/gif-\(i).png")
        
            imageArr.append(image!)
        }
        print(imageArr.count)
        
        // 创建gif 的文件夹
        let gifImgPath = (path as NSString).appendingPathComponent("gifImgPath")
        try? FileManager.default.createDirectory(atPath: gifImgPath, withIntermediateDirectories: true, attributes: nil)
        let imgPath = (gifImgPath as NSString).appendingPathComponent("plane.gif")
        let url = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, imgPath as CFString, CFURLPathStyle.cfurlposixPathStyle, false)
        guard let destion = CGImageDestinationCreateWithURL(url!, kUTTypeGIF, imageArr.count, nil) else {
            return
        }// 创建一个图片的目标对象
        
        
         //part 3：设置gif图片属性，利用图片构建gif
        let cgimagePropertiesDic = [kCGImagePropertyGIFDelayTime as String: 0.1] // 设置每帧播放时间
        let cgimagePropertiesDestDic = [kCGImagePropertyGIFDictionary as String: cgimagePropertiesDic]
        for cgimage in imageArr {
            CGImageDestinationAddImage(destion, (cgimage as AnyObject).cgImage!!, cgimagePropertiesDestDic as CFDictionary?)
        } // 依次为gif 图像添加每一帧元素
        let gifPropertiesDic: NSMutableDictionary = NSMutableDictionary()
        gifPropertiesDic.setValue(kCGImagePropertyColorModelRGB, forKey: kCGImagePropertyColorModel as String)
        gifPropertiesDic.setValue(16, forKey: kCGImagePropertyDepth as String) // 设置图像的颜色深度
        gifPropertiesDic.setValue(1, forKey: kCGImagePropertyGIFLoopCount as String) // 设置gif执行次数
        let gifDictionaryDestDic = [kCGImagePropertyGIFDictionary as String:gifPropertiesDic]
        CGImageDestinationSetProperties(destion, gifDictionaryDestDic as CFDictionary?) //为gif添加属性
        CGImageDestinationFinalize(destion)
        
    }
    
    // 内容层动画
    // 位置动画
    func buttonLayerAnimation() {
        let animation : CABasicAnimation = CABasicAnimation()
        animation.keyPath = "position"
        let positionX : CGFloat = loginBtn.frame.origin.x + 0.5 * loginBtn.frame.size.width
        let positionY : CGFloat = loginBtn.frame.origin.y + 0.5 * loginBtn.frame.size.height + 100
        // toValue ： 移动到某个位置 byValue: 在之前位置的基础上移动到某个位置
        animation.toValue = NSValue.init(cgPoint: CGPoint(x: positionX, y: positionY))
        animation.duration = 2.0
        animation.fillMode = CAMediaTimingFillMode.forwards //当动画结束后,layer会一直保持着动画最后的状态
        // kCAFillModeRemoved 这个是默认值,也就是说当动画开始前和动画结束后,动画对layer都没有影响,动画结束后,layer会恢复到之前的状态
        // kCAFillModeBackwards 当在动画开始前,你只要把layer加入到一个动画中,layer便立即进入动画的初始状态并等待动画开始.你可以这样设定测试代码,延迟3秒让动画开始,只要动画被加入了layer,layer便处于动画初始状态
        // kCAFillModeForwards是动画开始之后迅速进入到fromValue位置
        // kCAFillModeBackwards是动画开始之前迅速进入到fromValue位置
        
        animation.beginTime = CACurrentMediaTime() + 3 // 动画3秒之后执行
        animation.isRemovedOnCompletion = false // 是否动画执行完毕后就从图层上移除
        loginBtn.layer.add(animation, forKey: nil)
    }
    // 缩放动画
    func buttonLayerTransformAnimation() {
        let animation: CABasicAnimation = CABasicAnimation()
        animation.keyPath = "transform.scale.y"
        animation.fromValue = 1.0 // 原始系数
        animation.toValue = 0.8 // 缩放系数
        animation.duration = 2.0
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        loginBtn.layer.add(animation, forKey: nil)
    }
    
    // 旋转动画
    func buttonLayerRotationAnimation() {
        let animation : CABasicAnimation = CABasicAnimation()
        animation.keyPath = "transform.rotation"
        animation.toValue = 3.14 / 2
        animation.duration = 2.0
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        loginBtn.layer.add(animation, forKey: nil)
    }
    // 位移动画
    func buttonLayerTranslationAnimation() {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.translation.y"
        animation.toValue = 100
        animation.duration = 2.0
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        loginBtn.layer.add(animation, forKey: nil)
    }
    
    // 圆角动画
    func buttonLayerCornerRadiusAnimation() {
        let animation = CABasicAnimation()
        animation.keyPath = "cornerRadius"
        animation.toValue = 30
        animation.duration = 2.0
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        loginBtn.layer.add(animation, forKey: nil)

    }
    
    // 边框动画
    func buttonLayerBorderWidthAnimation() {
        
        loginBtn.layer.borderColor = UIColor.red.cgColor
        loginBtn.layer.cornerRadius = 10
        
        let animation = CABasicAnimation()
        animation.keyPath = "borderWidth"
        animation.toValue = 10
        animation.duration = 2
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        loginBtn.layer.add(animation, forKey: nil)
    }
    
    // 颜色渐变
    func buttonLayerBackgrandColorAnimation() {
        let animation = CABasicAnimation()
        animation.keyPath = "backgroundColor"
        animation.fromValue = UIColor.green.cgColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 2
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        loginBtn.layer.add(animation, forKey: nil)
    }
    
    // 边框颜色渐变
    func buttonLayerBorderColorAnimation() {
        loginBtn.layer.borderWidth = 5
        let animation = CABasicAnimation()
        animation.keyPath = "borderColor"
        animation.fromValue = UIColor.green.cgColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 2.0
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        loginBtn.layer.add(animation, forKey: nil)
    }
    
    // 淡入淡出动画
    func buttonLayerOpacityAnimation() {
        let animation = CABasicAnimation()
        animation.keyPath = "opacity"
        animation.fromValue = UIColor.green.cgColor
        animation.toValue = 1.0
        animation.duration = 2.0
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        loginBtn.layer.add(animation, forKey: nil)
        
    }
    // 阴影渐变动画
    func buttonLayerShadowOffsetAnimation() {
        loginBtn.layer.shadowColor = UIColor.red.cgColor
        loginBtn.layer.shadowOpacity = 0.5
        let animation = CABasicAnimation()
        animation.keyPath = "shadowOffset"
        animation.toValue = NSValue(cgSize: CGSize(width: 10, height: 10))
        animation.duration = 2.0
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        loginBtn.layer.add(animation, forKey: nil)
    }
    
    //CAKeyframeAnimation
    // 淡入淡出动画
    func buttonKeyFrameAnimation() {
        let animation = CAKeyframeAnimation()
        animation.duration = 10
        animation.keyPath = "opacity"
        animation.values = [
            NSNumber(value: 0.95 as Float),
            NSNumber(value: 0.90 as Float),
            NSNumber(value: 0.0 as Float),
            NSNumber(value: 0.80 as Float),
            NSNumber(value: 0.75 as Float),
            NSNumber(value: 0.70 as Float),
            NSNumber(value: 0.65 as Float),
            NSNumber(value: 0.60 as Float),
            NSNumber(value: 0.10 as Float),
            NSNumber(value: 0.00 as Float),
            
        ]
        animation.keyTimes = [
            NSNumber(value: 0.3),
            NSNumber(value: 0.9),
            NSNumber(value: 1)
        ]
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        loginBtn.layer.add(animation, forKey: nil)
    }
    // 任意路径动画
    func buttonKeyFramePositionAnimation() {
        let pathLine : CGMutablePath = CGMutablePath()
        pathLine.move(to: CGPoint(x: 100, y: 100))
        // 直线
//        pathLine.addLine(to: CGPoint(x: 30, y: 200))
//        pathLine.addLines(between: [CGPoint(x: 30, y: 200),CGPoint(x: 80, y: 400),CGPoint(x: 100, y: 200),CGPoint(x: 100, y: 100)])
        // 曲线
//        pathLine.addArc(tangent1End: CGPoint(x: 30,y: 200), tangent2End: CGPoint(x: 200,y: 300), radius: 150)
//        pathLine.addArc(center: CGPoint(x: 100,y: 100), radius: 50, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        
        pathLine.addRect(CGRect(x: 100, y: 100, width: 100, height: 200))
//        pathLine.addRects([CGRect(x: 100, y: 100, width: 100, height: 200),CGRect(x: 220, y: 100, width: 60, height: 200)], transform: CGAffineTransform.init(rotationAngle: CGFloat(Double.pi)))
    
        let animation = CAKeyframeAnimation()
//        animation.keyTimes = [
//            NSNumber(value: 0.0),
//            NSNumber(value: 0.2),
//            NSNumber(value: 0.3),
//            NSNumber(value: 0.6),
//            NSNumber(value: 1)
//        ]
        animation.duration = 3
        animation.path = pathLine
        animation.keyPath = "position"
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        self.plane.layer.add(animation, forKey: nil)
    }
    
    // 动画组合
    func buttonAnimationGroup() {
        let rotate = CABasicAnimation()
        rotate.keyPath = "transform.rotation"
        rotate.toValue = Double.pi
        let scale = CABasicAnimation()
        scale.keyPath = "transform.scale"
        scale.toValue = 0.0
        let move = CABasicAnimation()
        move.keyPath = "transform.translation"
        move.toValue = NSValue(cgPoint: CGPoint(x: 100, y: 200))
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [rotate,scale,move]
        animationGroup.duration = 5
        animationGroup.fillMode = CAMediaTimingFillMode.forwards
        animationGroup.isRemovedOnCompletion = false
        loginBtn.layer.add(animationGroup, forKey: nil)
    }
    
    // 按钮波纹动画
    func buttonCorrugatedAnimation() {
        self.loginBtn.addTarget(self, action: #selector(loginAction(_:event:)), for: .touchUpInside)
    }
    
    @objc func loginAction(_ sender: UIButton,event: UIEvent) {
        let bt: corrugatedButton = sender as! corrugatedButton
        bt.startButtonAnimation(bt, mevent: event)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        self.loginBtn.layer.removeAllAnimations()
    }
    
}

extension HomePageController : CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("animation stop")
        // 需要在动画完成后再执行，不然会引起内存泄漏
        if flag {
            self.transFormAnimation()
        }
//        self.transFormAnimation()
    }
}
