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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    @IBAction func shortTermBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func longTermBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
