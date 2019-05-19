//
//  Configurator.swift
//  ToDoList
//
//  Created by Ivan Nikitin on 29/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

class Configurator {
    func configure(_ cell: UITableViewCell, with todo: ToDoMO) {
        cell.textLabel?.text = todo.title
        cell.detailTextLabel?.text = todo.dueDate?.formatted
        if let imageData = todo.image {
            cell.imageView?.image = UIImage(data: imageData)
        }
    }
    
    func getConfigureCell(in controller: ToDoItemViewController, forSection section: Int) -> UITableViewCell {
        let isEditing = controller.isEditing
        let value = controller.todo.values[section]
        if let value = value as? String {
            let cell = controller.tableView.dequeueReusableCell(withIdentifier: "StringCell") as! StringCell
            if isEditing {
                cell.label.isHidden = true
                cell.textField.isHidden = false
                cell.textField.text = value
            } else {
                cell.textField.isHidden = true
                cell.label.isHidden = false
                cell.label.text = value
            }
            cell.delegate = controller
            cell.section = section
            return cell
        } else if let value = value as? Bool {
            let cell = controller.tableView.dequeueReusableCell(withIdentifier: "BoolCell") as! BoolCell
            cell.isCompleteSwitch.isOn = value
            if isEditing {
                cell.isCompleteSwitch.isEnabled = true
                cell.isCompleteSwitch.isOn = value
            } else {
                cell.isCompleteSwitch.isEnabled = false
                cell.isCompleteSwitch.isOn = value
            }
            cell.delegate = controller
            cell.section = section
            return cell
        } else if let value = value as? Date {
            let cell = controller.tableView.dequeueReusableCell(withIdentifier: "StringCell") as! StringCell
            
            if isEditing {
                
                let datePicker = UIDatePicker()
                datePicker.datePickerMode = .date
                cell.textField.inputView = datePicker
                
                let toolBarDatePicker = UIToolbar()
                toolBarDatePicker.barStyle = .blackTranslucent
                toolBarDatePicker.isTranslucent = true
                toolBarDatePicker.tintColor = UIColor.white
                toolBarDatePicker.sizeToFit()
                
                let doneButtonDate = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: controller, action: #selector(controller.textFieldEndEdeting))
                toolBarDatePicker.setItems([doneButtonDate], animated: false)
                toolBarDatePicker.isUserInteractionEnabled = true
                
                cell.textField.inputAccessoryView = toolBarDatePicker
                
                cell.textField.isHidden = false
                cell.label.isHidden = true
                cell.textField.text = value.formatted
            } else {
                cell.textField.isHidden = true
                cell.label.isHidden = false
                cell.label.text = value.formatted
            }
            cell.delegate = controller
            cell.section = section
            
            return cell
        }
        return UITableViewCell()
    }
}
