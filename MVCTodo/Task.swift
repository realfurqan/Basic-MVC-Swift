//
//  Task.swift
//  MVCTodo
//
//  Created by Hafiz on 08/01/2016.
//  Copyright © 2016 Terato. All rights reserved.
//

import UIKit

class Task: NSObject {
    var taskId: Int!
    var taskName: String!
    var completed: Bool!
    
    init(taskName: String, completed: Bool) {
        self.taskName = taskName
        self.completed = completed
    }
}
