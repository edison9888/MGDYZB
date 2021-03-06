//
//  CollectionPrettyCell.swift
//  MGDYZB
//
//  Created by ming on 16/10/26.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class CollectionPrettyCell: UICollectionViewCell {

    // MARK:- 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var nickNameBtn: UIButton!
    @IBOutlet weak var cityBtn: UIButton!
    
    // MARK:- 定义模型
    var anchor : AnchorModel? {
        didSet {
            // 0.校验模型是否有值
            guard let anchor = anchor else { return }
            
            // 1.取出在线人数显示的文字
            var onlineStr : String = ""
            if anchor.online >= 10000 {
                onlineStr = "\(anchor.online/10000)万人在线"
            } else {
                onlineStr = "\(anchor.online)人在线"
            }
            onlineBtn.setTitle(onlineStr, forState: .Normal)
            
            // 2.昵称的显示
            nickNameBtn.setTitle(anchor.nickname, forState: .Normal)
            
            // 3.设置封面图片
            guard let iconURL = NSURL(string: anchor.vertical_src) else { return }
            iconImageView.kf_setImageWithURL(iconURL)
            
            // 4.设置位置(所在的城市)
            cityBtn.setTitle(anchor.anchor_city, forState: .Normal)
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.layer.cornerRadius = 5
        iconImageView.clipsToBounds = true
    }
}
