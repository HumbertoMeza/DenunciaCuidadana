//
//  ViewReportDescription.swift
//  DenunciaCuidadana
//
//  Created by Humberto Meza on 05/11/19.
//  Copyright © 2019 Humberto Meza. All rights reserved.
//

import UIKit

class ViewReportDescription: UIViewController, UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource,UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
    var pickerData = [String]()
    var hayImagen: Bool = false
    var typeOfReport = String()
    
    var arrayOfCategories = [categorias]()
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.backgroundColor = UIColor(red: 145/255, green: 145/255, blue: 145/255, alpha: 0.8)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let lblMap: UILabel = {
        let label = UILabel()
        label.text = "Selecciona la ubicación en el mapa"
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pickerTypeOfReport: UIPickerView = {
        let picker = UIPickerView()
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    let btnCamera: UIButton = {
        let button = UIButton(type: .custom)
        if let image = UIImage(named: "camera") {
            button.setImage(image, for: .normal)
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let btnMap: UIButton = {
        let button = UIButton(type: .custom)
        if let image = UIImage(named: "mapImg2") {
             button.setImage(image, for: .normal)
         }
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
    
    let txtFieldTypeOfReport: UITextField = {
           let textField = UITextField()
           textField.layer.cornerRadius = 20
           textField.layer.borderWidth = 1
        textField.text = ""
           textField.placeholder = "Selecciona un caso"
           textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
           textField.leftViewMode = .always
        textField.textAlignment = .center
        
           textField.translatesAutoresizingMaskIntoConstraints = false
           return textField
       }()
    
    let txtViewDescription: UITextView = {
       let textView = UITextView()
        textView.layer.borderWidth = 1
        textView.textAlignment = .left
        textView.text = "Agrega una descripción del caso y una foto (Opcional)"
        textView.textColor = .lightGray
        textView.font = UIFont(name: "Arial", size: 18)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let Screen = globalVariables()
    var screenWidth: CGFloat = 0
    var screenHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenWidth = Screen.screenSize.width
        screenHeight = Screen.screenSize.height
        txtViewDescription.delegate = self
        txtViewDescription.returnKeyType = .done
        pickerTypeOfReport.delegate = self
        pickerTypeOfReport.dataSource = self
        configureComponents()
        conexion.categories { (category, siSePudo) in
            let group = DispatchGroup()
            group.enter()
            DispatchQueue.main.async {
                
                
                group.leave()
            }
            
            group.notify(queue: .main){
                if(siSePudo){
                    self.arrayOfCategories = category
                    for categorias in category{
                        self.pickerData.append(categorias.nombre)
                    }
                }else{
                    print("No se pudo compa")
                    //alerta
                }
            
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.navigationItem.title = "Crear un reporte"
        
    }
     func textViewDidBeginEditing(_ textView: UITextView) {
        if txtViewDescription.text == "Agrega una descripción del caso y una foto (Opcional)" {
            txtViewDescription.text = ""
            txtViewDescription.textColor = .black
        }
    }
    
    func configureComponents(){
        
         view.addSubview(txtFieldTypeOfReport)
         txtFieldTypeOfReport.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
         txtFieldTypeOfReport.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: screenHeight/30).isActive = true
        txtFieldTypeOfReport.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
        txtFieldTypeOfReport.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        txtFieldTypeOfReport.inputView = pickerTypeOfReport
        
        view.addSubview(txtViewDescription)
             txtViewDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
             txtViewDescription.topAnchor.constraint(equalTo: txtFieldTypeOfReport.bottomAnchor, constant: screenHeight/30).isActive = true
             txtViewDescription.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6).isActive = true
             txtViewDescription.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
        
        view.addSubview(imageView)
           imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
           imageView.centerYAnchor.constraint(equalTo: txtViewDescription.centerYAnchor).isActive = true
           imageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3).isActive = true
           imageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
        
        view.addSubview(btnCamera)
        btnCamera.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        btnCamera.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        btnCamera.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.1).isActive = true
        btnCamera.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.1).isActive = true
        btnCamera.addTarget(self, action: #selector(cameraPressed), for: .touchUpInside)
        
        
        let toolBarFechaInicial = UIToolbar()
           toolBarFechaInicial.barStyle = UIBarStyle.default
           toolBarFechaInicial.isTranslucent = true
           toolBarFechaInicial.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
           toolBarFechaInicial.sizeToFit()

           let doneButton = UIBarButtonItem(title: "Listo", style: UIBarButtonItem.Style.done, target: self, action: #selector(donePressed))
           doneButton.tintColor = .systemBlue
           let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
           let cancelButton = UIBarButtonItem(title: "Cancelar", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelPressed))
           cancelButton.tintColor = .systemRed
           
           toolBarFechaInicial.setItems([cancelButton, spaceButton, doneButton], animated: false)
           toolBarFechaInicial.isUserInteractionEnabled = true
        
        txtFieldTypeOfReport.inputAccessoryView = toolBarFechaInicial
        
        view.addSubview(lblMap)
        lblMap.topAnchor.constraint(equalTo: txtViewDescription.bottomAnchor, constant: screenHeight/30).isActive = true
        lblMap.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
//        lblMap.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3).isActive = true
//        lblMap.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.1).isActive = true
//        btnMap.addTarget(self, action: #selector(mapPressed), for: .touchUpInside)
        
        view.addSubview(btnMap)
        btnMap.topAnchor.constraint(equalTo: lblMap.bottomAnchor, constant: screenHeight/30).isActive = true
        btnMap.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
                
        btnMap.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3).isActive = true
        btnMap.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3).isActive = true
        btnMap.addTarget(self, action: #selector(mapPressed), for: .touchUpInside)
    }
    
    @objc func mapPressed(){
        if(txtFieldTypeOfReport.text != "" && txtViewDescription.text != "Agrega una descripción del caso y una foto (Opcional)" && hayImagen == true){
            performSegue(withIdentifier: "goToMap", sender: nil)
        }else{
            let actionSheet = UIAlertController(title: "Dejaste algun campo vacio.", message: "Llena todos los campos antes de continuar", preferredStyle: .alert)
            actionSheet.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { (action: UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(actionSheet, animated: true, completion: nil)
        }
    }
    
    @objc func donePressed(){
        self.view.endEditing(true)
            txtFieldTypeOfReport.text = typeOfReport
        
    }
    
    @objc func cancelPressed(){
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
    }
      
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     return pickerData.count
     }
     
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
     }
     
     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
       typeOfReport = pickerData[row]
     }
     @objc func cameraPressed(){
           let imagePickerController = UIImagePickerController()
           imagePickerController.delegate = self
           
           let actionSheet = UIAlertController(title: "Escoge tu imagen", message: "", preferredStyle: .actionSheet)
           actionSheet.addAction(UIAlertAction(title: "Cámara", style: .default, handler: { (action: UIAlertAction) in
               print("Camara")
               
               if UIImagePickerController.isSourceTypeAvailable(.camera) {
                   imagePickerController.sourceType = .camera
                   self.present(imagePickerController, animated: true, completion: nil)
               }else {
                   print("No hay camara")
               }
               
               
           }))
           
           actionSheet.addAction(UIAlertAction(title: "Librería", style: .default, handler: { (action: UIAlertAction) in
               print("Libreria")
               
               
               
               if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                   imagePickerController.sourceType = .photoLibrary
                   self.present(imagePickerController, animated: true, completion: nil)
               }else {
                   print("No se pudo xd")
               }
               
               
           }))
           
           actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: nil))

           self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
          let image = info[.originalImage] as! UIImage
          imageView.image = image
          self.hayImagen = true
        
        //GUARDAR IMAGEN EN GALERIA
//       UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveImage(_:didFinishSavingWithError:contextInfo:)), nil)
          picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
          picker.dismiss(animated: true, completion: nil)
    }
    
    override open var shouldAutorotate: Bool {
           return false
    }
      
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMap"{
            let destinationVC = segue.destination as! ViewReportGPS
            
            for categories in arrayOfCategories {
                if(categories.nombre == typeOfReport){
                    typeOfReport = String(categories.id)
                }
            }
            destinationVC.typeOfReport = typeOfReport
            destinationVC.reportDescription = txtViewDescription.text!
            destinationVC.imageOfReport = imageView
            
            //self.imageView.image = UIImage()
            self.txtFieldTypeOfReport.text = ""
            self.txtViewDescription.text = "Agrega una descripción del caso y una foto (Opcional)"
            self.txtViewDescription.textColor = UIColor.gray
            self.hayImagen = false
        }
    }
    
    
//    @objc func saveImage(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
//        if let error = error {
//            // we got back an error!
//            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
//            ac.addAction(UIAlertAction(title: "OK", style: .default))
//            present(ac, animated: true)
//        } else {
//            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
//            ac.addAction(UIAlertAction(title: "OK", style: .default))
//            present(ac, animated: true)
//        }
//    }
    
    
    
    
}
