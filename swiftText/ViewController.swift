//
//  ViewController.swift
//  swiftText
//
//  Created by 景军 on 2017/11/23.
//  Copyright © 2017年 景军. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tabelview:UITableView!
    
    var listArr = [ ["缩放动画","旋转动画","关键帧动画","关键帧实现抽奖大转盘","逐帧动画实现（定时器，CADisplayLink，Draw）","基于CADisplayLink 逐帧动画","基于draw 方法 逐帧动画","gif 动画的分解","gif 动画的合成"],["位置动画","缩放动画","旋转动画","位移动画","圆角动画","边框动画","颜色渐变","边框颜色渐变","淡入淡出动画","阴影渐变动画","CAKeyframeAnimation  淡入淡出动画","任意路径动画","动画组合","按钮波纹动画","登录按钮动画效果"],["粒子鬼火动画","粒子霓虹灯动画","光波扫描效果","音响音量跳动效果","贝赛尔曲线","动态折线图与动态柱状图"],["恒星旋转动画","音量跳动动画效果"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let table:UITableView = UITableView.init(frame: self.view.frame,style: .grouped)
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = .white
        table.register(UITableViewCell.self, forCellReuseIdentifier: "tableviewcell")
        table.estimatedRowHeight = 0
        table.estimatedSectionFooterHeight = 0
        table.estimatedSectionHeaderHeight = 0
        
        self.view.addSubview(table);

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return listArr.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return listArr[0].count
        case 1:
            return listArr[1].count
        case 2:
            return listArr[2].count
        case 3:
            return listArr[3].count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = listArr[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "显示层动画"
        case 1:
            return "内容层动画"
        case 2:
            return "内容层动画"
        case 3:
            return "内容层动画"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let homepage = HomePageController()
            homepage.section = indexPath.section
            homepage.row  = indexPath.row
            homepage.title = listArr[indexPath.section][indexPath.row]
            self.navigationController?.pushViewController(homepage, animated: true)
        case 1:
            switch indexPath.row {
            case 14:
                let user = UserInfoController()
                self.navigationController?.pushViewController(user, animated: true)
            default:
                let homepage = HomePageController()
                homepage.section = indexPath.section
                homepage.row  = indexPath.row
                homepage.title = listArr[indexPath.section][indexPath.row]
                self.navigationController?.pushViewController(homepage, animated: true)
            }
        case 2:
           
            let emitter = CAEmitterCellViewController()
            emitter.row = indexPath.row
            self.navigationController?.pushViewController(emitter, animated: true)
            
        case 3:
            let careplicator = CAReplicatorViewController()
            careplicator.row = indexPath.row
            self.navigationController?.pushViewController(careplicator, animated: true)
        default:
            return
        }
    }
}
