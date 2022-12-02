//
//  celdaTableViewCell.swift
//  Reto03
//
//  Created by Juninho Augusto Chero Hinojosa on 2/12/22.
//

import UIKit

class celdaTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nombre: celdaTableViewCell!
    
    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var prio: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
