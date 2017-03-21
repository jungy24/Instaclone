//
//  PostCell.swift
//  Instaclone
//
//  Created by Jungyoon Yu on 3/21/17.
//  Copyright © 2017 Jungyoon Yu. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postView: UIImageView!
    
    @IBOutlet weak var caption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
