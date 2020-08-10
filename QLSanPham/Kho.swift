//
//  Kho.swift
//  QLSanPham
//
//  Created by Phan Tien Nhan on 8/9/20.
//  Copyright © 2020 QLSanPham. All rights reserved.
//

import Foundation
import UIKit
class Kho {
    var ma:String
    var Loai:String
    var img:UIImage?
    
    init(ma:String,Loai:String,img:UIImage) {
        self.ma = ma
        self.Loai = Loai
        self.img = img
    }
    
}
