//
//  ProductsController.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/28/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class ProductsController: BaseCollectionController {

    var products = [Product]()
    {
        willSet
        {
            self.data = newValue
        }

    }
    var category : Category!
    let cellId = "ProductCellID"
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        layoutCollectionView()
        API.getProductOfCategory(category.categoryId, 0, limit: 20) { (status, data) in
            
            for dict in data{
                let product = Product(dict: dict)
                self.products.append(product)
            }
            
            self.collection.reloadData()
        }
    }
    
    func layoutCollectionView()
    {
        let collectionLayout = KRLCollectionViewGridLayout()
        collectionLayout.numberOfItemsPerLine = 2
        let cellWidth = (AppSize.screenWidth - 30)/2
        let cellHeight = (AppSize.screenWidth - 30)/2 + 90
        collectionLayout.aspectRatio = cellWidth / cellHeight
        collectionLayout.interitemSpacing = 10
        collectionLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 50, right: 10)
        collection.collectionViewLayout = collectionLayout
        collection.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: cellId)
         collection.register(UINib(nibName: "PlaceholderCell", bundle: nil), forCellWithReuseIdentifier: placeholerCellId)
        
        
    }
    




}




extension ProductsController
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func displayCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProductCell
        let product = products[indexPath.item]
        cell.display_(product: product)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if products.count <= 0 {return }
        let productInfoController = ProductInfoController(nibName: "ProductInfoController", bundle: nil)
        productInfoController.product = products[indexPath.item]
        present(productInfoController, animated: true, completion: nil)
    }
}
