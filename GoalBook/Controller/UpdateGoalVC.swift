//
//  UpdateGoalVC.swift
//  GoalBook
//
//  Created by Gray Zhen on 12/18/17.
//  Copyright © 2017 GrayStudio. All rights reserved.
//

import UIKit
import CoreData

class UpdateGoalVC: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    //IBoutlets
    @IBOutlet weak var updateGoalTxtView: UITextView!
    @IBOutlet weak var updateGoalTxtField: UITextField!
    @IBOutlet weak var updateGoalBtn: UIButton!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var currentGoalDescription: UILabel!
    @IBOutlet weak var currentGoalType: UILabel!
    @IBOutlet weak var currentGoalDays: UILabel!
    @IBOutlet weak var currentGoalDaysLeft: UILabel!
    
    //variables
    private var goalIndexPath: Int?
    private var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateGoalTxtView.delegate = self
        updateGoalTxtField.delegate = self
        shortTermBtn.setSelectedAlpha()
        longTermBtn.setDeselectedAlpha()
        showCurrentGoal()
    }
    
    func setGoalIndexPath(_ indexPath: Int) {
        goalIndexPath = indexPath
    }
    
    func showCurrentGoal() {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let fecthRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            let goals = try managedContext.fetch(fecthRequest)
            guard let indexPath = goalIndexPath else { return }
            
            guard let goalDescription = goals[indexPath].goalDescription else { return }
            currentGoalDescription.text = "Your Goal: \(goalDescription)"
            guard let goalType = goals[indexPath].goalType else { return }
            currentGoalType.text = "Goal Type: \(goalType)"
            currentGoalDays.text = "Goal Days: \(goals[indexPath].goalCompletionValue)"
            if goals[indexPath].goalProgress > 0 {
                currentGoalDaysLeft.text = "Days Lefts: \(goals[indexPath].goalProgress)"
            }else {
                currentGoalDaysLeft.text = "Goal Completed"
            }
            
        }catch {
            debugPrint("Could not find this goal: \(error.localizedDescription)")
        }
    }
    
    func updateGoal() {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let fecthRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            let goals = try managedContext.fetch(fecthRequest)
            guard let indexPath = goalIndexPath else { return }
            
            guard let newGoalDescription = updateGoalTxtView.text else { return }
            if newGoalDescription != "" {
                goals[indexPath].goalDescription = newGoalDescription
            }
            
            guard let newGoalProgressString = updateGoalTxtField.text else { return }
            
            if let newGoalProgress = Int32(newGoalProgressString), newGoalProgress > 0 {
                goals[indexPath].goalProgress = newGoalProgress
                goals[indexPath].goalCompletionValue = newGoalProgress
            }
            
            goals[indexPath].goalType = goalType.rawValue
            
            do {
                try managedContext.save()
            }catch {
                debugPrint("Could not update: \(error.localizedDescription)")
            }
        }catch {
            debugPrint("Could not find this goal: \(error.localizedDescription)")
        }
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        updateGoalTxtView.text = ""
        updateGoalTxtView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }

    //IBActions
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismissDetail()
    }
    
    @IBAction func updateGoalBtnPressed(_ sender: UIButton) {
        if updateGoalTxtField.text != "" && updateGoalTxtView.text != "What is your new goal?" && updateGoalTxtView.text != "" {
            updateGoal()
            dismissDetail()
        }else {
            view.endEditing(true)
        }
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
    
}
