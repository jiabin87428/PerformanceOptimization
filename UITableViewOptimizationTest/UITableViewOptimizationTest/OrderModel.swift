//
//  OrderModel.swift
//  UITableViewOptimizationTest
//
//  Created by 李家斌 on 2018/8/31.
//  Copyright © 2018年 李家斌. All rights reserved.
//

import Foundation

struct orderModel {
    // 订单号
    var orderNum = ""
    // 订单类型 0:板 1:地
    var orderType = 0
    // 供方公司
    var company = ""
    // 共几辆车
    var carNum = 0
    // 始发省
    var fromProv = ""
    // 始发城市
    var fromCity = ""
    // 目的地省
    var toProv = ""
    // 目的地城市
    var toCity = ""
}
