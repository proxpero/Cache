//
//  Object.swift
//  Cache
//
//  Created by Todd Olsen on 11/2/16.
//
//

import Foundation

final class Object: NSObject, NSCoding {
    
    let name: String
    let numbers: [Int]
    let asset: Data

    init(with name: String, numbers: [Int], asset: Data) {
        self.name = name
        self.numbers = numbers
        self.asset = asset
    }

    init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.numbers = aDecoder.decodeObject(forKey: "numbers") as! [Int]
        self.asset = aDecoder.decodeObject(forKey: "asset") as! Data
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(numbers, forKey: "numbers")
        aCoder.encode(asset, forKey: "asset")
    }
}
