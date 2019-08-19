//
//  CAEmitterCellViewController.swift
//  swiftText
//
//  Created by jingjun on 2019/4/22.
//  Copyright © 2019 景军. All rights reserved.
//

import UIKit

class CAEmitterCellViewController: UIViewController {
    
    /*
 
     CAEmitterLayer简介：
     
     CAEmitterLayer（粒子发射器）继承自CALayer，提供了一个基于Core Animation的粒子发射系统，粒子用CAEmitterCell来初始化，一个单独的CAEmitterLayer可同时支持多个CAEmitterCell.
 
     
     CAEmitterLayer属性：
     
     emitterCells：CAEmitterCell对象的数组，用于把粒子投放到layer上。
     birthRate：粒子产生速度，默认1个每秒。
     lifetime：粒子纯在时间，默认1秒。
     emitterPosition：发射器在xy平面的中心位置。
     emitterZPosition：发射器在z平面的位置。
     preservesDepth：是否开启三维效果。
     velocity：粒子运动速度。
     scale：粒子的缩放比例。
     spin：自旋转速度。
     seed：用于初始化随机数产生的种子。
     emitterSize：发射器的尺寸。
     emitterDepth：发射器的深度。
     emitterShape：发射器的形状
     NSString * const kCAEmitterLayerPoint;//点的形状，粒子从一个点发出
     NSString * const kCAEmitterLayerLine;//线的形状，粒子从一条线发出
     NSString * const kCAEmitterLayerRectangle;//矩形形状，粒子从一个矩形中发出
     NSString * const kCAEmitterLayerCuboid;//立方体形状，会影响Z平面的效果
     NSString * const kCAEmitterLayerCircle;//圆形，粒子会在圆形范围发射
     NSString * const kCAEmitterLayerSphere;//球型
     emitterMode：发射器发射模式
     NSString * const kCAEmitterLayerPoints;//从发射器中发出
     NSString * const kCAEmitterLayerOutline;//从发射器边缘发出
     NSString * const kCAEmitterLayerSurface;//从发射器表面发出
     NSString * const kCAEmitterLayerVolume;//从发射器中点发出
     renderMode：发射器渲染模式
     NSString * const kCAEmitterLayerUnordered;//粒子无序出现
     NSString * const kCAEmitterLayerOldestFirst;//声明久的粒子会被渲染在最上层
     NSString * const kCAEmitterLayerOldestLast;//年轻的粒子会被渲染在最上层
     NSString * const kCAEmitterLayerBackToFront;//粒子的渲染按照Z轴的前后顺序进行
     NSString * const kCAEmitterLayerAdditive;//粒子混合
     
     
     CAEmitterCell属性：
     
     emitterCell：初始化方法。
     name：粒子的名字。
     color：粒子的颜色。
     enabled：粒子是否渲染。
     contents：渲染粒子，是个CGImageRef的对象，即粒子要展示的图片。
     contentsRect：渲染范围。
     birthRate：粒子产生速度。
     
     lifetime：生命周期。
     lifetimeRange：生命周期增减范围。
     velocity：粒子运动速度。
     velocityRange：速度范围。
     spin：粒子旋转角度。
     spinrange：粒子旋转角度范围。
     scale：缩放比例。
     scaleRange：缩放比例范围。
     scaleSpeed：缩放比例速度。
     alphaRange:：一个粒子的颜色alpha能改变的范围。
     alphaSpeed:：粒子透明度在生命周期内的改变速度。
     redRange：一个粒子的颜色red能改变的范围。
     redSpeed：粒子red在生命周期内的改变速度。
     blueRange：一个粒子的颜色blue能改变的范围。
     blueSpeed：粒子blue在生命周期内的改变速度。
     greenRange：一个粒子的颜色green能改变的范围。
     greenSpeed：粒子green在生命周期内的改变速度。
     xAcceleration：粒子x方向的加速度分量。
     yAcceleration：粒子y方向的加速度分量。
     zAcceleration：粒子z方向的加速度分量。
     emissionRange：粒子发射角度范围。
     emissionLongitude：粒子在xy平面的发射角度。
     emissionLatitude：发射的z轴方向的发射角度。
     
    */
    
    var row = 0

    let PNGreen : UIColor = UIColor(red: 77.0 / 255.0, green: 186.0 / 255.0, blue: 122.0 / 255.00, alpha: 1.0)

    var layerArray: Array<CAGradientLayer> = []
    var colorArr : Array<UIColor> = []
    
