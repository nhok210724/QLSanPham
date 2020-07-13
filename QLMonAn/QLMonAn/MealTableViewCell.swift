//
//  MealTableViewCell.swift
//  QLMonAn
//
//  Created by Phan Tien Nhan on 7/5/20.
//  Copyright © 2020 Phan Tien Nhan. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameMeal: UITextField!
    
    @IBOutlet weak var imgMeal: UIImageView!
    
    @IBOutlet weak var ratringMeal: RatingControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
