//
//  UIDatePicker+extension.swift
//  ToDoList
//
//  Created by Ivan Nikitin on 20/05/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

extension UIDatePicker {
    func numberOfSection(_ section: Int) -> Int {
        return section
    }
}

class MyUIDatePicker: UIDatePicker {
    var indexPath: IndexPath?
}
