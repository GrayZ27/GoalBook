//
//  GoalVC.swift
//  GoalBook
//
//  Created by Gray Zhen on 12/7/17.
//  Copyright © 2017 GrayStudio. All rights reserved.
//

import UIKit

class GoalVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
    
    //TableView functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell  = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell {
            cell.configureCell(forGoalDescription: "Coding on Xcode by using Swift everyday -- G", withGoalType: "Long-Term", andGolaProgress: 100)
            return cell
        }else {
            return UITableViewCell()
        }
        
    }

}

