//
//  ContactCell.swift
//  Rank 0.1
//
//  Created by Océane Nicolle on 22/06/2020.
//  Copyright © 2020 Océane Nicolle. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactBubble: UIView!
    
    @IBOutlet weak var rankLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
contactBubble.layer.cornerRadius = contactBubble.frame.size.height / 5    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
