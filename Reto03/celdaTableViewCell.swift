//
//  celdaTableViewCell.swift
//  Reto03
//
//  Created by Juninho Augusto Chero Hinojosa on 2/12/22.
//

import UIKit

class celdaTableViewCell: UITableViewCell {
    
   
    @IBOutlet private weak var nombreLabel: UILabel!
    @IBOutlet private weak var descriLabel: UILabel!
    @IBOutlet private weak var prioridadLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setup(tarea: Tarea){
        nombreLabel.text = tarea.titulo
        descriLabel.text = tarea.descripcion
        prioridadLabel.text = tarea.prioridades

    }

}
