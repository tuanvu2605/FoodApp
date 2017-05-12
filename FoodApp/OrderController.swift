//
//  OrderController.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/6/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import MBProgressHUD

class OrderController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let orderCellId = "orderCellId"
    static let shared = OrderController()
    var requestParam = [String : Any]()
    
    var listProductRequest : [[String : Any ]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Đặt hàng"
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        tableView.rowHeight = 90
        tableView.register(UINib(nibName: "OrderCell", bundle: nil), forCellReuseIdentifier: orderCellId)
        tableView.separatorStyle = .none
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "leftArrowGrey"), style: .plain, target: self, action: #selector(btnBackDidTap(_:)))

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnDoneDidTap(_ sender: Any) {
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        
        
        
        if requestParam["deliveryAddress"] == nil || requestParam["contactPhoneNumber"] == nil || requestParam["deliveryDate"] == nil  {
            hud.mode = .text
            hud.label.text = "Vui lòng điền đủ thông tin"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
               
                hud.hide(animated: true)
            }
            
            return
        }
        hud.mode = .indeterminate
        requestParam["description"] = "description"
        requestParam["listProductRequest"] = self.listProductRequest
        print(requestParam)
        API.createOrder(requestParam) { (status) in
            
            hud.mode = .text
            if status
            {
                hud.label.text = "Tạo đơn hàng thành công"
            }else
            {
               hud.label.text = "Tạo đơn hàng thất bại"
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
                hud.hide(animated: true)
            }
        }
        
      
        
        
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
            cell.type = .address
            cell.txtField.placeholder = "Hãy nhập địa chỉ..."
        case 1:
            cell.title.text = "Số điện thoại liên hệ"
            cell.type = .phoneNo
            cell.txtField.placeholder = "Hãy nhập số điện thoại..."
        case 2 :
            cell.title.text = "Ngày và giờ"
            cell.type = .time
            cell.txtField.placeholder = "Chạm để chọn thời gian"
        case 3 :
            cell.title.text = "Ghi chú về đơn hàng"
            cell.type = .note
            cell.txtField.placeholder = "Nhập ghi chú thêm..."
            
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
