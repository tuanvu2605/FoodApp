//
//  LoginAccountController.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/27/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class LoginAccountController: UIViewController {
    
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var btnLogin: UIButton!
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .white)
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appIcon.layer.cornerRadius = appIcon.frame.size.height/2
        appIcon.layer.borderColor = UIColor.green.cgColor
        appIcon.layer.borderWidth = 1
        appIcon.clipsToBounds = true
        appIcon.image = AppImage.appIconImg
        
        
        spinner.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
        spinner.center = CGPoint(x:  btnLogin.frame.size.width - 20, y:btnLogin.frame.size.height/2)
        btnLogin.layer.cornerRadius = 5
        btnLogin.clipsToBounds = true
        btnLoginStatus(false)
        self.btnLogin.addSubview(spinner)

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing()
    }

    @IBAction func btnDimissDidTap(_ sender: UIButton) {
        
        dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func btnLoginDidTap(_ sender: Any) {
        endEditing()
        spinner.startAnimating()
        API.login(txtUsername.text!, txtPassword.text!) { (status) in
            
            if status
            {
                appDelegate.setRootViewControllerForWindow(animated : true)
                return
            }
            self.spinner.stopAnimating()
        }
        
    }

}
extension LoginAccountController : UITextFieldDelegate
{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // check number of character in textfield to validate for login
        if (txtUsername.text?.characters.count)! > 6 && (txtPassword.text?.characters.count)! > 6 { btnLoginStatus(true) }
        return true
    }

    func btnLoginStatus(_ enable : Bool)
    {
        if enable {btnLogin.isUserInteractionEnabled = true ; btnLogin.backgroundColor = .blue ; return }
        btnLogin.backgroundColor = .lightGray ; btnLogin.isUserInteractionEnabled = false
    }
    
    func endEditing()
    {
        self.txtPassword.endEditing(true)
        self.txtUsername.endEditing(true)
    }
}
