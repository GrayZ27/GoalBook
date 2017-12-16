//
//  CreateGoalVC.swift
//  GoalBook
//
//  Created by Gray Zhen on 12/14/17.
//  Copyright © 2017 GrayStudio. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    //IBOutlets
    @IBOutlet weak var goalTextview: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var warningLbl: UILabel!
    
    //variables
    private var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedAlpha()
        longTermBtn.setDeselectedAlpha()
        goalTextview.delegate = self
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        goalTextview.text = ""
        goalTextview.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        warningLbl.text = ""
        
    }
    
    //IBActions
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
        
        if goalTextview.text != "" && goalTextview.text != "What is your goal?" {
            
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else { return }
            
            finishGoalVC.initData(forGoalDescription: goalTextview.text!, withGoalType: goalType)
            presentDetail(finishGoalVC)
            
        } else {
            view.endEditing(true)
            warningLbl.text = "*Please enter your goal"
        }
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismissDetail()
    }
    
}
