//
//  OrderController.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/6/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class OrderController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let orderCellId = "orderCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.rowHeight = 90
        tableView.register(UINib(nibName: "OrderCell", bundle: nil), forCellReuseIdentifier: orderCellId)
        tableView.separatorStyle = .none

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnDoneDidTap(_ sender: Any) {
        
        
    }
    
    
    @IBAction func btnBackDidTap(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }

   

}

extension OrderController : UITableViewDataSource , UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: orderCellId, for: indexPath) as! OrderCell
        cell.selectionStyle = .none
        
        switch indexPath.section {
        case 0:
            cell.title.text = "Địa chỉ của bạn"
        case 1:
            cell.title.text = "Số điện thoại liên hệ"
        case 2 :
            cell.title.text = "Ngày và giờ"
        case 3 :
            cell.title.text = "Ghi chú về đơn hàng"
            
        default:
            print("out of index")
            
        }
        cell.display_()
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0
        {
            return "Địa chỉ nhận"
        }
        if section == 1
        {
            return "Số điện thoại"
        }
        
        if section == 2
        {
            return "Thời gian nhận"
        }
        if section == 3
        {
            return "ghi chú"
        }
        
        return ""
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
}
