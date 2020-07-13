//
//  Meal.swift
//  QLMonAn
//
//  Created by Phan Tien Nhan on 6/28/20.
//  Copyright © 2020 Phan Tien Nhan. All rights reserved.
//

import Foundation
import UIKit
class Meal {
     var name:String
     var image:UIImage?
     var rating:Int
    
    init?(name:String,image:UIImage?,rating:Int) {
        guard !name.isEmpty else {
            return nil
        }
        guard rating>=0 && rating<=5 else{
            return nil
        }
        self.name=name
        self.image=image
        self.rating=rating
    }
}
