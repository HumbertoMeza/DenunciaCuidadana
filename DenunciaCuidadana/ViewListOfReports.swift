//
//  ViewListOfReports.swift
//  DenunciaCuidadana
//
//  Created by Humberto Meza on 13/11/19.
//  Copyright © 2019 Humberto Meza. All rights reserved.
//

import UIKit

struct CellData {
    let imageOfStatus : UIImage?
    let typeOfReport : String?
    let date : String?
}

@available(iOS 13.0, *)
class ViewListOfReports: UITableViewController {
    
    var reportes:[reportes] = []
    var listaDeRespuestas:[Respuesta] = []
    
    var data = [CellData]()
    let greenCircle = UIImage(named: "greenCircle")
    let redCircle = UIImage(named: "redCircle")
    let orangeCircle = UIImage(named: "orangeCircle")
    let grayCircle = UIImage(named: "grayCircle")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Mis reportes"
//€
        
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.navigationItem.title = "Mis reportes"
        conexion.createUser { (user, siSePudo) in
            let group = DispatchGroup()
            group.enter()
            DispatchQueue.main.async {
                
                
                group.leave()
            }
            
            group.notify(queue: .main){
                if(siSePudo == true){
                    self.reportes = user!.misReportes
                    self.tableView.reloadData()
                    print("REPORTES **********************")
                    print(self.reportes)
                }else{
                    print("No se pudo compa")
                    //alerta
                }
            
            }
        }
        
        conexion.respuestas { (Respuesta, siSePudo) in
            let group = DispatchGroup()
            group.enter()
            DispatchQueue.main.async {
                
                
                group.leave()
            }
            
            group.notify(queue: .main){
                if(siSePudo == true){
                    
                    self.listaDeRespuestas = Respuesta
                    self.tableView.reloadData()
                }else{
                   
                }
            
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
        if let soloFecha = reportes[indexPath.row].fecha.range(of: "T") {
                reportes[indexPath.row].fecha.removeSubrange(soloFecha.lowerBound..<reportes[indexPath.row].fecha.endIndex)
        }
        
        if(reportes[indexPath.row].id_estado == 1){
            cell.imageOfStatus = self.grayCircle
            cell.typeOfReport = self.reportes[indexPath.row].categoria
            cell.date = self.reportes[indexPath.row].fecha
        }else if(reportes[indexPath.row].id_estado == 2){
            cell.imageOfStatus = self.orangeCircle
            cell.typeOfReport = self.reportes[indexPath.row].categoria
            cell.date = self.reportes[indexPath.row].fecha
        }else if(reportes[indexPath.row].id_estado == 3){
            cell.imageOfStatus = self.greenCircle
            cell.typeOfReport = self.reportes[indexPath.row].categoria
            cell.date = self.reportes[indexPath.row].fecha
        }else if(reportes[indexPath.row].id_estado == 4){
            cell.imageOfStatus = self.redCircle
            cell.typeOfReport = self.reportes[indexPath.row].categoria
            cell.date = self.reportes[indexPath.row].fecha
        }

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var respuestaDeReporte = "No hay respuesta para este reporte"
        var estado = "Pendiente"
        var administrador = ""
        
        for respuesta in listaDeRespuestas {
            if reportes[indexPath.row].id == respuesta.id_Reporte {
                respuestaDeReporte = respuesta.respuesta
                estado = respuesta.estado
                administrador = "Administrador: \(respuesta.nombre) \(respuesta.apellido)"
            }
        }
        
        let alerta = UIAlertController(title: "Respuesta", message: "\(respuestaDeReporte)\n\n\(administrador)\n\nEstado: \(estado)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .default)
        
        alerta.addAction(action)
        self.present(alerta, animated: true, completion: nil)
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reportes.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
