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

    @IBOutlet private weak var tituloTextField: UITextField!
    @IBOutlet private weak var descriTextField: UITextField!
    @IBOutlet private weak var prioridadTextField: UITextField!
    
    var delegate:CreateTableViewControllerDelegate?

        override func viewDidLoad() {
        super.viewDidLoad()
        placeHolderField()
       
     
    }
    
    private func placeHolderField(){
        tituloTextField.placeholder = "Ingrese titulo "
        descriTextField.placeholder = "Ingrese Descripcion"
        prioridadTextField.placeholder = "Ingrese Prioridad"
    }

   
    @IBAction func cerrarButtonItem(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func guardarButtonItem(_ sender: UIBarButtonItem) {
    
        var titulo = tituloTextField.text ?? ""
        var descripcion = descriTextField.text ?? ""
        var prioridad = prioridadTextField.text ?? ""
        
        titulo = titulo.trimmingCharacters(in: .whitespacesAndNewlines)
        descripcion = descripcion.trimmingCharacters(in: .whitespacesAndNewlines)
        prioridad = prioridad.trimmingCharacters(in: .whitespacesAndNewlines)

        if titulo.isEmpty || descripcion.isEmpty || prioridad.isEmpty {
            alertaSimple(titulo: "Error", mensaje: "tienes campos vacios")
        } else {
            let tarea = Tarea(titulo: titulo , descripcion: descripcion, prioridades:prioridad)
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
