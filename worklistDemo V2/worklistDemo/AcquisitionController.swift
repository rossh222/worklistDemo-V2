//
//  AcquisitionController.swift
//  worklistDemo
//
//  Created by Ross Higgins on 6/26/17.
//  Copyright © 2017 Ross Higgins. All rights reserved.
//

import UIKit

class AcquisitionController: UICollectionViewController {
    
    private let cellId = "cellId"
    //var appCategories: [AppCategory]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //appCategories = AppCategory.sampleAppCategories()
        
        collectionView?.backgroundColor = UIColor.white
        //collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
   
    
    // lays out the photos in the view for the width of the screen and a height of 150.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150 )
    }
    
}
