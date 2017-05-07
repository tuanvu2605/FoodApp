//
//  HomeController.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/24/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import SDWebImage

protocol ControllerWithNavigationSearchBar
{
    func implimentSearchbar()
}

class HomeController: BaseCollectionController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    
    let cellId = "HomeCellID"
    var categories : [Category]!
    {
        didSet
        {
            self.data = categories
        }

    }
    var searchBar : UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        implimentSearchbar()
        navigationController?.navigationBar.backgroundColor = .white
        categories = [Category]()
        layoutCollectionView()

        API.getAllCategory { (result, listCateDict) in
            
            for dict in listCateDict
            {
                let cate = Category.init(dict: dict)
                self.categories.append(cate)
            }
            
            if !self.isDisplayHolder()
            {
                self.collection.reloadData()
            }
        }
       
        
    }

    func layoutCollectionView()
    {
        let collectionLayout = KRLCollectionViewGridLayout()
        collectionLayout.numberOfItemsPerLine = 2
        collectionLayout.aspectRatio = 1
        collectionLayout.interitemSpacing = 10
        collectionLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collection.collectionViewLayout = collectionLayout
        collection.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        collection.register(UINib(nibName: "PlaceholderCell", bundle: nil), forCellWithReuseIdentifier: placeholerCellId)
        

        collection.backgroundColor = UIColor.groupTableViewBackground
        
    }
    
}

extension HomeController : ControllerWithNavigationSearchBar
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    

   
    override func displayCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        let cate = categories[indexPath.item]
        cell.displayWithCategory(cate)
        return cell
    }

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (categories.count > 0){
            StoreHouseController.shared.tabIndex = indexPath.item
            print("\(StoreHouseController.shared.tabIndex)")
            StoreHouseController.shared.categories = categories
            navigationController?.pushViewController(StoreHouseController.shared, animated: true)
        }
        
        

    }
    
    func implimentSearchbar() {
        
//        searchBar = UISearchBar(frame: CGRect(x: 40, y: (self.navigationController?.navigationBar.frame.size.height)! - 35, width: AppSize.screenWidth - 80, height: 20))
//        searchBar.returnKeyType = .search
//        searchBar.tintColor = UIColor.groupTableViewBackground
//        searchBar.backgroundColor = UIColor.groupTableViewBackground
//        searchBar.barTintColor = UIColor.groupTableViewBackground
//        searchBar.barStyle = .default
//        
//        searchBar.delegate = self
//        self.navigationController?.navigationBar.addSubview(searchBar)
    }
}

extension HomeController : UISearchBarDelegate
{

    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {

        return true
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
     
         searchBar.endEditing(true)
    }
    

}
