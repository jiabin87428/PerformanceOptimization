//
//  XibCell.swift
//  UITableViewOptimizationTest
//
//  Created by 李家斌 on 2018/8/30.
//  Copyright © 2018年 李家斌. All rights reserved.
//

import UIKit

class XibCell: UITableViewCell {
    // 容器背景View
    @IBOutlet weak var bgView: UIView!
    // 调度单号
    @IBOutlet weak var orderNumLabel: UILabel!
    // 订单类型背景图
    @IBOutlet weak var typeImgView: UIImageView!
    // 订单类型
    @IBOutlet weak var typeLabel: UILabel!
    // 供方公司
    @IBOutlet weak var companyLabel: UILabel!
    // 共几辆车
    @IBOutlet weak var carNumLabel: UILabel!
    // 始发省
    @IBOutlet weak var fromProv: UILabel!
    // 始发城市
    @IBOutlet weak var fromCity: UILabel!
    // 目的地省
    @IBOutlet weak var toProv: UILabel!
    // 目的地城市
    @IBOutlet weak var toCity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 让bgView立即根据约束进行布局
        bgView.layoutIfNeeded()
        
        self.setCorner()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bindOrderInfo(orderModel: orderModel) {
        self.orderNumLabel.text = orderModel.orderNum
        self.typeLabel.text = orderModel.orderType == 0 ? "板" : "地"
        self.companyLabel.text = orderModel.company
        self.carNumLabel.text = "\(orderModel.carNum)"
        self.fromProv.text = orderModel.fromProv
        self.fromCity.text = orderModel.fromCity
        self.toProv.text = orderModel.toProv
        self.toCity.text = orderModel.toCity
    }
    
    func setCorner() {
        // 设置背景阴影
//        bgView.layer.shadowColor = UIColor(red: 204/255.0, green: 204/255.0, blue: 204/255.0, alpha: 1).cgColor
//        bgView.layer.shadowOpacity = 0.5
//        bgView.layer.shadowOffset = CGSize.zero
//        bgView.layer.shadowRadius = 5
        // 设置圆角
        let corners: UIRectCorner = [.topRight, .bottomLeft, .bottomRight]
        self.corner(view: bgView, corners: corners, radii: 10.0)
    }
    
    /// 部分圆角
    ///
    /// - Parameters:
    ///   - corners: 需要实现为圆角的角，可传入多个
    ///   - radii: 圆角半径
    func corner(view: UIView, corners: UIRectCorner, radii: CGFloat) {
        guard view.layer.sublayers![0].value(forKey: "key") == nil else {
            return
        }
        
        let maskPath = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.setValue("myLayer", forKey: "key")
        maskLayer.frame = view.bounds
        maskLayer.path = maskPath.cgPath
//        view.layer.mask = maskLayer
        
        maskLayer.shadowColor = UIColor.lightGray.cgColor
        maskLayer.shadowOpacity = 0.5
        maskLayer.shadowOffset = CGSize.zero
//        maskLayer.shadowRadius = 5
        let path = UIBezierPath(roundedRect: view.bounds, cornerRadius: 5).cgPath
        maskLayer.shadowPath = path
        
        maskLayer.fillColor = UIColor.white.cgColor
        view.layer.insertSublayer(maskLayer, at: 0)
    }
}
