//
//  Respuestas.swift
//  DenunciaCuidadana
//
//  Created by Humberto Meza on 02/12/19.
//  Copyright © 2019 Humberto Meza. All rights reserved.
//

import Foundation

struct Respuesta: Codable {
    var id: Int
    var respuesta: String
    var id_Reporte: Int
    var nombre: String
    var apellido: String
    var idUsuario: Int
    var estado: String
    
}
