//
//  Tarea.swift
//  Reto03
//
//  Created by Juninho Augusto Chero Hinojosa on 2/12/22.
//

import Foundation

struct Tarea{
    
    var titulo : String
    var descripcion : String
    var prioridades : String
    
}

struct TareaWithID {
    let tarea:Tarea
    let id:Int?
}
