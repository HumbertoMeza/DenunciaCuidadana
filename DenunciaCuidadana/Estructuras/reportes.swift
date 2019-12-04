//
//  reportes.swift
//  DenunciaCuidadana
//
//  Created by Humberto Meza on 29/11/19.
//  Copyright © 2019 Humberto Meza. All rights reserved.
//

import Foundation
struct reportes : Codable {
    var id : Int
    var descripcion: String
    var categoria: String
    var fotoURL: String
    var latitud: String
    var longitud: String
    var fecha:String
    var id_Usuario: Int
    var id_estado: Int
}
