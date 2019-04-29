//
//  StringCell.swift
//  ToDoList
//
//  Created by Ivan Nikitin on 29/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

class StringCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: CellActionDelegate?
    var section: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func editingEnded(_ sender: UITextField) {
        delegate?.cell(editingEnded: sender, forSection: section)
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        delegate?.cell(textChanged: sender, forSection: section)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
