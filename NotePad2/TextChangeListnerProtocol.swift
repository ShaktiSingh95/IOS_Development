//
//  TextChangeListnerProtocol.swift
//  NotePad2
//
//  Created by Shakti Pratap Singh on 25/06/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
protocol TextChangedListner {
    func titleChanged(newTitle : String?,noteID: Int)
    func detailsChanged(newDetails : String?,noteID: Int)
}