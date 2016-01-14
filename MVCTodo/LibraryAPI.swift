//
//  LibraryAPI.swift
//  MVCTodo
//
//  Created by Hafiz on 08/01/2016.
//  Copyright © 2016 Terato. All rights reserved.
//

import UIKit

class LibraryAPI: NSObject {
    
    private let persistencyManager: PersistencyManager

    class var sharedInstance: LibraryAPI {
        struct Singleton {
            static let instance = LibraryAPI()
        }
        
        return Singleton.instance
    }
    
    override init() {
        persistencyManager = PersistencyManager()
        super.init()
    }
    
    func getTasks(completionHandler:([Task]?, NSError?) -> ()) {
        
        persistencyManager.getTasks({ (tasks, error) -> () in
            completionHandler(tasks, error)
        })
    }
}
