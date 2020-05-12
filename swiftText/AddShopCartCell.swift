//
//  AddShopCartCell.swift
//  swiftText
//
//  Created by jingjun on 2020/5/12.
//  Copyright © 2020 景军. All rights reserved.
//

import UIKit

class AddShopCartCell: UITableViewCell {
    
    @IBOutlet weak var addButton: UIButton!
    
    var indexpath: IndexPath?
    var clickAction : ((_ index: Int) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        
    }

    @IBAction func addClickAction(_ sender: Any) {
        guard let index = indexpath?.row else {
            return
        }
        self.clickAction?(index)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
