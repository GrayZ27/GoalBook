//
//  CreateGoalVC.swift
//  GoalBook
//
//  Created by Gray Zhen on 12/14/17.
//  Copyright © 2017 GrayStudio. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    //IBOutlets
    @IBOutlet weak var goalTextview: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedAlpha()
        longTermBtn.setDeselectedAlpha()
        
    }
    
    @IBAction func shortTermBtnPressed(_ sender: UIButton) {
        goalType = .shortTerm
        shortTermBtn.setSelectedAlpha()
        longTermBtn.setDeselectedAlpha()
    }
    
    @IBAction func longTermBtnPressed(_ sender: UIButton) {
        goalType = .longTerm
        shortTermBtn.setDeselectedAlpha()
        longTermBtn.setSelectedAlpha()
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismissDetail()
    }
    
}
