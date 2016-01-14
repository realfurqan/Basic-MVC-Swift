//
//  PersistencyManager.swift
//  MVCTodo
//
//  Created by Hafiz on 08/01/2016.
//  Copyright © 2016 Terato. All rights reserved.
//

import UIKit
import Alamofire

class PersistencyManager: NSObject {
    private let kApiURL = "http://localweb.com:1337"
    private var tasks = [Task]()
    
    override init() {
        super.init()
    }
    
    func getTasks(completionHandler: (tasks: [Task], error: NSError?) -> ()) {
        Alamofire.request(.GET, kApiURL + "/tasks", parameters: nil)
            .responseJSON { response in
                if let json = response.result.value {
                    let taskData = json["data"] as! NSArray
                    var taskArray = [Task]()
                    for dict in taskData {
                        let task = Task(taskName: dict.valueForKey("taskName") as! String, completed: dict.valueForKey("completed") as! Bool)
                        taskArray.append(task)
                    }
                    completionHandler(tasks: taskArray, error: response.result.error)
                }
                
        }
    }
    
    func addTask(task: Task) {
        tasks.append(task)
    }
    
}
