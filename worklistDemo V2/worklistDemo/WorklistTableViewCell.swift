//
//  WorklistTableViewCell.swift
//  worklistDemo
//
//  Created by Ross Higgins on 6/14/17.
//  Copyright © 2017 Ross Higgins. All rights reserved.
//

import UIKit

class WorklistTableViewCell: UITableViewCell {
    
    // outlets for table view cells
    @IBOutlet weak var accessionNo1: UILabel!
    @IBOutlet weak var exam1: UILabel!
    @IBOutlet weak var examDate1: UILabel!
    @IBOutlet weak var imgView1: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
