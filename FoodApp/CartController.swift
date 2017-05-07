//
//  CartController.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/4/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import SDWebImage

class CartController: BaseController {
    
    static let shared = CartController()
    var listItem = [CartProduct]()
    let cartProductCellId = "cartProductCellId"
    @IBOutlet weak var moneyToPay: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 90
        tableView.register(UINib(nibName: "CartProductCell", bundle: nil), forCellReuseIdentifier: cartProductCellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateMoneyToPay()
        tableView.reloadData()
    }
    
    

    @IBAction func btnOrderDidTap(_ sender: Any) {
        
        let orderController = OrderController()
        navigationController?.pushViewController(orderController, animated: true)
        
        
    }
    
    private func updateMoneyToPay()
    {
        var money = 0
        for cartProduct in listItem
        {
            money += cartProduct.product.price * cartProduct.count
            
        }
        
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        
        self.moneyToPay.text = fmt.string(from: NSNumber(value: money))! + AppString.currency
    }



}
extension CartController : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  listItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cartProductCellId, for: indexPath) as! CartProductCell
        let cartProduct = listItem[indexPath.row]
        cell.display_(cartProduct)
       
        return cell
 
    }

}
