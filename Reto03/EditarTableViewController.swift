//
//  EditarTableViewController.swift
//  Reto03
//
//  Created by Juninho Augusto Chero Hinojosa on 2/12/22.
//

import UIKit


protocol EditarTableViewControllerDelegate{
    
    func editarTableViewController(_ editarTableViewController: EditarTableViewController, didEditTarea tareaWithID : TareaWithID)
    
    func editarTableViewController(_ editarTableViewController: EditarTableViewController, didDropTarea id: Int?)
}

class EditarTableViewController: UITableViewController {

    
    @IBOutlet weak var editarTituloTextField: UITextField!
    @IBOutlet weak var editarDesTextField: UITextField!
    @IBOutlet weak var editarPrioridadTextField: UITextField!
    
    var tareaWithID :TareaWithID?
    
    var delegate:EditarTableViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let valorEntregado=tareaWithID?.tarea
        
        editarTituloTextField.text = valorEntregado?.titulo
        editarDesTextField.text = valorEntregado?.descripcion
        editarPrioridadTextField.text = valorEntregado?.prioridades
        
        editarTituloTextField.placeholder = "Ingresar Nombre"
        editarDesTextField.placeholder = "Ingresar Nombre"
        editarPrioridadTextField.placeholder = "Ingresar Nombre"
    }
    
    
    @IBAction func editarButtonItem(_ sender: UIBarButtonItem) {
        
        var ti = editarTituloTextField.text ?? ""
        var des = editarDesTextField.text ?? ""
        var prio = editarPrioridadTextField.text ?? ""
        
        ti = ti.trimmingCharacters(in: .whitespacesAndNewlines)
        des = des.trimmingCharacters(in: .whitespacesAndNewlines)
        prio = prio.trimmingCharacters(in: .whitespacesAndNewlines)

        
        if ti.isEmpty || des.isEmpty || prio.isEmpty {
            mostrarAlerta(titulo:"Editar" , mensaje: "tienes campos vacios")
        
        }else{
            let tareaMod = Tarea(titulo: ti, descripcion: des, prioridades:prio)
            let tareaWithID = TareaWithID(tarea: tareaMod, id: tareaWithID?.id)
            delegate?.editarTableViewController(self, didEditTarea: tareaWithID)
            dismiss(animated: true)
        }
        
      
    }
    
    
    @IBAction func cerrarButtonItem(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
    @IBAction func eliminarItemButton(_ sender: UIBarButtonItem) {
        delegate?.editarTableViewController(self, didDropTarea: tareaWithID?.id)
        dismiss(animated: true)
        
    }
    
    
    private func mostrarAlerta(titulo:String, mensaje : String){
        let alert = UIAlertController(title: titulo, message:  mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cerrar", style: .cancel))
        present(alert, animated: true)
    }
    
    

   

}
