//
//  CollectionViewCell.swift
//  worklistDemo
//
//  Created by Ross Higgins on 6/26/17.
//  Copyright © 2017 Ross Higgins. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionViewImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    /*
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "img3")
        // scale image to fit in box
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    func setupViews() {
        //backgroundColor = UIColor.black
        addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    }
 */

}
