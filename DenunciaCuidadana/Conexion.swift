//
//  Conexion.swift
//  DenunciaCuidadana
//
//  Created by Humberto Meza on 22/11/19.
//  Copyright © 2019 Humberto Meza. All rights reserved.
//

import Foundation
import Alamofire
class conexion {
    
    static let linkLogin:String = "http://18.218.255.127:3000/api/login"
    static let linkRegistro:String = "http://18.218.255.127:3000/api/registro"
    static let linkCreateUser:String = "http://18.218.255.127:3000/api/miCuenta"
    static let linkCreateReport:String = "http://18.218.255.127:3000/api/crear_reporte"
    static let linkCategories:String = "http://18.218.255.127:3000/api/home/obtenerCat"
    static let linkRespuestas:String = "http://18.218.255.127:3000/api/ver_respuestas"
    
    static func login(email:String, password:String, completionHandler: @escaping (String,Bool) -> Void){
        let link = linkLogin
        let url = URL(string: link)!
        let body = ["email" : email, "password" : password]
        var datosCorrectos = false
        
        Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default).responseJSON { (response) in
            
            if let data = response.data{
                
                if let key = try? JSONDecoder().decode(Token.self, from: data){
                    print("**** TOKEN \(key.token)")
                    UserDefaults.standard.set(key.token, forKey: "accessToken")
                    datosCorrectos = true
                    completionHandler("Inicio de sesion exitoso, bienvenido!", datosCorrectos)
                }else{
                    completionHandler(String(bytes: data, encoding: .utf8)!,datosCorrectos)
                }
                
            }
            
        }
        
    }
    
    static func registro(nombre:String,apellido:String,fecha:String,email:String, password:String, completionHandler: @escaping (String,Bool) -> Void){
        let link = linkRegistro
        let url = URL(string: link)!
        let body = ["nombre": nombre,"apellido":apellido,"fechaN":fecha, "email" : email, "password" : password]
        var datosCorrectos = false
        
        Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default).responseJSON { (response) in
            if let data = response.data{
                let dato = String(bytes: data, encoding: .utf8)
                if(dato == "Usuario creado exitosamente!"){
                    datosCorrectos = true
                     completionHandler(dato!, datosCorrectos)
                     print("usuario creado")
                }else{
                    completionHandler(dato!,datosCorrectos)
                }

            }
            
        }
        
    }
    
    static func createUser(completionHandler: @escaping (usuario?,Bool?) -> Void){
        let link = linkCreateUser
        let url = URL(string: link)!
        var datosCorrectos = false
        if let token = UserDefaults.standard.string(forKey: "accessToken"){
            let header = ["Authorization" :"bearer \(token)"]
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default,headers: header).responseJSON { (response) in
            
            if let data = response.data{
                
                    if let user = try? JSONDecoder().decode(usuario.self, from: data){
                        print("**** usuario \(user.nombre)/n")
                        print("**** reporte \(user.misReportes)")
                        datosCorrectos = true
                        completionHandler(user, datosCorrectos)
                    }else{
                        completionHandler(nil, datosCorrectos)
                        print("Error al autentificar")
                    }
                
            }
            
        }
    }
        
 }
    
    static func categories(completionHandler: @escaping ([categorias],Bool) -> Void){
           let link = linkCategories
           let url = URL(string: link)!
           var datosCorrectos = false
           if let token = UserDefaults.standard.string(forKey: "accessToken"){
               let header = ["Authorization" :"bearer \(token)"]
           
           Alamofire.request(url, method: .get, encoding: JSONEncoding.default,headers: header).responseJSON { (response) in
               
               if let data = response.data{
                   
                if let category = try? JSONDecoder().decode([categorias].self, from: data){
                    print("**** Categorias \(category)")
                           datosCorrectos = true
                           completionHandler(category, datosCorrectos)
                       }else{
                           print("Error al mostrar categorias")
                       }
                   
               }
               
           }
       }
           
    }
    
    static func respuestas(completionHandler: @escaping ([Respuesta],Bool) -> Void){
           let link = linkRespuestas
           let url = URL(string: link)!
           var datosCorrectos = false
           if let token = UserDefaults.standard.string(forKey: "accessToken"){
               let header = ["Authorization" :"bearer \(token)"]
           
           Alamofire.request(url, method: .get, encoding: JSONEncoding.default,headers: header).responseJSON { (response) in
               
               if let data = response.data{
                   
                    if let category = try? JSONDecoder().decode([Respuesta].self, from: data){
                        print("**** Respuestas \(category)")
                        datosCorrectos = true
                        completionHandler(category, datosCorrectos)
                    }else{
                        print("Error al mostrar respuestas")
                    }
                   
               }
               
           }
       }
           
    }

    
    
    static func uploadImageAndData(descripcion:String,categoria:String,foto:UIImage,lat:String, lon:String, completionHandler: @escaping (Bool?) -> Void){
        //parameters
        if let token = UserDefaults.standard.string(forKey: "accessToken"){
            let header = ["Authorization" :"bearer \(token)"]
            let parameters = ["Descripcion": descripcion,"Categoria":categoria, "lat" : lat, "lon" : lon]

            Alamofire.upload(multipartFormData:{ (multipartFormData) in
            multipartFormData.append(foto.jpegData(compressionQuality: 1)!, withName: "foto", fileName: "\(lat)\(lon).jpg", mimeType: "image/jpeg")
                    for (key, value) in parameters {
                        multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                    }
            }, to: "http://18.218.255.127:3000/api/crear_reporte", method: .post, headers: header)
            { (result) in
                switch result {
                case .success(let upload, _, _):

                    upload.uploadProgress(closure: { (progress) in
                        //Print progress
                        print(progress)
                    })

                    upload.responseString { response in
                        //print response.result
                        print(response)
                        completionHandler(true)
                    }
                break
                case .failure(let encodingError):
                       //print encodingError.description
                    print(encodingError)
                    completionHandler(false)
                break
                }
            }
        
        }
    }
    
    
    
}
