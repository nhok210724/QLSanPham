//
//  SanPhamTableViewCell.swift
//  QLSanPham
//
//  Created by Le Van Nghia on 8/8/20.
//  Copyright © 2020 QLSanPham. All rights reserved.
//

import UIKit

class SanPhamTableViewCell: UITableViewCell {

    @IBOutlet weak var imageName:UIImageView?
    @IBOutlet weak var nameSP:UILabel?
    @IBOutlet weak var soLuong:UILabel?
    @IBOutlet weak var donGia:UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
