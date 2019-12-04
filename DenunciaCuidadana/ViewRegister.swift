//
//  ViewRegister.swift
//  DenunciaCuidadana
//
//  Created by Humberto Meza on 04/11/19.
//  Copyright © 2019 Humberto Meza. All rights reserved.
//

import UIKit

class ViewRegister: UIViewController {
    
    var fechaRegister = String()
    
    
    let tuDatePicker: UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tag = 0 //Aqui solo si le quieres poner un identificador
        
        return datePicker
    }()
    
    let txtFieldPassword: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1
        textField.placeholder = "Contraseña"
        textField.isSecureTextEntry = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let txtFieldDate: UITextField = {
           let textField = UITextField()
           textField.layer.cornerRadius = 20
           textField.layer.borderWidth = 1
           textField.placeholder = "Fecha de nacimiento"
           textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
           textField.leftViewMode = .always
           textField.translatesAutoresizingMaskIntoConstraints = false
           return textField
       }()
    
    let txtFieldRepeatPassword: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        textField.placeholder = "Repetir contraseña"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        textField.leftViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let txtFieldName: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1
        textField.placeholder = "Nombre"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        textField.leftViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let txtFieldLastName: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1
        textField.placeholder = "Apellido"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        textField.leftViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let txtFieldEmail: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1
        textField.placeholder = "Correo electrónico"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        textField.leftViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    var btnRegister: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Registrarse", for: .normal)
        button.backgroundColor = UIColor(red: 12/255, green: 207/255, blue: 58/255, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let Screen = globalVariables()
    var screenWidth: CGFloat = 0
    var screenHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenWidth = Screen.screenSize.width
        screenHeight = Screen.screenSize.height
        configureComponents()
    }
    
    func configureComponents(){
        
        view.addSubview(txtFieldName)
        txtFieldName.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        txtFieldName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        txtFieldName.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7).isActive = true
        txtFieldName.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.11).isActive = true
        
        view.addSubview(txtFieldLastName)
        txtFieldLastName.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        txtFieldLastName.topAnchor.constraint(equalTo: txtFieldName.safeAreaLayoutGuide.bottomAnchor, constant: screenHeight/35).isActive = true
        txtFieldLastName.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7).isActive = true
        txtFieldLastName.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.11).isActive = true
        
        view.addSubview(txtFieldPassword)
        txtFieldPassword.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        txtFieldPassword.topAnchor.constraint(equalTo: txtFieldLastName.safeAreaLayoutGuide.bottomAnchor, constant: screenHeight/35).isActive = true
        txtFieldPassword.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7).isActive = true
        txtFieldPassword.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.11).isActive = true
        
        view.addSubview(txtFieldRepeatPassword)
        txtFieldRepeatPassword.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        txtFieldRepeatPassword.topAnchor.constraint(equalTo: txtFieldPassword.safeAreaLayoutGuide.bottomAnchor, constant: screenHeight/35).isActive = true
        txtFieldRepeatPassword.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7).isActive = true
        txtFieldRepeatPassword.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.11).isActive = true
        
        view.addSubview(txtFieldEmail)
        txtFieldEmail.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        txtFieldEmail.topAnchor.constraint(equalTo: txtFieldRepeatPassword.safeAreaLayoutGuide.bottomAnchor, constant: screenHeight/35).isActive = true
        txtFieldEmail.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7).isActive = true
        txtFieldEmail.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.11).isActive = true
        
        view.addSubview(txtFieldDate)
        txtFieldDate.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        txtFieldDate.topAnchor.constraint(equalTo: txtFieldEmail.safeAreaLayoutGuide.bottomAnchor, constant: screenHeight/35).isActive = true
        txtFieldDate.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7).isActive = true
        txtFieldDate.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.11).isActive = true
        txtFieldDate.inputView = tuDatePicker
        
        view.addSubview(btnRegister)
        btnRegister.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        btnRegister.topAnchor.constraint(equalTo: txtFieldDate.safeAreaLayoutGuide.bottomAnchor, constant: screenHeight/35).isActive = true
        btnRegister.widthAnchor.constraint(equalTo: view
            .safeAreaLayoutGuide.widthAnchor, multiplier: 0.6).isActive = true
        btnRegister.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
        btnRegister.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        
        let toolBarFechaInicial = UIToolbar()
           toolBarFechaInicial.barStyle = UIBarStyle.default
           toolBarFechaInicial.isTranslucent = true
           toolBarFechaInicial.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
           toolBarFechaInicial.sizeToFit()

           let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneButtonFunc))
           doneButton.tintColor = .systemBlue
           let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
           let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelButtonFunc))
           cancelButton.tintColor = .systemRed
           
           toolBarFechaInicial.setItems([cancelButton, spaceButton, doneButton], animated: false)
           toolBarFechaInicial.isUserInteractionEnabled = true
        
        txtFieldDate.inputAccessoryView = toolBarFechaInicial
        
        
    }
    @objc func cambiarFecha(sender: UIDatePicker) {
        let formato = DateFormatter()
        formato.dateStyle = .medium
        formato.timeStyle = .none
        
        let fecha = sender.calendar.dateComponents([.year, .month, .day], from: sender.date)
        
        fechaRegister = "\(fecha.year!)-\(fecha.month!)-\(fecha.day!)"
        print(fechaRegister)
    }
    
    @objc func registerPressed(sender: UIDatePicker) {
        if(txtFieldName.text == "" || txtFieldLastName.text == "" || txtFieldEmail.text == "" || txtFieldPassword.text == "" || txtFieldRepeatPassword.text == "" || txtFieldDate.text == ""){
            let actionSheet = UIAlertController(title: "Dejaste algun campo vacio.", message: "Completa el registro para continuar", preferredStyle: .alert)
            actionSheet.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { (action: UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(actionSheet, animated: true, completion: nil)
            
        }else if(txtFieldPassword.text != txtFieldRepeatPassword.text){
            let actionSheet = UIAlertController(title: "Las contraseñas no coinciden", message: "", preferredStyle: .alert)
            actionSheet.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { (action: UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(actionSheet, animated: true, completion: nil)
            
        }else{
            conexion.registro(nombre: txtFieldName.text!, apellido: txtFieldLastName.text!, fecha: txtFieldDate.text!, email: txtFieldEmail.text!, password: txtFieldPassword.text!) { (respuesta, siSePudo) in
                
                  let group = DispatchGroup()
                  group.enter()
                  DispatchQueue.main.async {
                      
                      group.leave()
                  }
                  
                  group.notify(queue: .main){
                      if(siSePudo == true){
                        print(respuesta)
                        let actionSheet = UIAlertController(title: "\(respuesta)", message: "", preferredStyle: .alert)
                        actionSheet.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { (action: UIAlertAction) in
                            self.dismiss(animated: true, completion: nil)
                            self.navigationController?.popViewController(animated: true)
                        }))
                        self.present(actionSheet, animated: true, completion: nil)
                      }else{
                        let actionSheet = UIAlertController(title: "Ha ocurrido un error", message: "\(respuesta)", preferredStyle: .alert)
                        actionSheet.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { (action: UIAlertAction) in
                            self.dismiss(animated: true, completion: nil)
                        }))
                        self.present(actionSheet, animated: true, completion: nil)
                      }
                  
                  }
              }
        }
    }
    @objc func doneButtonFunc(){
        cambiarFecha(sender: tuDatePicker)
        txtFieldDate.text = fechaRegister
        self.view.endEditing(true)
        
    }
    @objc func cancelButtonFunc(){
        self.view.endEditing(true)
    }
    override open var shouldAutorotate: Bool {
           return false
    }
      
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
    }
}
