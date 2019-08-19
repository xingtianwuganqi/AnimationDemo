//
//  TabbarViewController.swift
//  swiftText
//
//  Created by 景军 on 2017/11/26.
//  Copyright © 2017年 景军. All rights reserved.
//

import UIKit

class TabbarViewController: UITabBarController {

    //重写init方法
//    var param:String?
    
    init() {
    super.init(nibName: nil, bundle: nil)

        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for:UIControl.State.normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], for:UIControl.State.selected)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChildViewControl(control: HomePageController.init(), titleText: "首页", image: "tabbar_home", selectImg: "tabbar_home_highlighted")
        self.addChildViewControl(control: ListViewController.init(), titleText: "图表", image: "tabbar_message_center", selectImg: "tabbar_message_center_highlighted")
        self.addChildViewControl(control: UserInfoController.init(), titleText: "个人中心", image: "tabbar_profile", selectImg: "tabbar_profile_highlighted")
        
        self.addChildViewControl(control: CAEmitterCellViewController.init(), titleText: "动画", image: "tabbar_profile", selectImg: "tabbar_profile_highlighted")
        
        self.tabBar.backgroundColor = UIColor.white
        
    }
    func addChildViewControl(control:UIViewController, titleText:String, image:String,selectImg:String) {
        
        control.tabBarItem.title = titleText
        control.tabBarItem.image = UIImage.init(named: image)
        control.tabBarItem.selectedImage = UIImage.init(named: selectImg)
        control.navigationItem.title = titleText
        let navigation = YUNNavigationController(rootViewController: control)
        navigation.navigationBar.barTintColor = UIColor.white
        navigation.navigationBar.tintColor = .black
        
        
        self.addChild(navigation)

        
    }
    
    @objc func backClick(navi:UINavigationController) {
        navi.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
