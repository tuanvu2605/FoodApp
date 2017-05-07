//
//  BaseCollectionController.swift
//  FoodApp
//
//  Created by Tuan Vu on 5/4/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class BaseCollectionController: BaseController {

    
    var data = [NSObject]()
    let placeholerCellId = "placeholerCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

extension BaseCollectionController : UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return isDisplayHolder() ? 4 : data.count
    }
    
    
    func isDisplayHolder() -> Bool
    {
        if data.count <= 0 {return true}
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if isDisplayHolder()
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: placeholerCellId, for: indexPath) as! PlaceholderCell
            cell.displayPlaceholder()
            return cell
        }
        
        return displayCell(collectionView , indexPath)
        
    }
    
    func displayCell(_ collectionView : UICollectionView , _ indexPath : IndexPath) -> UICollectionViewCell
    {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if isDisplayHolder() {return}
        
    }
}
