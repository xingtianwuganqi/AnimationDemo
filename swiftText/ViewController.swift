//
//  ViewController.swift
//  swiftText
//
//  Created by 景军 on 2017/11/23.
//  Copyright © 2017年 景军. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gifView = GifDemoViewController()
        self.navigationController?.pushViewController(gifView, animated: true)
    }
}
