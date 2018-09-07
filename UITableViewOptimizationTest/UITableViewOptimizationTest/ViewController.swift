//
//  ViewController.swift
//  UITableViewOptimizationTest
//
//  Created by 李家斌 on 2018/8/30.
//  Copyright © 2018年 李家斌. All rights reserved.
//

import UIKit

let celCount = 100
let rowHeight = 120

let myCellIdentifier = "XibCell"

class ViewController: UITableViewController {
    
    // 订单列表
    lazy var orderList : Array<orderModel> = {
        return Array<orderModel>()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // 只能用于10.4以上系统
        let sysVersion = UIDevice.current.systemVersion.replacingOccurrences(of: ".", with: "")
        if Int(sysVersion)! > 1031 {
            KMCGeigerCounter.shared().isEnabled = true
        }
        self.loadData()
        
        tableView.backgroundColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 244/255.0, alpha: 1)
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: myCellIdentifier, bundle: nil), forCellReuseIdentifier: myCellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// MARK: 数据
extension ViewController {
    func loadData() {
        for i in 0...celCount {
            var mod = orderModel()
            mod.orderNum = "CSDD\(100000000+i)"
            mod.orderType = 0
            mod.company = "测试物流公司\(i)"
            mod.carNum = 10+i
            mod.fromProv = "上海"
            mod.fromCity = "上海市"
            mod.toProv = "北京"
            mod.toCity = "北京市"
            self.orderList.append(mod)
        }
    }
}

// MARK: UITableView
extension ViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(rowHeight)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myCellIdentifier, for: indexPath) as! XibCell
        cell.bindOrderInfo(orderModel: self.orderList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

