//
//  IndexCell.swift
//  LSFinanceSwift
//
//  Created by zhaohongbin on 2018/12/24.
//  Copyright © 2018 zhaohongbin. All rights reserved.
//

import UIKit

class IndexCell: UITableViewCell {

    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var rateYearLb: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
