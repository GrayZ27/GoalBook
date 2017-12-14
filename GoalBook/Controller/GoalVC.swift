//
//  GoalVC.swift
//  GoalBook
//
//  Created by Gray Zhen on 12/7/17.
//  Copyright © 2017 GrayStudio. All rights reserved.
//

import UIKit
import CoreData

class GoalVC: UIViewController {

    //UIOutlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //UIButtons
    @IBAction func addGoalBtnPressed(_ sender: UIButton) {
        tableView.isHidden = false
        
    }
    

}

extension GoalVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell() }
        
        if (indexPath.row + 1) % 3 == 0 {
            cell.configureCell(forGoalDescription: "Day off -- G", withGoalType: .longTerm, andGolaProgress: indexPath.row + 1)
            return cell
        }
        
        cell.configureCell(forGoalDescription: "Coding on Xcode by using Swift everyday -- G", withGoalType: .longTerm, andGolaProgress: indexPath.row + 1 )
        
        return cell
        
    }

}


