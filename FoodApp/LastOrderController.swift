//
//  LastOrderController.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/8/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class LastOrderController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cartProductCellId = "cartProductCellId"
    var listItem = [CartProduct]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 90
        tableView.register(UINib(nibName: "CartProductCell", bundle: nil), forCellReuseIdentifier: cartProductCellId)
        tableView.separatorStyle = .none
        
        let back = UIBarButtonItem(image: #imageLiteral(resourceName: "leftArrowGrey"), style: .done, target: self, action: #selector(backButtonDidTap(_:)))
        self.navigationItem.leftBarButtonItem = back

        // Do any additional setup after loading the view.
    }
    func backButtonDidTap(_ sender : UIBarButtonItem)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }



}

extension LastOrderController : UITableViewDelegate , UITableViewDataSource
{

    func numberOfSections(in tableView: UITableView) -> Int {
        return listItem.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cartProductCellId, for: indexPath) as! CartProductCell
        
        let cartProduct = listItem[indexPath.section]
        cell.type = .order
        cell.display_(cartProduct)
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 15.0
    }
    
}

