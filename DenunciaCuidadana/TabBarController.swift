//
//  TabBarController.swift
//  DenunciaCuidadana
//
//  Created by Humberto Meza on 14/11/19.
//  Copyright © 2019 Humberto Meza. All rights reserved.
//

import Foundation
import UIKit
    class TabBarController: UITabBarController {
        
        var reportes : [reportes] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.tabBar.items?[0].image = UIImage(named: "add")
            self.tabBar.items?[0].title = "Crear reporte"
            self.tabBar.items?[1].image = UIImage(named: "list")
            self.tabBar.items?[1].title = "Mis reportes"
            self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.hidesBackButton = true
            

        }
        
        
}
