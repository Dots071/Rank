//
//  CategoryCell.swift
//  Rank 0.1
//
//  Created by Océane Nicolle on 03/06/2020.
//  Copyright © 2020 Océane Nicolle. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    @IBOutlet weak var categoryBubble: UIView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var parameterCount: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryBubble.layer.cornerRadius = categoryBubble.frame.size.height / 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
