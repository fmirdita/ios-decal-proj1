//
//  AddItemViewController.swift
//  toDoList
//
//  Created by Filip Mirdita on 10/18/16.
//  Copyright © 2016 Filip Mirdita. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate, TaskDelegate {
    
    var tasks = [(String,String)]()
    var count = 0
    
    @IBOutlet weak var task: UITextField!
    @IBOutlet weak var details: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.tasks.append((task.text!, details.text!))
        var taskTableController = segue.destination as! UINavigationController
        (taskTableController.viewControllers[0] as! TaskDelegate).transferInfo(tasks: self.tasks, numCompleted: self.count)
        super.prepare(for: segue, sender: sender)
    }
    
    func transferInfo(tasks: [(String, String)], numCompleted: Int) {
        self.count = numCompleted
        self.tasks = tasks
    }

    
}
