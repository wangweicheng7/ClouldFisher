//
//  PWFilterView.swift
//  CloudFisher
//
//  Created by 王炜程 on 2017/2/14.
//  Copyright © 2017年 weicheng wang. All rights reserved.
//

import UIKit

class PWFilterView: UIView {
    
    var appid: Int?
    var version: String?
    
    let filterView = UIPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 0 ))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        filterView.delegate = self
        filterView.dataSource = self
        addSubview(filterView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension PWFilterView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    
}
