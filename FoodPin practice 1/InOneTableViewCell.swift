//
//  InOneTableViewCell.swift
//  FoodPin practice 1
//
//  Created by UFO Xcode on 2019/12/4.
//  Copyright © 2019 UFO Xcode. All rights reserved.
//

import UIKit

class InOneTableViewCell: UITableViewCell {
    @IBOutlet weak var aImage: UIImageView! {
        didSet{
            aImage.layer.cornerRadius = aImage.bounds.width / 2
            aImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var Label1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
