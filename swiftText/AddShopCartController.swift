//
//  AddShopCartController.swift
//  swiftText
//
//  Created by jingjun on 2020/5/12.
//  Copyright © 2020 景军. All rights reserved.
//

import UIKit

class AddShopCartController: UIViewController {
    lazy var tableview : UITableView = {
        let tableview = UITableView(frame: .zero, style: UITableView.Style.grouped)
        tableview.estimatedRowHeight = 0
        tableview.estimatedSectionFooterHeight = 0
        tableview.estimatedSectionHeaderHeight = 0
        tableview.showsVerticalScrollIndicator = false
        tableview.showsHorizontalScrollIndicator = false
        tableview.separatorStyle = .none
        tableview.dataSource = self
        tableview.delegate = self
        tableview.backgroundColor = UIColor.white
        return tableview
    }()
    
    lazy var cartBtn: UIButton = {
        let button = UIButton.init(type: .custom)
        button.backgroundColor = .red
        button.layer.cornerRadius = 18
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var viewArray:[UIView] = {
        let viewArray = [UIView]()
        return viewArray
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableview()
    }
    
    func setTableview() {
        self.view.addSubview(tableview)
        tableview.register(UINib.init(nibName: "AddShopCartCell", bundle: Bundle.main), forCellReuseIdentifier: "addShopCartIdentifier")
        tableview.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.view.addSubview(cartBtn)
        cartBtn.frame = CGRect(x: 0, y: ScreenH - 36, width: 36, height: 36)
    }
    
}
extension AddShopCartController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addShopCartIdentifier", for: indexPath) as! AddShopCartCell
        cell.indexpath = indexPath
        cell.clickAction = { (index) in
            /*
             [viewB convertRect:viewC.frame toView:viewA];计算viewB上的viewC相对于viewA的frame
             [viewC convertRect:viewB.frame fromView:viewA];计算viewA上的viewB相对于viewC的frame
             */
            let rect = cell.convert(cell.addButton.frame, to: self.view)
            print(rect)
            self.addAnimation(rect: rect)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
}
extension AddShopCartController: CAAnimationDelegate {
    
    func addAnimation(rect: CGRect) {
        
        autoreleasepool{
            let squr = UIView()
            squr.backgroundColor = UIColor.red
            squr.frame = CGRect(x: 0, y: 0, width: 23, height: 23)
            squr.layer.cornerRadius = 23/2
            squr.layer.masksToBounds = true
            self.view.insertSubview(squr, aboveSubview: self.tableview)
            self.viewArray.append(squr)
            
        }
        let lastSquar = self.viewArray.last
        let path =  CGMutablePath()
        let beginPoint = CGPoint(x: rect.origin.x + rect.size.width / 2, y: rect.origin.y + rect.size.height / 2)
        
        path.move(to: beginPoint)
        
        path.addQuadCurve(to:self.cartBtn.center,  control: CGPoint(x: 150, y: rect.origin.y))
        //获取贝塞尔曲线的路径
        let animationPath = CAKeyframeAnimation.init(keyPath: "position")
        animationPath.path = path
        animationPath.rotationMode = CAAnimationRotationMode.rotateAuto
        
        //缩小图片到0
        let scale:CABasicAnimation = CABasicAnimation()
        scale.keyPath = "transform.scale"
        scale.toValue = 0.5
        
        //组合动画
        let animationGroup:CAAnimationGroup = CAAnimationGroup()
        animationGroup.animations = [animationPath,scale];
        animationGroup.duration = 0.8;
        animationGroup.fillMode = CAMediaTimingFillMode.forwards;
        animationGroup.isRemovedOnCompletion = false
        animationGroup.delegate = self
        lastSquar!.layer.add(animationGroup, forKey:
            nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let redview = self.viewArray.first
        redview?.isHidden = true
        self.viewArray.remove(at: 0)
        
    }
}
