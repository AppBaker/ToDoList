//
//  CellActionProtocol.swift
//  ToDoList
//
//  Created by Ivan Nikitin on 29/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

protocol CellActionDelegate: class {
    func cell(editingEnded textField: UITextField, forSection section: Int)
    func cell(textChanged textField: UITextField, forSection section: Int)
}
