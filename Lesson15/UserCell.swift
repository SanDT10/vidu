//
//  UserCell.swift
//  Lesson15
//
//  Created by SAN10 on 3/18/22.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var lbSub: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
