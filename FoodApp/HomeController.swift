//
//  HomeController.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/24/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit
import SDWebImage
import AMScrollingNavbar
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
        
        let cartView = CartBarItem.shared
        let cartItem = UIBarButtonItem(customView:cartView)
        cartItem.tintColor = .black
        navigationItem.rightBarButtonItem = cartItem
        let ges = UITapGestureRecognizer(target: self, action: #selector(btnCartDidTap))
        cartView.addGestureRecognizer(ges)
        
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.layer.shadowOpacity = 0.8

    }
    

    
    func btnCartDidTap() {
      
        let cart = CartController.shared
        let navCart = NavController(rootViewController: cart)
        present(navCart, animated: false, completion: nil)
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

extension HomeController : ControllerWithNavigationSearchBar , ScrollingNavigationControllerDelegate
{
    
    func scrollingNavigationController(_ controller: ScrollingNavigationController, didChangeState state: NavigationBarState) {
        switch state {
        case .collapsed:
            print("navbar collapsed")
        case .expanded:
            print("navbar expanded")
        case .scrolling:
            print("navbar is moving")
        }
    }
    
    
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
        
        func pushStoreHouse()
        {
            StoreHouseController.shared.tabIndex = indexPath.item
            StoreHouseController.shared.categories = categories
            navigationController?.pushViewController(StoreHouseController.shared, animated: true)
        
        }
        if(categories.count > 0) { pushStoreHouse() }

    }
    
    func implimentSearchbar() {

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
