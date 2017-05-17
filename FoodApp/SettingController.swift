//
//  SettingController.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/17/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import FBSDKCoreKit

class SettingController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let settingCellId = "settingCellId"
    static let shared = SettingController()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: settingCellId)
        tableView.backgroundColor = .white
    }


}

extension SettingController : UITableViewDataSource , UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: settingCellId, for: indexPath)
        cell.imageView?.image = #imageLiteral(resourceName: "out")
        cell.textLabel?.text = "Đăng xuất"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            
            API.shared.userDefaults.removeObject(forKey: AppKey.udToken)
            FBSDKAccessToken.setCurrent(nil)
            appDelegate.setRootViewControllerForWindow(animated: false)
            
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
}
