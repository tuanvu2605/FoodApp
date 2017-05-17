//
//  HistoryOrderController.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/8/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import CarbonKit

class HistoryOrderController: BaseController {
    
    static let shared = HistoryOrderController()
    var tableView : UITableView!
    let listOrderCelId = "listOrderCelId"
    let placeholderCellId = "placeholderCellId"
    var listOrder = [Order]()
    
    var isCompleteLoadData = false
    var didSelectedCell = ({(listProduct : [CartProduct])-> Void in
    })

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = .white
        tableView = UITableView(frame: self.view.bounds, style: .grouped)
        tableView.register(UINib(nibName: "ListOrderCell", bundle: nil), forCellReuseIdentifier: listOrderCelId)
        tableView.register(UINib(nibName: "ListOrderPlaceholderCell", bundle: nil), forCellReuseIdentifier: placeholderCellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 110
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        self.view.addSubview(tableView)
        var items = [String]()
        
        API.getOrder { (status, listOrder) in
            
            if status == false { return }
            for dict : [String : Any] in listOrder
            {
                let order = Order(dict)
                self.listOrder.append(order)
                items.append("\(order.orderId)")
            }
            self.isCompleteLoadData = true
            self.tableView.reloadData()
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    


}

extension HistoryOrderController : UITableViewDelegate , UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
       
        return isCompleteLoadData ? listOrder.count : 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if !isCompleteLoadData {
            let cell = tableView.dequeueReusableCell(withIdentifier: placeholderCellId, for: indexPath) as! ListOrderPlaceholderCell
            cell.selectionStyle = .none
            cell.displayPlaceholder()
            return cell
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: listOrderCelId, for: indexPath) as! ListOrderCell
        let order = listOrder[indexPath.section]
        cell.display_(order)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let order = listOrder[indexPath.section]
        self.didSelectedCell(order.listProduct)
        if !isCompleteLoadData {return}
        
    }
}


