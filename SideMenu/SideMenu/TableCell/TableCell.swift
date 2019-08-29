//
//  TableCell.swift
//  SideMenu
//
//  Created by Andrii Shchudlo on 29/08/2019.
//  Copyright © 2019 Andrii Shchudlo. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
