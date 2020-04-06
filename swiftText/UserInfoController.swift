//
//  UserInfoController.swift
//  swiftText
//
//  Created by jingjun on 2018/8/28.
//  Copyright © 2018年 景军. All rights reserved.
//

import UIKit

class UserInfoController: UIViewController {
    
    var singleTap1: UITapGestureRecognizer?
    var singleTap2: UITapGestureRecognizer?
    var singleTap3: UITapGestureRecognizer?
    var buttonview1 : ButtonView?
    var buttonview2 : ButtonView?
    var buttonview3 : ButtonView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        buttonview1 = ButtonView(frame: CGRect(x: 100, y: 150, width: 210, height: 70))
        buttonview2 = ButtonView(frame: CGRect(x: 100, y: 275, width: 210, height: 70))
        buttonview3 = ButtonView(frame: CGRect(x: 100, y: 400, width: 210, height: 70))
        
        singleTap1 = UITapGestureRecognizer(target: self, action: #selector(viewAction1))
        singleTap2 = UITapGestureRecognizer(target: self, action: #selector(viewAction2))
        singleTap3 = UITapGestureRecognizer(target: self, action: #selector(viewAction3))

        buttonview1?.addGestureRecognizer(singleTap1!)
        buttonview2?.addGestureRecognizer(singleTap2!)
        buttonview3?.addGestureRecognizer(singleTap3!)
        
        self.view.addSubview(buttonview1!)
        self.view.addSubview(buttonview2!)
        self.view.addSubview(buttonview3!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func viewAction1() {
        buttonview1?.startAnimation()
    }

    @objc func viewAction2() {
        buttonview2?.startAnimation()
    }
    
    @objc func viewAction3() {
        buttonview3?.startAnimation()
    }
}
