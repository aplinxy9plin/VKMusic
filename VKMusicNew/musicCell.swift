//
//  musicCell.swift
//  VKMusic
//
//  Created by Nikita Aplin on 19.02.16.
//  Copyright © 2018 Nikita Aplin. All rights reserved.
//

import UIKit

class musicCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!

    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var numLabel: UILabel!

    @IBOutlet weak var downloadButtonOutlet: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
