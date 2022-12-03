//
//  ListaTableViewController.swift
//  Reto03
//
//  Created by Juninho Augusto Chero Hinojosa on 2/12/22.
//

import UIKit

class ListaTableViewController: UITableViewController {
    
    var listaTareas = [Tarea]()
    let Tarea1 = Tarea(titulo: "ordenar", descripcion: "ayudar en casa", prioridades: "alta")
    let Tarea2 = Tarea(titulo: "estudiar", descripcion: "estudiar ntt data", prioridades: "alta")
    let Tarea3 = Tarea(titulo: "comer", descripcion:"comer hora almuerzo", prioridades: "baja")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        listaTareas.append(Tarea1)
        listaTareas.append(Tarea2)
        listaTareas.append(Tarea3)
        
     
    }

    @IBAction func agregarItemButton(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "agregarSegue", sender: nil)

    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaTareas.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? celdaTableViewCell
       
        cell?.nom.text  = listaTareas [indexPath.row].titulo
        cell?.des.text  = listaTareas [indexPath.row].descripcion
        cell?.prio.text  = listaTareas [indexPath.row].prioridades

        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nOrden = indexPath.row
        let tarea = listaTareas[nOrden]
        let tareaId = TareaWithID(tarea: tarea, id: nOrden)
        performSegue(withIdentifier: "segueDetalles", sender: tareaId)
    
       
    }
    
   
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("holaaaaa prepare")
        if let identifier=segue.identifier{
            
            switch identifier{
            case "segueDetalles" :
                let destino=segue.destination as? EditarTableViewController
                destino?.tareaWithID = sender as? TareaWithID
                destino?.delegate = self
            case "agregarSegue" :
                let destino=segue.destination as? CreateTableViewController
                destino?.delegate = self
            default :
                print("error identifier")
            }
           
        }
    }
    

}

extension ListaTableViewController : CreateTableViewControllerDelegate {
    
    
    func createTableViewController(_ createTableViewController: CreateTableViewController, didCreateTarea newTarea: Tarea) {
        listaTareas.append(newTarea)
        tableView.reloadData()
    }
}

extension ListaTableViewController : EditarTableViewControllerDelegate {
    func editarTableViewController(_ editarTableViewController: EditarTableViewController, didDropTarea id: Int?) {
        
          if let id = id {
             listaTareas.remove(at: id)
              tableView.reloadData()
           }
    }
    
    
    
    func editarTableViewController(_ editarTableViewController: EditarTableViewController, didEditTarea tareaWithID: TareaWithID) {
        let id = tareaWithID.id
        if let id = id {
                
                listaTareas[id].titulo = tareaWithID.tarea.titulo
                listaTareas[id].descripcion = tareaWithID.tarea.descripcion
                listaTareas[id].prioridades = tareaWithID.tarea.prioridades
                tableView.reloadData()
            }
   
        
    }
}


