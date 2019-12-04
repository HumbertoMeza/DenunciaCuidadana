//
//  ViewController.swift
//  DenunciaCuidadana
//
//  Created by Humberto Meza on 31/10/19.
//  Copyright © 2019 Humberto Meza. All rights reserved.
//

import UIKit

class globalVariables{
    let screenSize: CGRect = UIScreen.main.bounds
}

class ViewController: UIViewController {
    
    let imageViewLogo: UIImageView = {
        let theImageView = UIImageView()
        
        theImageView.image = UIImage(named: "LogoLogin")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return theImageView
    }()
    

    let txtFieldEmail: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1
        textField.text = "jadmin@web.com"
        textField.placeholder = "Correo electrónico"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        textField.leftViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let txtFieldPassword: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1
        textField.placeholder = " Contraseña"
        textField.text = "absd1234%"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let lblRegisterTxt: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "¿No tienes una cuenta?,"

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let viewData: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var btnLogin: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Iniciar sesión", for: .normal)
        button.backgroundColor = UIColor(red: 87/255, green: 185/255, blue: 229/255, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let btnRegister: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.textAlignment = .left
        button.setTitle("Crea una cuenta", for: .normal)
        button.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 140/255, alpha: 0)
        button.setTitleColor(.orange, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let Screen = globalVariables()
    var screenWidth: CGFloat = 0
    var screenHeight: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Inicio de sesion"
//        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.prefersLargeTitles = true
        
        screenWidth = Screen.screenSize.width
        screenHeight = Screen.screenSize.height
        
        configureComponents()
        
    }
    
    override open var shouldAutorotate: Bool {
         return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    func configureComponents(){
        
        view.addSubview(imageViewLogo)
        imageViewLogo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageViewLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: screenHeight/30).isActive = true
        imageViewLogo.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
        imageViewLogo.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        
        view.addSubview(viewData)
        viewData.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        viewData.topAnchor.constraint(equalTo: imageViewLogo.bottomAnchor).isActive = true
        viewData.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
        viewData.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.57).isActive = true
        
        viewData.addSubview(txtFieldEmail)
        txtFieldEmail.topAnchor.constraint(equalTo: viewData.safeAreaLayoutGuide.topAnchor, constant: screenHeight/17).isActive = true
        txtFieldEmail.centerXAnchor.constraint(equalTo: viewData.safeAreaLayoutGuide.centerXAnchor).isActive = true
        txtFieldEmail.heightAnchor.constraint(equalTo: viewData.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15).isActive = true
        txtFieldEmail.widthAnchor.constraint(equalTo: viewData.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
        
        viewData.addSubview(txtFieldPassword)
        txtFieldPassword.topAnchor.constraint(equalTo: viewData.safeAreaLayoutGuide.topAnchor, constant: screenHeight/6).isActive = true
        txtFieldPassword.centerXAnchor.constraint(equalTo: viewData.safeAreaLayoutGuide.centerXAnchor).isActive = true
        txtFieldPassword.heightAnchor.constraint(equalTo: viewData.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15).isActive = true
        txtFieldPassword.widthAnchor.constraint(equalTo: viewData.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
        
        
        viewData.addSubview(btnLogin)
        btnLogin.topAnchor.constraint(equalTo: viewData.safeAreaLayoutGuide.topAnchor, constant: screenHeight/3.5).isActive = true
        btnLogin.centerXAnchor.constraint(equalTo: viewData.safeAreaLayoutGuide.centerXAnchor).isActive = true
        btnLogin.widthAnchor.constraint(equalTo: viewData.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7).isActive = true
        btnLogin.heightAnchor.constraint(equalTo: viewData.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15).isActive = true
        btnLogin.titleLabel!.font =  UIFont(name: "Arial", size: 0.05*screenWidth)
        btnLogin.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        
        viewData.addSubview(lblRegisterTxt)
        lblRegisterTxt.leadingAnchor.constraint(equalTo: viewData.safeAreaLayoutGuide.leadingAnchor, constant: screenWidth/10).isActive = true
        lblRegisterTxt.topAnchor.constraint(equalTo: viewData.safeAreaLayoutGuide.topAnchor, constant: screenHeight/2.6).isActive = true
        lblRegisterTxt.font = UIFont(name: "Arial", size: 0.03*screenWidth)
        
        viewData.addSubview(btnRegister)
        btnRegister.centerYAnchor.constraint(equalTo: lblRegisterTxt.centerYAnchor).isActive = true
        btnRegister.leadingAnchor.constraint(equalTo: lblRegisterTxt.trailingAnchor, constant: screenWidth/70).isActive = true
        btnRegister.titleLabel!.font =  UIFont(name: "Arial", size: 0.03*screenWidth)
        btnRegister.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backButton = UIBarButtonItem()
        
        switch segue.identifier {
        case "goToRegister":
            backButton.title = "Inicio de sesión"
            navigationItem.backBarButtonItem = backButton
        break
        case "goToReport":
            backButton.title = "back"
            navigationItem.backBarButtonItem = backButton
            self.navigationController?.navigationItem.hidesBackButton = true
        default:
            backButton.title = "Back"
            navigationItem.backBarButtonItem = backButton
        }
    }
    
    
    @objc func registerPressed(){
         performSegue(withIdentifier: "goToRegister", sender: nil)
    }
    @objc func loginPressed(){
        if(txtFieldEmail.text! == "" || txtFieldPassword.text! == ""){
            
            let actionSheet = UIAlertController(title: "Dejaste algun campo vacio.", message: "Completa el inicio de sesion para continuar", preferredStyle: .alert)
            actionSheet.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { (action: UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(actionSheet, animated: true, completion: nil)
        }else{
            
            conexion.login(email: txtFieldEmail.text!, password: txtFieldPassword.text!) { (respuesta, siSePudo) in
            
                let group = DispatchGroup()
                group.enter()
                DispatchQueue.main.async {
                    
                    
                    group.leave()
                }
                
                group.notify(queue: .main){
                    if(siSePudo){
                            
                            let actionSheet = UIAlertController(title: "Bienvenido.", message: "", preferredStyle: .alert)
                            actionSheet.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { (action: UIAlertAction) in
                                
                                self.dismiss(animated: true, completion: nil)
                                self.performSegue(withIdentifier: "goToReport", sender: nil)
                            }))
                           
                        
                        self.present(actionSheet, animated: true, completion: nil)
                    }else{
                        print("No se pudo compa")
                        //alerta
                    }
                
                }
                
            }
        }
    }
    @objc func reportPressed(){
           performSegue(withIdentifier: "goToReport", sender: nil)
    }
    
}
