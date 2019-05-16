//
//  BoolCell.swift
//  ToDoList
//
//  Created by Ivan Nikitin on 29/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

class BoolCell: UITableViewCell {

    @IBOutlet weak var isCompleteSwitch: UISwitch!
    
    weak var delegate: CellActionDelegate?
    var section: Int! 

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        delegate?.cell(switchToddled: isCompleteSwitch, forSection: section)
    }
    

}
