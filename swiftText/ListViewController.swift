//
//  ListViewController.swift
//  swiftText
//
//  Created by jingjun on 2018/8/28.
//  Copyright © 2018年 景军. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    let imageView = UIImageView().then { (view) in
        view.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    }
    let imageV = UIImageView().then { (view) in
        view.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view.
        self.view.addSubview(imageView)
        self.view.addSubview(imageV)
        self.loadImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func loadImage() {
        let urlStr = "https://ssl-media.720static.com/@/115400/2/14568975829362493.png"
        var requeset = URLRequest.init(url: URL.init(string: urlStr)!)//Origin
        requeset.setValue("https://720yun.com", forHTTPHeaderField: "Origin")
        requeset.setValue("https://720yun.com", forHTTPHeaderField: "Referer")

        URLSession.shared.dataTask(with: requeset) { (datas, response, error) in
            guard error == nil else {
                return
            }
            guard let data = datas else {
                return
            }
            guard let image = UIImage.init(data: data) else {
                return
            }
            guard let contextImg = self.creataImage(image: image) else  {
                return
            }
            DispatchQueue.main.async {
                self.imageV.image = image
                self.imageView.image = contextImg
            }
        }.resume()
    }
    
    func creataImage(image: UIImage) -> UIImage? { // -> UIImage?
        let width = image.size.width
        let height = image.size.height + 20
        // 开启上下文
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, UIScreen.main.scale)
        
        // 获得上下文
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        context.setFillColor(UIColor.blue.cgColor)
        // 填充背景色
        context.fill(CGRect(x: 0, y: 0, width: width, height: height))
        // 画图片
        image.draw(at: CGPoint(x: 0, y: 0))
        // 画文字
        let attr = [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.3),NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        let text = "共产主义接班人"
        (text as NSString).draw(at: CGPoint(x: 0, y: height - 20), withAttributes: attr)
        
        let endImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return endImage
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let careplicator = CAReplicatorViewController()
        self.navigationController?.pushViewController(careplicator, animated: true)
    }

}
