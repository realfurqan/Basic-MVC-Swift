//
//  ViewController.swift
//  MVCTodo
//
//  Created by Hafiz on 08/01/2016.
//  Copyright © 2016 Terato. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var taskTableView: UITableView!
    var tasks = [Task]()
    override func viewDidLoad() {
        super.viewDidLoad()

        taskTableView.delegate = self
        taskTableView.dataSource = self
        
        LibraryAPI.sharedInstance.getTasks { (tasks, error) -> () in
            if error == nil {
                self.tasks = tasks!
                print("total tasks: \(self.tasks.count)")
                self.taskTableView.reloadData()
            }
            else {
                print(error?.localizedDescription)
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath)
        let task = tasks[indexPath.row]
        
        cell.textLabel?.text = task.taskName
        
        if task.completed! {
            cell.accessoryType = .Checkmark
        }
        else {
            cell.accessoryType = .None
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let task = tasks[indexPath.row]
        task.completed = !task.completed
        
        taskTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

