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
    var hasEdited = false
    var isCanceled = false
    var originalToDo: ToDo!
}

// MARK: - CellActionDelegate
extension ToDoItemViewController: CellActionDelegate {
    
    func cell(editingEnded textField: UITextField, forSection section: Int) {
        updateFromField(textField, forSection: section)
        print(Date(), textField.text ?? "nil", "\(section)")
    }
    
    func cell(textChanged textField: UITextField, forSection section: Int) {
        updateFromField(textField, forSection: section)
        print(Date(), textField.text ?? "nil", "\(section)")
    }
    
    func cell(switchToddled switch: UISwitch, forSection section: Int) {
        if !isCanceled {
            let key = todo.keys[section]
            let isSet = `switch`.isOn
            todo.setValue(isSet, forKey: key)
        }
    }
    
}

// MARK: - Custom methods
extension ToDoItemViewController {
    @objc func editingCancelled() {
        isCanceled = true
        todo = originalToDo!.copy() as! ToDo
        setEditing(false, animated: true)
        print(#line, Date(), #function)
    }
    
    @objc func saveButtonTapped() {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
    
    func updateFromField(_ textField: UITextField, forSection section: Int) {
        if !isCanceled {
            let key = todo.keys[section]
            let text = textField.text ?? ""
            todo.setValue(text, forKey: key)
            print(#line, Date(), #function)
        }
        isCanceled = false
        
    }
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
//MARK: - UITableViewDelegate
extension ToDoItemViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !isEditing {
            setEditing(true, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

// MARK: - UIViewController methods
extension ToDoItemViewController {
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        
        if editing {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(editingCancelled))
        } else {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        }
        

        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalToDo = todo.copy() as? ToDo
//        print(Date(), #line, #function, todo, originalToDo)
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    @objc func textFieldEndEdeting() {
//        setEditing(false, animated: true)
//        view.endEditing(true)
        print(#line, #function)
    }
    
}
