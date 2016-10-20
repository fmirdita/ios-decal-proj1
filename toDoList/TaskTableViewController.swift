//
//  TaskTableViewController.swift
//  toDoList
//
//  Created by Filip Mirdita on 10/19/16.
//  Copyright © 2016 Filip Mirdita. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController, TaskDelegate {
    
    var tasks = [(String, String)]()
    var completedTasks = 0
    
    func transferInfo(tasks: [(String, String)], numCompleted: Int) {
        self.tasks = tasks
        completedTasks = numCompleted
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let taskTitle = cell.textLabel!.text
        var task = ("","")
        for taskSearch in tasks {
            if (task.0 == taskTitle) {
                task = taskSearch
            }
        }
        if (task.0 == "") {
            if (task.0 == "") {
                //task.2 = true
                cell.accessoryType = .checkmark
            } else {
                //task.2 = false
                cell.accessoryType = .checkmark
            }
        } else {
            print("Task not found??")
            print(taskTitle)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel!.text = tasks[indexPath.row].0
        cell.detailTextLabel!.text = tasks[indexPath.row].1
        return cell
    }

    
     //Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         //Return false if you do not want the specified item to be editable.
        return true
    }
    

    
     //Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
             //Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
             //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
     //Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    
    
     //Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         //Return false if you do not want the item to be re-orderable.
        return true
    }
    

    
     //MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var dest = segue.destination as! TaskDelegate
        dest.transferInfo(tasks: tasks, numCompleted: completedTasks)
    }

}

protocol TaskDelegate {
    func transferInfo(tasks: [(String, String)], numCompleted: Int)
}