    var lineChartView : LineChartView?
    var barChartView : BarChartView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        if row == 0 {
            self.nenoLightAnimation()
        }else if row == 1 {
            self.gradientAnimation()
        }else if row == 2 {
            moreColorAnimation()
        }else if row == 3 {
            bezierPath()
        }else{
            self.lineChartAnimation()
        }
        
    }
    
    func lineChartAnimation() {
        lineChartView = LineChartView(frame: view.bounds)
        self.view.addSubview(lineChartView!)
        
        barChartView = BarChartView(frame: CGRect(x: 0, y: self.view.bounds.height/2, width: self.view.bounds.width, height: self.view.bounds.height))
        self.view.addSubview(barChartView!)
        self.addBrawChartButton()
        self.addAxes()
        
        
    }
    // 坐标系绘制代码
    func addAxes() {
        
        // lineChart
        for i in 1...5 {
            let xAxesTitle: String = "SEP" + "\(i)"
            let xAxesLabel : UILabel = UILabel(frame: CGRect(x: 50 + (CGFloat(i) - 1) * 70, y: 300, width: 50, height: 20))
            xAxesLabel.text = xAxesTitle
            self.view.addSubview(xAxesLabel)
        }
        for i in 0...5 {
            let yAxesTitle : String = "\(10 - i * 2)"
            let yAxesLabel : UILabel = UILabel(frame: CGRect(x: 20, y: 120 + (CGFloat(i) - 1) * 35, width: 20, height: 20))
            yAxesLabel.text = yAxesTitle
            self.view.addSubview(yAxesLabel)

        }
        
        // barChart
        for i in 1...5 {
            let xAxesTitle:String = "SEP" + "\(i)"
            let xAxesLabel : UILabel = UILabel(frame: CGRect(x: 40 + (CGFloat(i) - 1) * 70, y: 600, width: 50, height: 20))
            xAxesLabel.text = xAxesTitle
            self.view.addSubview(xAxesLabel)
            
        }

    }
    
    func addBrawChartButton(){
        let button = UIButton()
        button.frame = CGRect(x: (self.view.frame.size.width - 100)/2, y: 80, width: 100, height: 50)
        button.setTitle("Line Chart", for: .normal)
        button.setTitleColor(PNGreen, for: .normal)
        button.addTarget(self, action: #selector(lineButtonClick), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func lineButtonClick() {
        lineChartView?.drawLineChart()
        barChartView?.drawLineChart()
    }
    
    func fireAnimation() {
        // CAEmitterLayer : 粒子发射图层
        // CAEmitterCell  : 粒子发射单元
        let emitterCell = CAEmitterCell()  // 粒子单元
        emitterCell.name = "fire"
        emitterCell.emissionLongitude = CGFloat(Double.pi) // 定义该粒子系统在xy平面的发射角度
        emitterCell.velocity = -1 // 粒子速度，负数表明向上燃烧
        emitterCell.velocityRange = 50 // 粒子速度范围
        emitterCell.emissionRange = 1.1 // 周围发射角度
        emitterCell.yAcceleration = -200 // 粒子y方向的加速度分量
        emitterCell.scaleSpeed = 0.3 // 缩放比例，超大火苗
        emitterCell.color = UIColor(red: 0.8, green: 0.4, blue: 0.2, alpha: 0.1).cgColor
        emitterCell.contents = UIImage(named: "dz_0005")?.cgImage
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.position = self.view.center // 粒子发射位置
        emitterLayer.emitterSize = CGSize(width: 50, height: 10) // 控制火苗大小
        emitterLayer.renderMode = CAEmitterLayerRenderMode.additive // 渲染模式
        emitterLayer.emitterMode = CAEmitterLayerEmitterMode.outline // 发射源模式
        emitterLayer.emitterShape = CAEmitterLayerEmitterShape.line
        emitterLayer.emitterCells = [emitterCell]
        self.view.layer.addSublayer(emitterLayer)
        
        emitterLayer.setValue(500, forKeyPath: "emitterCells.fire.birthRate")
        emitterLayer.setValue(1, forKeyPath: "emitterCells.fire.lifetime")
    }

    func nenoLightAnimation() {
        let emitterCell = CAEmitterCell()
        emitterCell.name = "nenolight"
        emitterCell.emissionLongitude = CGFloat(Double.pi)
        emitterCell.velocity = 50
        emitterCell.velocityRange = 50
        
        emitterCell.scaleSpeed = -0.2
        emitterCell.scale = 0.1
        emitterCell.greenSpeed = -0.1
        emitterCell.redSpeed = -0.2
        emitterCell.blueSpeed = 0.1
        emitterCell.alphaSpeed = -0.2
        emitterCell.birthRate = 100
        emitterCell.lifetime = 4
        emitterCell.color = UIColor.white.cgColor
        emitterCell.contents = UIImage(named: "dz_0005")?.cgImage
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.position = self.view.center  // 粒子发射位置
        emitterLayer.emitterSize = CGSize(width: 2, height: 2)
        emitterLayer.renderMode = CAEmitterLayerRenderMode.backToFront
        emitterLayer.emitterMode = CAEmitterLayerEmitterMode.outline
        emitterLayer.emitterShape = CAEmitterLayerEmitterShape.circle
        emitterLayer.emitterCells = [emitterCell]
        self.view.layer.addSublayer(emitterLayer)
        
    }
    
    func gradientAnimation() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 105, y: 330, width: 200, height: 200)
        self.view.layer.addSublayer(gradientLayer)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1) // 从上到下 ， CGPoint(x:1,y:0) 从左到又

        _ = UIColor(red: 216.0 / 255.0, green: 114.0 / 255.0, blue: 213.0 / 255.0, alpha: 1.0)

        gradientLayer.colors = [UIColor.clear.cgColor,UIColor.white.cgColor,UIColor.blue.cgColor]
        gradientLayer.locations = [0.0,0.1,0.2] // 颜色渐变效果 光波颜色梯度 占整个视图面积的百分比
        
        
        // 设置动画
        let gradientAnim = CABasicAnimation()
        gradientAnim.keyPath = "locations"
        gradientAnim.fromValue = [0.0,0.1,0.2]
        gradientAnim.toValue = [0.8,0.9,1.0]
        gradientAnim.duration = 3.0
        gradientAnim.repeatCount = 10
        gradientLayer.add(gradientAnim, forKey: nil)
        
    }
    
    func moreColorAnimation() {
        setColorArr()
        setUI()
        
    }
    
    func setColorArr()  {
        let color1 = UIColor(red: 255.0 / 255.0, green: 127.0 / 255.0, blue: 79.0 / 255.0, alpha: 1.0)
        let color2 = UIColor(red: 138.0 / 255.0, green: 206.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
        let color3 = UIColor(red: 216.0 / 255.0, green: 114.0 / 255.0, blue: 213.0 / 255.0, alpha: 1.0)
        let color4 = UIColor(red: 51.0 / 255.0, green: 207.0 / 255.0, blue: 48.0 / 255.0, alpha: 1.0)
        let color5 = UIColor(red: 102.0 / 255.0, green: 150.0 / 255.0, blue: 232.0 / 255.0, alpha: 1.0)
        let color6 = UIColor(red: 255.0 / 255.0, green: 105.0 / 255.0, blue: 177.0 / 255.0, alpha: 1.0)
        let color7 = UIColor(red: 187.0 / 255.0, green: 56.0 / 255.0, blue: 201.0 / 255.0, alpha: 1.0)
        let color8 = UIColor(red: 255.0 / 255.0, green: 163.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
        let color9 = UIColor(red: 203.0 / 255.0, green: 93.0 / 255.0, blue: 92.0 / 255.0, alpha: 1.0)
        let color10 = UIColor(red: 61.0 / 255.0, green: 226.0 / 255.0, blue: 210.0 / 255.0, alpha: 1.0)
        let color11 = UIColor(red: 25.0 / 255.0, green: 146.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        
        colorArr.append(color1)
        colorArr.append(color2)
        colorArr.append(color3)
        colorArr.append(color4)
        colorArr.append(color5)
        colorArr.append(color6)
        colorArr.append(color7)
        colorArr.append(color8)
        colorArr.append(color9)
        colorArr.append(color10)
        colorArr.append(color11)
    }
    
    func setUI() {
        let audioBarNum = 15
        for i in 0...audioBarNum {
            let h : CGFloat = 150
            let w : CGFloat = (self.view.frame.size.width - 10) / CGFloat(audioBarNum)
            let x : CGFloat = 20
            let y : CGFloat = 50
            let view = UIView(frame: CGRect(x: w * CGFloat(i) + w, y: y, width: w - x, height: h))
            self.view.addSubview(view)
            // 添加动画图层
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = view.bounds
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            view.layer.addSublayer(gradientLayer)
            
            layerArray.append(gradientLayer)
        }
        
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(colorChange), userInfo: nil, repeats: true)
    }

    @objc func colorChange() {
        for layer in layerArray {
            let index = Int(arc4random_uniform(11))
            let color = colorArr[index]
            let colors = [
                UIColor.clear.cgColor,
                color.cgColor
            ]
            
            layer.colors = colors
            layer.locations = [0,1.0]
            let gradienAnimation = CABasicAnimation()
            gradienAnimation.keyPath = "locations"
            let beginValue = Float(arc4random_uniform(11)) / 10
            gradienAnimation.fromValue = [beginValue,beginValue]
            gradienAnimation.toValue = 0.4
            layer.add(gradienAnimation, forKey: nil)
        }
    }
    
    func bezierPath() {
        let bezier = BezierPathView.init(frame: view.bounds)
        view.addSubview(bezier)
    }
    

}
