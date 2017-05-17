//
//  CartController.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/4/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import SDWebImage
import DZNEmptyDataSet

class CartController: UIViewController {
    
    static let shared = CartController()
    var listItemDidChangeValue = ({(count : Int) -> Void in
    })
    var listItem = [CartProduct]()
    {
        didSet
        {
            self.listItemDidChangeValue(listItem.count)
        }
    }
    let cartProductCellId = "cartProductCellId"
    @IBOutlet weak var moneyToPay: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Giỏ hàng"
        tableView.rowHeight = 90
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.register(UINib(nibName: "CartProductCell", bundle: nil), forCellReuseIdentifier: cartProductCellId)
        tableView.separatorStyle = .none
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "arrowDownBlue"), style: .plain, target: self, action: #selector(btnDimissDidTap))
        
    }
    
    func btnDimissDidTap()
    {
        dismiss(animated: false, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateMoneyToPay()
        tableView.reloadData()
    }
    
    

    @IBAction func btnOrderDidTap(_ sender: Any) {
        
        
        if listItem.count == 0 {
            return
        }
        
        let listProductRequest : [[String : Int]] = listItem.map({(cartProduct : CartProduct) in
            
            return ["productId" : cartProduct.product.productId , "orderQuantity" : cartProduct.count ]
            
        })
        
        print(listProductRequest)
        
        let orderController = OrderController.shared
        orderController.listProductRequest = listProductRequest
        navigationController?.pushViewController(orderController, animated: true)
        
        
        
    }
    
     func updateMoneyToPay()
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
extension CartController : UITableViewDelegate , UITableViewDataSource ,DZNEmptyDataSetSource ,DZNEmptyDataSetDelegate
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listItem.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cartProductCellId, for: indexPath) as! CartProductCell
        cell.type = .cart
        cell.selectionStyle = .none
        let cartProduct = listItem[indexPath.section]
        cell.stepperChangeValue = ({(value) in
            cartProduct.count = value
            self.updateMoneyToPay()
        })
        cell.display_(cartProduct)
       
        return cell
 
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 15.0
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        
        let text = "Giỏ hàng trống"
        let attributes = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 18) , NSForegroundColorAttributeName : UIColor.lightGray]
        return NSAttributedString(string: text, attributes: attributes)
        
    }

}

