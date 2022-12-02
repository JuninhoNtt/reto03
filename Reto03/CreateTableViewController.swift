//
//  CreateTableViewController.swift
//  Reto03
//
//  Created by Juninho Augusto Chero Hinojosa on 2/12/22.
//

import UIKit

protocol CreateTableViewControllerDelegate{
    
    func createTableViewController(_ createTableViewController: CreateTableViewController, didCreateTarea newTarea: Tarea)
}

class CreateTableViewController: UITableViewController {

    @IBOutlet var itemsTablaView: UITableView!
    
    
    @IBOutlet weak var tituloTextField: UITextField!
    
    @IBOutlet weak var descriTextField: UITextField!
    
    @IBOutlet weak var prioridadTextField: UITextField!
    
    var delegate:CreateTableViewControllerDelegate?

    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        tituloTextField.placeholder = "Ingrese titulo "
        descriTextField.placeholder = "Ingrese Descripcion"
        prioridadTextField.placeholder = "Ingrese Prioridad"
        itemsTablaView.backgroundColor = UIColor.blue
            
    
    }

   
    @IBAction func cerrarButtonItem(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func guardarButtonItem(_ sender: UIBarButtonItem) {
        

        
        var ti = tituloTextField.text ?? ""
        let des = descriTextField.text ?? ""
        let prio = prioridadTextField.text ?? ""
        
        
        ti = ti.trimmingCharacters(in: .whitespacesAndNewlines)
        ti = des.trimmingCharacters(in: .whitespacesAndNewlines)
        ti = prio.trimmingCharacters(in: .whitespacesAndNewlines)

    
        if ti.isEmpty || des.isEmpty || prio.isEmpty {
            print("campos vacios")
            dismiss(animated: true)
        
        } else {
            
            let tarea = Tarea(titulo: ti , descripcion: des, prioridades:prio)
            delegate?.createTableViewController(self, didCreateTarea: tarea)
            dismiss(animated: true)

        }
        
       

        }
        
    
}
