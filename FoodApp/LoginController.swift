//
//  LoginController.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/24/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var loginView: UIView!
    var scrollBanner = UIScrollView()
    var bgImageView : UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnLoginFb: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    let listImgName : [String] = ["introductionBackground1.png","introductionBackground2.png","introductionBackground3.png","introductionBackground4.png","introductionBackground5.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HiFb.configLoginButton(btnLoginFb)
        
    
        bgImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: AppSize.screenWidth, height: AppSize.screenHeight))
        view.addSubview(bgImageView)
        view.sendSubview(toBack: bgImageView)
        bgImageView.image = UIImage(named: "introductionBackground")
        self.scrollBanner.frame = view.bounds
        self.scrollBanner.delegate = self
        self.scrollBanner.backgroundColor = .clear
        self.view.addSubview(scrollBanner)
        
     
        let scrollBannerSubview : CGFloat = CGFloat(listImgName.count)
        self.pageControl.numberOfPages = listImgName.count
        scrollBanner.addSubview(dataForScrollBanner())
        scrollBanner.isPagingEnabled = true
        scrollBanner.showsHorizontalScrollIndicator = false
        scrollBanner.showsVerticalScrollIndicator = false
        scrollBanner.contentSize = CGSize(width: scrollBannerSubview*view.frame.size.width, height: view.frame.height)
        
        btnLogin.layer.cornerRadius = 10.0
        btnLogin.clipsToBounds = true
        
        view.bringSubview(toFront: loginView)
        


    }
    

    
    
    
    func dataForScrollBanner()->UIView
    {

         let contentView = UIView(frame:CGRect(x: 0, y: 0, width: self.view.frame.width * CGFloat(listImgName.count), height: view.frame.height))
        
        for i in 0...(listImgName.count - 1) {
            let index : CGFloat = CGFloat(i)
            let imageView = UIImageView(frame: CGRect(x: index * self.view.frame.width + 80, y: 110, width: AppSize.screenWidth - 160, height: AppSize.screenHeight - 220))
            contentView.addSubview(imageView)
            imageView.image = UIImage(named: listImgName[i])

        }
    
        return contentView
    }
    
    
    
    @IBAction func btnLoginFacebookDidTap(_ sender: Any) {
        HiFb.sharedInstance.loginFacebook(self)
    }
    
    
    
    @IBAction func btnLoginDidTap(_ sender: Any) {
        
        let loginAccount = LoginAccountController()
        loginAccount.modalTransitionStyle = .coverVertical
        self.present(loginAccount, animated: true, completion: nil)
        

        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
    }
    

}

extension LoginController : UIScrollViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x/scrollView.frame.size.width
        self.pageControl.currentPage = Int(page)
    }
}
