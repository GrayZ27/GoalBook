//
//  FinishGoalVC.swift
//  GoalBook
//
//  Created by Gray Zhen on 12/16/17.
//  Copyright © 2017 GrayStudio. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    //IBOutlets
    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var goalDaysTxtField: UITextField!
    @IBOutlet weak var warningLbl: UILabel!
    
    //variables
    private var goalDescription: String!
    private var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createGoalBtn.bindToKeyboard()
        goalDaysTxtField.delegate = self
        
    }
    
    func initData(forGoalDescription description: String, withGoalType type: GoalType ) {
        
        goalDescription = description
        goalType = type
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        warningLbl.text = ""
    }
    
    //IBActions
    @IBAction func createGoalBtnPressed(_ sender: UIButton) {

        if goalDaysTxtField.text != "" {
            save { (completed) in
                if completed {
                    guard let goalVC = storyboard?.instantiateViewController(withIdentifier: "GoalVC") else { return }
                    presentingViewController?.presentSecondaryDetail(goalVC)
                }
            }
        }else {
            warningLbl.text = "*Please enter the days for your goal"
        }
        
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismissDetail()
    }
    
    //save data to CoreData
    func save(completion: (_ finished: Bool) -> ()) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal  = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        let goalDays = goalDaysTxtField.text ?? "0"
        goal.goalCompletionValue = Int32(goalDays)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            completion(true)
        }catch{
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
        
    }
    
}
