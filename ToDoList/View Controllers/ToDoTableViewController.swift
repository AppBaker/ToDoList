//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Ivan Nikitin on 29/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    let configurator = Configurator()
    var todos = [ToDo]()
    var todosMO = [ToDoMO]() {
        didSet {
            DataManager.manager.saveContext()
        }
    }
}

//MARK: - UIViewController Methods
extension ToDoTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todosMO = ToDoMO.loadData()
    }
}

//MARK: - UITableViewDataSource
extension ToDoTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosMO.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell")!
        let todo = todosMO[indexPath.row]
        configurator.configure(cell, with: todo)
        
        return cell
    }
    
}

// MARK: - Navigation
extension ToDoTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "EditSegue" else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let todo = todosMO[indexPath.row]
        let controller = segue.destination as! ToDoItemViewController
        controller.title = "Edit"
        controller.todo = ToDo(todo)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue ) {
        guard segue.identifier == "unwindSegue" else { return }
        let todo = (segue.source as! ToDoItemViewController).todo
        let todoMO = ToDoMO(todo)
        
        if let selectedIndex = tableView.indexPathForSelectedRow {
            //TODO: edit in place
            todosMO.remove(at: selectedIndex.row)
            todosMO.insert(todoMO, at: selectedIndex.row)
            tableView.reloadRows(at: [selectedIndex], with: .automatic)
        } else {
            //TODO: add new element
            let indexPath = IndexPath(row: todosMO.count, section: 0)
            todosMO.append(todoMO)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
}
