//
//  GoalCell.swift
//  GoalBook
//
//  Created by Gray Zhen on 12/7/17.
//  Copyright © 2017 GrayStudio. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    //UIOutlets
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    func configureCell(forGoalDescription desc: String, withGoalType type: GoalType, andGolaProgress progress: Int) {
        
        goalDescriptionLbl.text = desc
        goalTypeLbl.text = type.rawValue
        goalProgressLbl.text = String(progress)
        
    }
    
}
