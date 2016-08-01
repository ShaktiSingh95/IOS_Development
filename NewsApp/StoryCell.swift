//
//  StoryCell.swift
//  
//
//  Created by Shakti Pratap Singh on 14/07/16.
//
//

import Foundation
import FoldingCell
class StoryCell: FoldingCell{
    
    var height:CGFloat = 200
    override func animationDuration(itemIndex:NSInteger, type:AnimationType)-> NSTimeInterval {
        
        // durations count equal it itemCount
        let durations = [0.33, 0.26, 0.26] // timing animation for each view
        return durations[itemIndex]
    }
    
}
