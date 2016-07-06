//
//  FilterTableViewCell.swift
//  ImageDownloader
//
//  Created by Shakti Pratap Singh on 04/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    
    @IBOutlet weak var filterSwitch: UISwitch!
    @IBOutlet weak var filterOption: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
