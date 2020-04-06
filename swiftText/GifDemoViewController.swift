//
//  GifDemoViewController.swift
//  swiftText
//
//  Created by jingjun on 2019/8/25.
//  Copyright © 2019 景军. All rights reserved.
//

import UIKit
import ImageIO
import MobileCoreServices

class GifDemoViewController: UIViewController {

    fileprivate var videoStorePath = ""
    fileprivate var soundPath = ""
    fileprivate var imgInputPath = ""
    fileprivate var watermarkPath: String?
    fileprivate var videoWidth = 480


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .blue
        
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        videoStorePath = (path as NSString).appendingPathComponent("videoRecord")
        soundPath = Bundle.main.path(forResource: "1-TheBlue", ofType: "mp3") ?? ""
        let imgInput = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        imgInputPath = (imgInput as NSString).appendingPathComponent("gifPath")
        
        try? FileManager.default.removeItem(atPath: videoStorePath)
        try? FileManager.default.createDirectory(atPath: videoStorePath, withIntermediateDirectories: true, attributes: nil)
        try? FileManager.default.removeItem(atPath: imgInputPath)
        self.decompositionGifImage()
    }
    func decompositionGifImage() {
        // 读取gif
        guard let gifPath = Bundle.main.path(forResource: "640", ofType: "gif") else {
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
            let imagePath = (endPath as NSString).appendingPathComponent("gif-\(String(format: "%03d", i)).png")
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.mobileffmpegcreateVideo()
    }
    
    func mobileffmpegcreateVideo() {
        
//        try? FileManager.default.createDirectory(atPath: framesStorePath, withIntermediateDirectories: true, attributes: nil)
        DispatchQueue.global().async { [weak self] in
            self?.createVideo()
        }
    }
    
    func createVideo() {
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd_HH-mm"
        let date = format.string(from: Date())
        let videoOutputPath = (self.videoStorePath as NSString).appendingPathComponent("\(date).mp4")
        
        let imageInputURL = (self.imgInputPath as NSString).appendingPathComponent("gif-%03d.png")
        
        MobileFFmpeg.execute("-framerate 10 -i \(imageInputURL) -i \(self.soundPath) -vcodec h264_videotoolbox \(self.watermarkPath == nil ? "-vf scale=\(self.videoWidth):-1" : "-vf movie=\(self.watermarkPath!)[watermark];[in]scale=\(self.videoWidth):-1[scale];[scale][watermark]overlay=main_w-overlay_w-5:main_h-overlay_h-5[out]") -b:v 5000k -y \(videoOutputPath)")
        
        let rc = MobileFFmpeg.getLastReturnCode()
        let output = MobileFFmpeg.getLastCommandOutput()
        
        if rc == RETURN_CODE_SUCCESS {
            print("video SUCCESS")
        }else if rc == RETURN_CODE_CANCEL {
            print("video CANCEL")
        }else{
            print(output ?? "error")
        }
        
        
    }

}
