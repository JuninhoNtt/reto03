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

    
    @IBOutlet private weak var editarTituloTextField: UITextField!
    @IBOutlet private weak var editarDesTextField: UITextField!
    @IBOutlet private weak var editarPrioridadTextField: UITextField!
    
    @IBOutlet weak var guardarButton: UIButton!
    
    @IBOutlet weak var editarButtonn: UIButton!
    
    var tareaWithID :TareaWithID?
    
    var delegate:EditarTableViewControllerDelegate?
    
    var tituloOriginal:String?
    var descripOriginal:String?
    var prioridadOriginal:String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let valorEntregado=tareaWithID?.tarea
        
        editarTituloTextField.text = valorEntregado?.titulo
        editarDesTextField.text = valorEntregado?.descripcion
        editarPrioridadTextField.text = valorEntregado?.prioridades
        guardarButton.isEnabled = false
        configurarCampos()
        
       
    }
    
    private func configurarCampos(){
        
        activarLabel(enabled: false)

        editarTituloTextField.placeholder = "Ingresar Nombre"
        editarDesTextField.placeholder = "Ingresar Nombre"
        editarPrioridadTextField.placeholder = "Ingresar Nombre"
    }
    
    private func activarLabel(enabled: Bool){
        editarTituloTextField.isEnabled = enabled
        editarDesTextField.isEnabled = enabled
        editarPrioridadTextField.isEnabled = enabled
    }
    
    
    @IBAction func cerrarButtonItem(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
    @IBAction func editarButton(_ sender: UIButton) {
        tituloOriginal = editarTituloTextField.text
        descripOriginal = editarDesTextField.text
        prioridadOriginal = editarPrioridadTextField.text
        guardarButton.isEnabled = true
        editarButtonn.isEnabled = false

        activarLabel(enabled: true)
    }
    
    @IBAction func guardarButton(_ sender: UIButton) {
    
        var titulo = editarTituloTextField.text ?? ""
        var description = editarDesTextField.text ?? ""
        var prioridad = editarPrioridadTextField.text ?? ""
        
        titulo = titulo.trimmingCharacters(in: .whitespacesAndNewlines)
        description = description.trimmingCharacters(in: .whitespacesAndNewlines)
        prioridad = prioridad.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        if titulo.isEmpty || description.isEmpty || prioridad.isEmpty {
            mostrarAlerta(titulo:"Editar" , mensaje: "tienes campos vacios")
        
        }else{
          
            if titulo == tituloOriginal && description == descripOriginal && prioridad == prioridadOriginal{
                mostrarAlertaEditar(titulo: "Editar", mensaje: "dejar de editar?, No tienes cambios")
            }else{
                let tareaMod = Tarea(titulo: titulo, descripcion: description, prioridades:prioridad)
                let tareaWithID = TareaWithID(tarea: tareaMod, id: tareaWithID?.id)
                delegate?.editarTableViewController(self, didEditTarea: tareaWithID)
                dismiss(animated: true)
            }
        }
        
        
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
    
    private func mostrarAlertaEditar(titulo:String, mensaje : String){
        let alert = UIAlertController(title: titulo, message:  mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Salir", style: .default, handler: {action in
            self.editarButtonn.isEnabled = true
            self.guardarButton.isEnabled = false
            self.activarLabel(enabled: false)
        }))
        alert.addAction(UIAlertAction(title: "Continuar", style: .cancel))
        present(alert, animated: true)
    }
    
    

   

}
