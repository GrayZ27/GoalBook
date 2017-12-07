//
//  GoalVC.swift
//  GoalBook
//
//  Created by Gray Zhen on 12/7/17.
//  Copyright © 2017 GrayStudio. All rights reserved.
//

import UIKit

class GoalVC: UIViewController {

    //UIOutlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    //UIButtons
    @IBAction func addGoalBtnPressed(_ sender: UIButton) {
        tableView.isHidden = false
        print("add a new Goal?")
    }

}

