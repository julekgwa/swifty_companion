//
//  SkillCollectionViewCell.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/04.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import UIKit
import GradientProgressBar

class SkillCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var projectProgress: GradientProgressBar!

    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var projectName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
