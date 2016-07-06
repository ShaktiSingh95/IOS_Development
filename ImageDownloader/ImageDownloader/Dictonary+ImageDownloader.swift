//
//  Dictonary+ImageDownloader.swift
//  ImageDownloader
//
//  Created by Shakti Pratap Singh on 03/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
extension Dictionary{
   
    mutating func union(dictionary: Dictionary) {
        dictionary.forEach { self.updateValue($1, forKey: $0) }
    }
    
}