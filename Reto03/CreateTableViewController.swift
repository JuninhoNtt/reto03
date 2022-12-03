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
        var des = descriTextField.text ?? ""
        var prio = prioridadTextField.text ?? ""
        
        
        ti = ti.trimmingCharacters(in: .whitespacesAndNewlines)
        des = des.trimmingCharacters(in: .whitespacesAndNewlines)
        prio = prio.trimmingCharacters(in: .whitespacesAndNewlines)

    
        if ti.isEmpty || des.isEmpty || prio.isEmpty {
            alertaSimple(titulo: "Error", mensaje: "tienes campos vacios")
        } else {
            let tarea = Tarea(titulo: ti , descripcion: des, prioridades:prio)
            alertaAccion(titulo: "Crear Tarea", mensaje: "estas seguro de crear esta tarea?", tarea: tarea)
         
        }
        
       

        }
    
    private func alertaSimple(titulo:String, mensaje : String){
        let alert = UIAlertController(title: titulo, message:  mensaje, preferredStyle: .alert)
        alert.view.subviews.first?.subviews.first?.backgroundColor = UIColor.white
        alert.addAction(UIAlertAction(title: "Cerrar", style: .cancel))
        present(alert, animated: true)
    }
    
    private func alertaAccion(titulo:String, mensaje : String, tarea :Tarea){
        let alert = UIAlertController(title: titulo, message:  mensaje, preferredStyle: .alert)
        alert.view.subviews.first?.subviews.first?.backgroundColor = UIColor.white
        alert.addAction(UIAlertAction(title: "Cerrar", style: .cancel))
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            self.crearItem(tarea: tarea)
        }))
        present(alert, animated: true)
    }
    
    private func crearItem(tarea : Tarea){
        
        delegate?.createTableViewController(self, didCreateTarea: tarea)
        dismiss(animated: true)
        
    }
    
        
    
}
