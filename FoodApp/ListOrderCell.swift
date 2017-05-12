//
//  ListOrderCell.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/9/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class OrderImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentMode = .scaleAspectFill
//        self.layer.borderColor = UIColor.white.cgColor
//        self.layer.borderWidth = 3
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
       
        fatalError("init(coder:) has not been implemented")
    }
    
}



class ListOrderCell: UITableViewCell {

    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var value: UILabel!
 
    @IBOutlet weak var listImageView: UIView!
    
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnDone: UIButton!
    
    
    var listImageUrl : [String?]!
    {
        didSet
        {
            displayListImage()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnDone.isHidden = true
        btnCancel.isHidden = true
        
        listImageView.layer.borderColor = UIColor.white.cgColor
        listImageView.layer.cornerRadius = listImageView.frame.size.width/2
        listImageView.clipsToBounds = true
        listImageView.layer.masksToBounds = true
        
        
        
        
    }
    
    
    func display_(_ order : Order)
    {
        self.listImageUrl = order.listProduct.map({ (product : CartProduct) in
            
            return product.product.imageURL
        })
        address.text = order.deliveryAddress
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MM-yyyy"
        let numFmt = NumberFormatter()
        numFmt.numberStyle =  .decimal
        let date = Date(timeIntervalSince1970:order.deliveryDate/1000)
        time.text = dateFormater.string(from: date)
        value.text = numFmt.string(from: NSNumber(value: order.orderPrice))! + AppString.currency
        
    }
    
    func displayListImage()
    {
        
        let parentViewWidth = listImageView.frame.size.width
        let parentViewHeight = listImageView.frame.size.height
        
        print("width \(parentViewWidth) , heigth : \(parentViewHeight)")
        if listImageUrl.count == 1
        {
            let imageView = OrderImageView(frame: listImageView.bounds)
            listImageView.addSubview(imageView)
            imageView.sd_setImage(with: URL(string: listImageUrl[0]!))
        }
        if listImageUrl.count == 2
        {
            
           
            let imageView = OrderImageView(frame: CGRect(x: 0 , y: 0 , width: parentViewWidth/2, height: parentViewHeight))
            listImageView.addSubview(imageView)
            imageView.sd_setImage(with: URL(string: listImageUrl[0]!))
            
            let imageView2 = OrderImageView(frame: CGRect(x: (parentViewWidth/2) , y: 0 , width: parentViewWidth/2, height: parentViewHeight))
            listImageView.addSubview(imageView2)
            imageView2.sd_setImage(with: URL(string: listImageUrl[1]!))
            
        }
        
        if listImageUrl.count == 3
        {
            print("width/2 = \(parentViewHeight/2)")
            let imageView1 = OrderImageView(frame: CGRect(x:0 , y: 0, width: parentViewWidth/2, height: parentViewHeight/2))
            listImageView.addSubview(imageView1)
            imageView1.sd_setImage(with: URL(string: listImageUrl[0]!))
            
            let imageView2 = OrderImageView(frame: CGRect(x:0 , y: parentViewWidth/2, width: parentViewWidth/2, height: parentViewHeight/2))
            listImageView.addSubview(imageView2)
            imageView2.sd_setImage(with: URL(string: listImageUrl[1]!))
            
            let frame3 = CGRect(x: parentViewWidth/2, y: 0, width: parentViewWidth/2, height: parentViewHeight)
            let imageView3 = OrderImageView(frame: frame3)
            listImageView.addSubview(imageView3)
            imageView3.sd_setImage(with: URL(string: listImageUrl[2]!))
            
            
        }
        
        if listImageUrl.count >= 4 {
            
            let imageView1 = OrderImageView(frame: CGRect(x:0 , y: 0, width: parentViewWidth/2, height: parentViewHeight/2))
            listImageView.addSubview(imageView1)
            imageView1.sd_setImage(with: URL(string: listImageUrl[0]!))
            
            let imageView2 = OrderImageView(frame: CGRect(x:0 , y: parentViewWidth/2, width: parentViewWidth/2, height: parentViewHeight/2))
            listImageView.addSubview(imageView1)
            imageView2.sd_setImage(with: URL(string: listImageUrl[1]!))
            
            let frame3 = CGRect(x: parentViewWidth/2, y: 0, width: parentViewWidth/2, height: parentViewHeight/2)
            let imageView3 = OrderImageView(frame: frame3)
            listImageView.addSubview(imageView3)
            imageView3.sd_setImage(with: URL(string: listImageUrl[2]!))
            
            let frame4 = CGRect(x: parentViewWidth/2, y: parentViewWidth/2, width: parentViewWidth/2, height: parentViewHeight/2)
            let imageView4 = OrderImageView(frame: frame4)
            listImageView.addSubview(imageView4)
            imageView4.sd_setImage(with: URL(string: listImageUrl[3]!))
            
        }
        
     
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
    
}
