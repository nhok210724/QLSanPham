//
//  SanPham.swift
//  QLSanPham
//
//  Created by Le Van Nghia on 7/31/20.
//  Copyright © 2020 QLSanPham. All rights reserved.
//

import Foundation
import UIKit

class SanPham{
    var name:String
    var image:UIImage?
    var rating:Int
    var gia:Int
    
    init?(name: String,image:UIImage?,rating:Int,gia:Int) {
        guard !name.isEmpty else{
            return nil
        }
        guard rating >= 0 && rating <= 5 else{
            return nil
        }
        
        self.name = name
        self.image = image
        self.rating = rating
        self.gia = gia
    }
}
