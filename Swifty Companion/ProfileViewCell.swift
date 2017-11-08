//
//  ProfileViewCell.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/04.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import UIKit
import GradientProgressBar

class ProfileViewCell: UITableViewCell {

    @IBOutlet weak var projectsCount: UILabel!
    @IBOutlet weak var skillsCount: UILabel!
    @IBOutlet weak var correctionPoints: UILabel!
    @IBOutlet weak var progress: GradientProgressBar!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var campus: UILabel!
    @IBOutlet weak var wallet: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
