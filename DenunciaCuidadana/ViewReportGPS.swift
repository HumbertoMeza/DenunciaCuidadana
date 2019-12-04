//
//  ViewReportGPS.swift
//  DenunciaCuidadana
//
//  Created by Humberto Meza on 05/11/19.
//  Copyright © 2019 Humberto Meza. All rights reserved.
//
import SwiftyGif
import UIKit
import GoogleMaps

class ViewReportGPS: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate,SwiftyGifDelegate  {
    let locationManager = CLLocationManager()
    let markerOriginal = GMSMarker()
    var latitude = Double()
    var longitude = Double()
    var typeOfReport: String = ""
    var reportDescription: String = ""
    var imageOfReport: UIImageView? = nil
    
    let viewPopOver: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var gifImage: UIImageView?
    
    let btnAddReport: UIButton = {
         let button = UIButton(type: .custom)
         if let image = UIImage(named: "addReport") {
              button.setImage(image, for: .normal)
          }
          button.translatesAutoresizingMaskIntoConstraints = false
          return button
    }()
    
    let viewMap: GMSMapView = {
        let view = GMSMapView()
        
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //Toma la locacion aproximada en 100m
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        configureComponents()
        
        gifImage = UIImageView()
        gifImage!.translatesAutoresizingMaskIntoConstraints = false
        
        
        gifImage!.loadGif(name: "loadingGif")
        viewPopOver.addSubview(gifImage!)
        
        gifImage!.centerYAnchor.constraint(equalTo: self.viewPopOver.centerYAnchor).isActive = true
        gifImage!.centerXAnchor.constraint(equalTo: self.viewPopOver.centerXAnchor).isActive = true
        gifImage!.widthAnchor.constraint(equalToConstant: 100).isActive = true
        gifImage!.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.view.addSubview(viewPopOver)
        viewPopOver.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewPopOver.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        viewPopOver.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewPopOver.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        
        viewPopOver.isHidden = true
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.navigationItem.title = "Crear un reporte"
    }
    
    func configureComponents(){
        view.addSubview(viewMap)
        viewMap.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        viewMap.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        viewMap.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        viewMap.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true
        
        view.addSubview(btnAddReport)
        btnAddReport.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        btnAddReport.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        btnAddReport.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.2).isActive = true
        btnAddReport.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.2).isActive = true
        btnAddReport.addTarget(self, action: #selector(addPressed), for: .touchUpInside)
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        viewMap.clear()
        let marker = GMSMarker(position: coordinate)
        marker.title = "Ubicacion seleccionada"
        marker.map = viewMap
        
        latitude = coordinate.latitude
        longitude = coordinate.longitude
        
        print("latitude: \(latitude)")
        print("longitude: \(longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
          let locacion = locations[locations.count-1]//El ultimo valor del arreglo de locaciones
          if locacion.horizontalAccuracy > 0 {//Si hay valores validos mayores de ceros
              locationManager.stopUpdatingLocation()
              
              print("Longitud:  \(locacion.coordinate.longitude), Latitud: \(locacion.coordinate.latitude)")
              
            latitude = locacion.coordinate.latitude
            longitude = locacion.coordinate.longitude
            
            let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 17)
            viewMap.camera = camera
            self.viewMap.delegate = self

            markerOriginal.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            markerOriginal.title = "Tu ubicación"
            markerOriginal.snippet = "Shi sheñol"
            markerOriginal.map = viewMap
            
            print("latitude: \(latitude)")
            print("longitude: \(longitude)")
            
          }
      }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {//Mensaje escrito si ocurre un error en la locacion
        print(error)
    }
    
    @objc func addPressed(){
        self.viewPopOver.isHidden = false
        conexion.uploadImageAndData(descripcion: reportDescription, categoria: typeOfReport, foto: imageOfReport!.image!, lat: String(latitude), lon: String(longitude)){ respuesta in
            
            let group = DispatchGroup()
            group.enter()
            
            DispatchQueue.main.async {
                
                if let resp:Bool = respuesta {
                   group.leave()
                }
            }
            
            group.notify(queue: .main){
                self.viewPopOver.isHidden = true
                let actionSheet = UIAlertController(title: "STATUS", message: "", preferredStyle: .alert)
                actionSheet.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { (action: UIAlertAction) in
                    if respuesta == true {
                        self.navigationController?.popViewController(animated: true)
                    }else {
                        
                    }

                }))
                
                if(respuesta == true){
                    actionSheet.message = "Reporte enviado exitosamente"
                    
                }else{
                    actionSheet.message = "No se pudo enviar el reporte"
                }
                
                self.present(actionSheet, animated: true, completion: nil)
                
            }
        }
    
    }
    
}
