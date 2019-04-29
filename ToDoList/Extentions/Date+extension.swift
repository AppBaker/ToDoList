//
//  Date+extension.swift
//  ToDoList
//
//  Created by Ivan Nikitin on 29/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import Foundation

extension Date {
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale.current
        
        return formatter.string(from: self)
    }
}
