//
//  File.swift
//  QLSanPham
//
//  Created by Le Van Nghia on 8/8/20.
//  Copyright © 2020 QLSanPham. All rights reserved.
//

import Foundation
import UIKit
class SanPham {
    var imageName:String?
    var nameSP:String?
    var soLuong:String?
    var donGia:String?
    var image:UIImage?
    
    convenience init (imageName:String, nameSP:String, soLuong:String, donGia:String){
        self.init()
        self.imageName = imageName
        self.nameSP = nameSP
        self.donGia = donGia
        self.soLuong = soLuong
    }
}
