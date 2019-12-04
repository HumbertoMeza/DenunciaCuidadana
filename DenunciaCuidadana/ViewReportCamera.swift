//
//  ViewReportCamera.swift
//  DenunciaCuidadana
//
//  Created by Humberto Meza on 05/11/19.
//  Copyright © 2019 Humberto Meza. All rights reserved.
//

import UIKit

class ViewReportCamera: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    var btnChooseTypeOfImage: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Elige la imagen", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        
//        view.addSubview(imageOfReport)
//        imageOfReport.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        imageOfReport.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        imageOfReport.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: 0.9).isActive = true
//        imageOfReport.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.9).isActive = true
        
        view.addSubview(btnChooseTypeOfImage)
        btnChooseTypeOfImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        btnChooseTypeOfImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -screenHeight/40).isActive = true
        btnChooseTypeOfImage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
        btnChooseTypeOfImage.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.1).isActive = true
        btnChooseTypeOfImage.addTarget(self, action: #selector(chooseTypeOfImagePressed), for: .touchUpInside)
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
     @objc func chooseTypeOfImagePressed(){
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
         picker.dismiss(animated: true, completion: nil)
         
     }
     func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         picker.dismiss(animated: true, completion: nil)
     }
     
    
}
