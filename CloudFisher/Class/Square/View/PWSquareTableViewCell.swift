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
    
    fileprivate var _model: PWAppInfoModel?
    
    var model: PWAppInfoModel? {
        get {
            return _model
        }
        set (m) {
            _model = m
            if let build = _model?.build {
                buildLabel.text = "\(build)"
            }
            
            if let version = _model?.version {
                versionLabel.text = "\(version)"
            }
            
            if let type = _model?.type {
                typeLabel.text = (type == 1) ? " 测试版 " : " 线上版 " // 边距用空格占位
            }
            
            if let time = _model?.create_time {
                
                let date = Date(timeIntervalSince1970: time)
                let formatter = DateFormatter()
                formatter.dateFormat = "HH:mm MM.dd"
                timeLabel.text = formatter.string(from: date)
            }
            
            
            noteLabel.text  = _model?.note
            
        }
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
        infoView.layer.cornerRadius = 3
        infoView.layer.masksToBounds = true
    }

    @IBAction func installAction(_ sender: Any) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func downloadAction(_ sender: UIButton) {
        
        guard let name = model?.name else {
            print("文件名为空")
            return
        }
        
        
        let urlString = "itms-services://?action=download-manifest&url=" + Api.baseUrl + Api.file + (model?.name)! + ".plist"
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.openURL(url)
        }else{
            print("下载失败")
        }
    }
}
