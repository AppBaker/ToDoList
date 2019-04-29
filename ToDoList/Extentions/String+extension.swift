//
//  String+extension.swift
//  ToDoList
//
//  Created by Ivan Nikitin on 29/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import Foundation

extension String {
    var capitalizedWithSpaces: String {
        let withSpaces = self.reduce("") { result, character in
            character.isUppercase ? "\(result) \(character)" : "\(result)\(character)"
        }
        return withSpaces.capitalized
    }
}
