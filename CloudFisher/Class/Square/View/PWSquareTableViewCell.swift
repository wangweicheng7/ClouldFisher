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
            
            noteLabel.text  = _model?.msg
            
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
        infoView.layer.borderWidth = 1
        infoView.layer.borderColor = UIColor.darkGray.cgColor
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
//            let alert = UIAlertController(title: "提示", message: "下载失败，请重试", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "我知道了", style: .cancel, handler: nil))
            
        }
    }
}
