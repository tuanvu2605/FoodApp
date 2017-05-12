//
//  OrderCell.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/6/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import DatePickerDialog

enum OrderCellType {
    case address
    case phoneNo
    case time
    case note
}

class OrderCell: UITableViewCell  {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var txtField: UITextField!
    var textInTextField : String?
    @IBOutlet weak var bgView: UIView!
    var type : OrderCellType!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        txtField.delegate = self
        layoutIfNeeded()
        layoutSubviews()
        backgroundColor = .clear
        
        // Initialization code
    }
    
    func display_()
    {
        bgView.layer.shadowColor = UIColor.lightGray.cgColor
        bgView.layer.shadowOffset = CGSize(width: 3, height: 3);
        bgView.layer.shadowOpacity = 0.5;
        bgView.layer.shadowRadius = 1.0;
        
        if type == .phoneNo {
            txtField.keyboardType = .numberPad
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
}

extension OrderCell : UITextFieldDelegate
{
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch self.type! {
        case OrderCellType.address:
            OrderController.shared.requestParam["deliveryAddress"] = txtField.text
        case OrderCellType.phoneNo:
            OrderController.shared.requestParam["contactPhoneNumber"] = txtField.text
        case OrderCellType.time:
            OrderController.shared.requestParam["deliveryDate"] = txtField.text
        case OrderCellType.note:
            OrderController.shared.requestParam["orderNotes"] = txtField.text
        default:
            print("out of type")
        }
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if type == .time
        {
            DatePickerDialog().show(title: "Thời gian nhận", doneButtonTitle: "Đồng ý", cancelButtonTitle: "Hủy", defaultDate: Date(), minimumDate: Date(), maximumDate: nil, datePickerMode: .date, callback: { (date) in
                
                let dateFormater = DateFormatter()
                dateFormater.dateFormat = "yyyy-MM-dd"
                guard let date = date else
                {
                    return
                }
                textField.text =  dateFormater.string(from: date)
                OrderController.shared.requestParam["deliveryDate"] = self.txtField.text
                
            })
            
            return false
        }
        return true
    }
}
