//
//  ProductInfoController.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/3/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import GMStepper


enum ProductInfoKey {
    case productName
}

class ProductInfoController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var btnDismiss: UIButton!
    var cartProdcut = CartProduct()

    @IBOutlet weak var tableView: UITableView!
    
    var product : Product!
    {
        didSet
        {
            cartProdcut.product = product
        }
    }
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var stepper: GMStepper!
    private var checkCartProductExistedInCart = false
    let productInfoCellId = "productInfoCellId"
    
    var productInfo = [(key : String , value: String?)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imgView = UIImageView(frame: self.scrollView.bounds)
        imgView.sd_setImage(with: URL(string: product.imageURL))
        scrollView.addSubview(imgView)
        scrollView.isPagingEnabled = true
        scrollView.contentSize = scrollView.frame.size
        productName.text = product.productName
        Utils.gradient(view: headerView, alphaStart: 0.6, alphaEnd: 0.0, colorStart: .black, colorEnd: .black)
        stepper.cornerRadius = 0.0
        
        
        if CartController.shared.listItem.contains(where: { $0.product == product}) {
            
            cartProdcut = CartController.shared.listItem.first(where: {$0.product == product})!
            stepper.value = Double(cartProdcut.count)
            checkCartProductExistedInCart = true
        }
        
        
        tableView.rowHeight = 50
        tableView.register(UINib(nibName: "ProductInfoCell", bundle: nil), forCellReuseIdentifier: productInfoCellId)
        
        productInfo = [("Tên sản phẩm" , product.productName) , ("Nơi sản xuất" , product.madeIn) , ("Mô tả" , product.des),("Giá" , Utils.formatNumberCurrency(NSNumber(value: product.price)))]
        
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        if !checkCartProductExistedInCart && stepper.value > 0 {
            
            cartProdcut.count = Int(stepper.value)
            CartController.shared.listItem.append(cartProdcut)
            
        }
        
        if stepper.value == 0 && checkCartProductExistedInCart
        {
            let index = CartController.shared.listItem.index(where: { $0.product == cartProdcut.product})
            CartController.shared.listItem.remove(at: index!)
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    @IBAction func stepperChangeValue(_ sender: GMStepper) {
        
        cartProdcut.count = Int(sender.value)
    }
    
    


    @IBAction func btnDismissDidTap(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
    }
}
extension ProductInfoController : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: productInfoCellId) as! ProductInfoCell
        
        let info = productInfo[indexPath.row]
        cell.infoName.text = info.key
        cell.value.text = info.value
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.000001
    }
}
