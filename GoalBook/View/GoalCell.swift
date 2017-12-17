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
    @IBOutlet weak var completionView: UIView!
    
    func configureCell(withGoal goal: Goal) {
        
        goalDescriptionLbl.text = goal.goalDescription
        goalTypeLbl.text = goal.goalType
        goalProgressLbl.text = String(goal.goalProgress)
        
        if goal.goalProgress == 0 {
            self.completionView.isHidden = false
        }else {
            self.completionView.isHidden = true
        }
        
    }
    
}
