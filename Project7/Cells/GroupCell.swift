//
//  GroupCell.swift
//  Project7
//
//  Created by пользователь on 25/05/2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    
    static let reuseIdentifier = "GroupCell"
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
