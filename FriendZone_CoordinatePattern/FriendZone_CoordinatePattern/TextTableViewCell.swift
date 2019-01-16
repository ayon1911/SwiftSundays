//
//  TextTableViewCell.swift
//  FriendZone_CoordinatePattern
//
//  Created by krAyon on 15.01.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
