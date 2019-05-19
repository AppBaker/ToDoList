//
//  ToDo.swift
//  ToDoList
//
//  Created by Ivan Nikitin on 26/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit
import CoreData

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
    
    convenience init(_ todo: ToDoMO) {
        
        let title = todo.title ?? ""
        let isComplete = todo.isComplete
        let dueDate = todo.dueDate ?? Date()
        let notes = todo.notes
        
        
        var image: UIImage? = nil
        if let imageData = todo.image {
            image = UIImage(data: imageData)
        }
        self.init(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes, image: image)
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

// MARK: - ToDoMO load data
extension ToDoMO {
    convenience init(_ todo: ToDo) {
        let context = DataManager.manager.context
        self.init(context: context)
        
        title = todo.title
        isComplete = todo.isComplete
        dueDate = todo.dueDate
        notes = todo.notes
        image = todo.image?.pngData()
    }
    
    static func loadData() -> [ToDoMO] {
        
        let request : NSFetchRequest<ToDoMO> = ToDoMO.fetchRequest()
        let context = DataManager.manager.context
        
        guard let todos = try? context.fetch(request) else { return []}
        
        return todos
    }
}


