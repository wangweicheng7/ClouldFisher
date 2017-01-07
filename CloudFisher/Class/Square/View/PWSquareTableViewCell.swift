//
//  PWSquareTableViewCell.swift
//  firimer
//
//  Created by 王炜程 on 2016/11/29.
//  Copyright © 2016年 wangweicheng. All rights reserved.
//

import UIKit

class PWSquareTableViewCell: UITableViewCell {

    class func IdeSquareTableViewCell() -> String {
        return "PWSquareTableViewCellIdentify"
    }
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var buildLabel: UILabel!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func installAction(_ sender: Any) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
