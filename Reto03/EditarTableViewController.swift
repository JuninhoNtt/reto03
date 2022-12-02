//
//  EditarTableViewController.swift
//  Reto03
//
//  Created by Juninho Augusto Chero Hinojosa on 2/12/22.
//

import UIKit


protocol EditarTableViewControllerDelegate{
    
    func editarTableViewController(_ editarTableViewController: EditarTableViewController, didEditTarea tareaId: TareaId)
    
    func editarTableViewController(_ editarTableViewController:          EditarTableViewController, didDropTarea id: String?)
}

class EditarTableViewController: UITableViewController {

    
    @IBOutlet weak var editarTituloTextField: UITextField!
    
    @IBOutlet weak var editarDesTextField: UITextField!
    
    @IBOutlet weak var editarPrioridadTextField: UITextField!
    
    var valorTareaId :TareaId?
    
    
    var ordenTarea :String?

    
    var delegate:EditarTableViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let valorEntregado=valorTareaId?.tarea
        
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
        ti = des.trimmingCharacters(in: .whitespacesAndNewlines)
        ti = prio.trimmingCharacters(in: .whitespacesAndNewlines)

        
        if ti.isEmpty || des.isEmpty || prio.isEmpty {
            print("campos vacios")
            dismiss(animated: true)
        
        }else{
            let tareaMod = Tarea(titulo: ti, descripcion: des, prioridades:prio)
            
            let tareaId = TareaId(tarea: tareaMod, id: valorTareaId?.id)
            
            delegate?.editarTableViewController(self, didEditTarea: tareaId)
            dismiss(animated: true)
        }
        
      
    }
    
    
    @IBAction func cerrarButtonItem(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
    @IBAction func eliminarItemButton(_ sender: UIBarButtonItem) {
        
        delegate?.editarTableViewController(self, didDropTarea: valorTareaId?.id ?? "")
        dismiss(animated: true)
        
        
    }
    
    

   

}
