//
//  usuario.swift
//  DenunciaCuidadana
//
//  Created by Humberto Meza on 22/11/19.
//  Copyright © 2019 Humberto Meza. All rights reserved.
//

import Foundation
struct usuario: Codable {
    var id: Int
    var nombre: String
    var apellido: String
    var fecha_de_nacimiento: String
    var email: String
    var es_Administrador: Int
    var misReportes : [reportes]
    
}
