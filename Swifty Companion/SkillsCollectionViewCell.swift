//
//  SkillsCollectionViewCell.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/03.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import UIKit
import GradientProgressBar

class SkillsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var skillName: UILabel!
    @IBOutlet weak var skillProgress: GradientProgressBar!
    @IBOutlet weak var skillLevel: UILabel!
}
