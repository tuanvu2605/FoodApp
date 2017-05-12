//
//  API.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/27/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import Alamofire

class API: NSObject {
    
    static let shared = API ()
    var userDefaults : UserDefaults
    var headerAuth = [String:String]()
    
    override init() {
        
        self.userDefaults = UserDefaults.standard
    }
    /**
     
     - parameter username : value of username textfield is account of member
     - parameter password : value of password textfield is password of member
     - parameter loginStatus : is callback when handler reponse from sever 
     - parameter status : is status of login
     
     
     ## FUNC DO :
     1. prameter username , password is part of parameters http request with post method  with body encoding type json 
     2. handle responding from server 
     3. check response is fail or success if fail print error desciption and send callback with status fail for where implement func else success login in app (change windows app root controller) and send callback
     
     
     */
    
    static func login(_ username : String , _ password : String , _ loginStatus: @escaping(_ status : Bool)->Void)
    {
        let params : [String : String] = ["username":username , "password" : password]
        Alamofire.request(AppUrl.login, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { res in
            
           
            
            API.shared.handleLoginResponse(res, { (value) in
                loginStatus(value)
            })
            
            
        }
    }
    
    static func loginSocial(_ userId : String , _ accessToken : String ,_ loginStatus: @escaping(_ status : Bool)->Void )
    {
        let params : [String : String] = ["id" : userId , "accessToken" : accessToken]
        Alamofire.request(AppUrl.loginSocial, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { (res) in
            
            print(res)
            API.shared.handleLoginResponse(res, { (value) in
                loginStatus(value)
            })
            
        }
    }
    
    
    static func getAllCategory(_ completion :@escaping(_ status : Bool , _ categories : [[String : Any]])->Void)
    {
        print(API.shared.headerAuth)
        Alamofire.request(AppUrl.getAllCategory, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: API.shared.headerAuth).responseJSON { (res) in
            
           
            switch res.result
            {
            case .failure:
                completion(false,[[String : Any]]())
            case .success(let data):
                let dict = data as! [String : Any]
                let listCateDict : [[String : Any]] = dict["result"] as! [[String : Any]]
                completion(true,listCateDict)
            }
            
           
        }
    }
    
    
    static func getProductOfCategory(_ id : Int , _ offset : Int , limit : Int , _ completion :@escaping(_ status : Bool , _ products : [[String : Any]])->Void){
        
        let params = ["catid":id , "offset" : offset , "maxresult" : limit]
        Alamofire.request(AppUrl.getProductInCategory, method: .get, parameters: params, encoding:URLEncoding.default, headers: API.shared.headerAuth).responseJSON { (res) in
            
            switch res.result
            {
            case .failure:
                completion(false , [[String:Any]]())
            case .success(let value):
                let dict  = value as! [String : Any]
                let products : [[String : Any]] = dict["result"] as! [[String : Any]]
                completion(true,products)
            }
            
        }
    }
    
    static func getOrder(_ completion :@escaping(_ status : Bool , _ products : [[String : Any]])->Void)
    {
        
        Alamofire.request(AppUrl.getOrder, method: .get, parameters: nil, encoding: URLEncoding.default, headers: API.shared.headerAuth).responseJSON { (res) in
            
            switch res.result
            {
            case .failure(let err):
                print(err)
                completion(false , [[String:Any]]())
            case .success(let value):
                let dict  = value as! [String : Any]
               guard let listOrder : [[String : Any]] = dict["result"] as? [[String : Any]] else
                {
                    return
                }
                completion(true,listOrder)
                
            }
            
            
        }
        
    }
    
    
    static func createOrder(_ param : [String : Any],_ completion :@escaping(_ status : Bool)->Void )
    {
        Alamofire.request(AppUrl.createOrder, method: .post, parameters: param, encoding: JSONEncoding.default, headers:API.shared.headerAuth).responseJSON { (res) in
            switch res.result
            {
            case.failure(let err):
                print(err)
                completion(false)
            case .success(let value):
                let dict = value as! [String : Any]
                let success_  = dict["success"] as! NSNumber
                print(success_)
                if  success_.intValue == 1
                {
                    completion(true)
                    return
                }
                completion(false)
            }
        }
    }
    

}

extension API
{
    /**
     
     - parameter token : is Token received from request
     ## func do
     1. set value for headerAuth to user for requests after
     2. use UserDefault api to save to local
     */
    
    func saveUserInfo(_ token : String)
    {
        headerAuth = ["Authorization" : AppString.accessTokenPrefix + token]
        API.shared.userDefaults.set(token, forKey: AppKey.udToken)
        API.shared.userDefaults.synchronize()
        
    }

    /**
     
     - returns : value of existence of login token used for question user has logged in app (true : exist false : not )
     
     */
    
    func isHasloginToken() ->Bool
    {
        return (API.shared.userDefaults.value(forKey: AppKey.udToken) != nil)
    }
    
    func handleLoginResponse(_ res : DataResponse<Any> , _ loginStatus: @escaping(_ status : Bool)->Void)
    {
        switch res.result
        {
        case .failure(let err):
            
            loginStatus(false)
            print("login error : \(err)")
        case .success(let value):
            
            let dict = value as! [String : Any]
            let success_  = dict["success"] as! NSNumber
            print(success_)
            if  success_.intValue == 1
            {
                API.shared.saveUserInfo((dict["result"])! as! String)
                loginStatus(true)
                
                return
            }
            loginStatus(false)
            
            
        }
    }
}
