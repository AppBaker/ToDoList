//
//  ToDoItemViewController.swift
//  ToDoList
//
//  Created by Ivan Nikitin on 29/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

class ToDoItemViewController: UITableViewController {
    
    var todo = ToDo()
    let configurator = Configurator()

}

//MARK: - UITableViewDataSource
extension ToDoItemViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return todo.keys.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key = todo.capitalizedKeys[section]
        return key
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let cell = configurator.getConfigureCell(in: self ,forSection: section)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .insert
    }
    
}

// MARK: - CellActionDelegate
extension ToDoItemViewController: CellActionDelegate {
    func cell(editingEnded textField: UITextField, forSection section: Int) {
        print(Date(), textField.text ?? "nil", "\(section)")
    }
    
    func cell(textChanged textField: UITextField, forSection section: Int) {
        print(Date(), textField.text ?? "nil", "\(section)")
    }
    
}

// MARK: - UIViewController methods
extension ToDoItemViewController {
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @objc func textFieldEndEdeting() {
        view.endEditing(true)
        print(#line, #function)
    }
    
}
