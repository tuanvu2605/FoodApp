//
//  Constants.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/24/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import Foundation

struct AppTitle {
    
    static let loginFacebook = "Đăng nhập với facebook"
    static let loginZalo = "Đăng nhập với Zalo"
    
}

struct AppSize {
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    
}

struct AppString {
    
    static let accessTokenPrefix  = "Bearer "
    static let currency = " VNĐ"
}

struct AppKey {
    static let udUserIdKey = "userid"
    static let udToken = "token"
    
}

struct AppImage {
    
    static let appIconImg = UIImage(named: "ICON.png")
}

struct AppUrl {
    static let baseUrl = "http://api.cleanhome.vn:8080/foodapp/"
    static let login = AppUrl.baseUrl + "auth/login"
    static let loginSocial = AppUrl.baseUrl + "auth/loginsocial"
    static let getAllCategory = AppUrl.baseUrl + "product/getallcategories"
    static let getProductInCategory = AppUrl.baseUrl + "product/getproductincategory"
    static let createOrder = AppUrl.baseUrl + "order/createorder"
    static let getOrder = AppUrl.baseUrl + "order/getallorder"
}
