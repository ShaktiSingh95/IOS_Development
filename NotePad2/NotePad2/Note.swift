//
//  Note.swift
//  NotePad2
//
//  Created by Shakti Pratap Singh on 19/06/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
class Note
{
    
    var notes = [dataSource]()
    class func allNotes()->[Note]
    {
        
        var notes=[Note]()
        for index in 1...100{
        
            notes.append(Note(title: "Title:\(index)",details: "this is a note for index:\(index)"))
        
        }
        return notes
        
    }
    
}