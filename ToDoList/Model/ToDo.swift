//
//  ToDo.swift
//  ToDoList
//
//  Created by Ivan Nikitin on 26/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

@objcMembers class ToDo: NSObject {
    //MARK: - Stored Properties
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    var image: UIImage?
    //MARK: - Initia lizer
    init(
        title: String = String(),
        isComplete: Bool = Bool(),
        dueDate: Date = Date(),
        notes: String? = nil,
        image: UIImage? = nil
    ) {
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
        self.image = image
    }
    
    deinit {
        print(Date(), #line, #function, title)
    }
    //MARK: - Computed properties
    var keys: [String] {
        return Mirror(reflecting: self).children.compactMap{ $0.label }
    }
    
    var values: [Any?] {
        return Mirror(reflecting: self).children.map{ $0.value }
    }
    
    var capitalizedKeys: [String] {
        return keys.map{ $0.capitalizedWithSpaces }
    }
    //MARK: - Methods
    
    static func loadData() -> [ToDo]? {
        return loadSampleData()
    }
    
    static func loadSampleData() -> [ToDo] {
        return [
            ToDo(title: "Buy bread", isComplete: false, dueDate: Date(), notes: "rye"),
            ToDo(title: "Buy butter", isComplete: false, dueDate: Date(), notes: "Prostokvashino"),
            ToDo(title: "Complete project", isComplete: false, dueDate: Date())
        ]
    }
}

extension ToDo: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        let todo = ToDo()
        
        keys.forEach {
            let value = self.value(forKey: $0)
            todo.setValue(value, forKey: $0)
        }
        
        return todo
    }
}


