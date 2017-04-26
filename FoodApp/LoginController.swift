//
//  LoginController.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/24/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    var scrollBanner = UIScrollView()
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnLoginFb: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HiFb.configLoginButton(btnLoginFb)
        self.scrollBanner.frame = view.bounds
        self.scrollBanner.delegate = self
        self.scrollBanner.backgroundColor = .red
        self.view.addSubview(scrollBanner)
        view.sendSubview(toBack: scrollBanner)
     
        let scrollBannerSubview : CGFloat = 2
        self.pageControl.numberOfPages = 2
        scrollBanner.addSubview(dataForScrollBanner())
        scrollBanner.isPagingEnabled = true
        scrollBanner.showsHorizontalScrollIndicator = false
        scrollBanner.showsVerticalScrollIndicator = false
        scrollBanner.contentSize = CGSize(width: scrollBannerSubview*view.frame.size.width, height: view.frame.height)

    }
    
    override func viewWillLayoutSubviews() {
       
        
        
    }
    
    
    
    func dataForScrollBanner()->UIView
    {

         let contentView = UIView(frame:CGRect(x: 0, y: 0, width: self.view.frame.width*2, height: view.frame.height))
        let listImgName : [String] = ["1.jpg","2.jpg"]
        for i in 0...1 {
            let index : CGFloat = CGFloat(i)
            let imageView = UIImageView(frame: CGRect(x: index * self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height))
            contentView.addSubview(imageView)
            imageView.image = UIImage(named: listImgName[i])

        }
    
        return contentView
    }
    
    
    
    @IBAction func btnLoginFacebookDidTap(_ sender: Any) {
        HiFb.sharedInstance.loginFacebook(self)
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
