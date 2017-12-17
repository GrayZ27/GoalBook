//
//  GoalVC.swift
//  GoalBook
//
//  Created by Gray Zhen on 12/7/17.
//  Copyright © 2017 GrayStudio. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalVC: UIViewController {

    //UIOutlets
    @IBOutlet weak var tableView: UITableView!
    
    var goals: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchObjectsFromCoreData()
        tableView.reloadData()
    }
    
    func fetchObjectsFromCoreData() {
        self.fetch { (completed) in
            if completed {
                if goals.count > 0 {
                    tableView.isHidden = false
                }else {
                    tableView.isHidden = true
                }
                
            }
        }
    }
    
    //UIButtons
    @IBAction func addGoalBtnPressed(_ sender: UIButton) {
        
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        
        presentDetail(createGoalVC)
        
    }
    
}

extension GoalVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell() }
        
        let goal = goals[indexPath.row]

        cell.configureCell(withGoal: goal)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            
            self.removeGoal(atIndexPath: indexPath)
            self.fetchObjectsFromCoreData()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
        let addAction = UITableViewRowAction(style: .normal, title: "Add 1") { (rowAction, indexPath) in
            
            self.setProgress(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.672806948, green: 0, blue: 0.05028790137, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.5065632931, green: 0.2275080153, blue: 0.3282407228, alpha: 1)
        
        return [deleteAction, addAction]
    }

}

//functions to handle data from CoreData
extension GoalVC {
    
    //func to set progress for your goal
    func setProgress(atIndexPath indexPath: IndexPath) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let chosenGoal = goals[indexPath.row]
        
        if chosenGoal.goalProgress > 0 {
            chosenGoal.goalProgress -= 1
        }else {
            return
        }
        
        do {
            try managedContext.save()
            //print("Successfully set goal progress")
        }catch {
            debugPrint("Could not set goal progress: \(error.localizedDescription)")
        }
        
    }
    
    //func to delete data from CoreData
    func removeGoal(atIndexPath indexPath: IndexPath) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        managedContext.delete(goals[indexPath.row])
        
        do {
            try managedContext.save()
            //print("Successfully deleted goal")
        }catch {
            debugPrint("Could not Delete: \(error.localizedDescription)")
        }
        
    }
    
    //func to fetch data from CoreData
    func fetch(completion: (_ completed: Bool) -> ()) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let fecthRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            goals = try managedContext.fetch(fecthRequest)
            //print("Successfully fetch data")
            completion(true)
        }catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
        
    }
    
}


