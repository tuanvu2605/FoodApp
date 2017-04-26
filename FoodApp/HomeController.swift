//
//  HomeController.swift
//  FoodApp
//
//  Created by Tuan Vu on 4/24/17.
//  Copyright © 2017 Tuan Vu. All rights reserved.
//

import UIKit

class HomeController: BaseController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    let cellId = "HomeCellID"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutCollectionView()

     
    }
    
    func layoutCollectionView()
    {
        let collectionLayout = KRLCollectionViewGridLayout()
        collectionLayout.numberOfItemsPerLine = 2
        collectionLayout.aspectRatio = 1
        collectionLayout.interitemSpacing = 10
        collectionLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collection.collectionViewLayout = collectionLayout
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

extension HomeController : UICollectionViewDelegate , UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .red
        return cell
        
    }
}
