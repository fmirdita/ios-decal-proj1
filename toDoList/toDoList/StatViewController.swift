//
//  StatViewControoler.swift
//  toDoList
//
//  Created by Filip Mirdita on 10/18/16.
//  Copyright © 2016 Filip Mirdita. All rights reserved.
//

import UIKit

class StatViewController: UIViewController, TaskDelegate {
    
    @IBOutlet weak var completeCount: UILabel!
    var count = 0
    var tasks = [(String, String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        completeCount.text = String(count)
    }
    
    func transferInfo(tasks: [(String, String)], numCompleted: Int) {
        count = numCompleted
        self.tasks = tasks
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! TaskDelegate
        dest.transferInfo(tasks: self.tasks, numCompleted: Int(completeCount.text!)!)
    }
    
}
