//
//  ProductTableViewCell.swift
//  GoodAsOldPhones
//
//  Created by csmous on 27/11/2018.
//  Copyright © 2018 csmous. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet  weak var Label: UILabel!
    @IBOutlet weak var Photo: UIImageView!
}
