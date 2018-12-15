//
//  Product.swift
//  GoodAsOldPhones
//
//  Created by csmous on 27/11/2018.
//  Copyright © 2018 csmous. All rights reserved.
//

import Foundation

class Product {

    internal private (set) var date : Int
    internal private (set) var modelName : String
    internal private (set) var fullModelDescription : String
    internal lazy var descrip : String = {
        
        return (String(date) + " - " + modelName)
    }()
    
    internal var cellImage : String?
    internal var fullscreenImage : String?
    
    init(date : Int ,modelName : String, cellImage : String? = nil ,fullscreenImage : String? = nil , fullModelDescription : String = "More infor to come"  ) {
        self.date = date
        self.modelName = modelName
        self.cellImage = cellImage
        self.fullscreenImage = fullscreenImage
        self.fullModelDescription = fullModelDescription
    }
}
