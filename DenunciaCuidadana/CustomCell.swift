//
//  CustomCell.swift
//  DenunciaCuidadana
//
//  Created by Humberto Meza on 13/11/19.
//  Copyright © 2019 Humberto Meza. All rights reserved.
//

import Foundation
import UIKit
class CustomCell: UITableViewCell {
    var typeOfReport : String?
    var imageOfStatus : UIImage?
    var date : String?
    
    var typeOfReportMessage : UILabel = {
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var DateMessage : UILabel = {
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var ImageOfStatusView : UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(DateMessage)
        self.addSubview(ImageOfStatusView)
        self.addSubview(typeOfReportMessage)
        
        ImageOfStatusView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        ImageOfStatusView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        ImageOfStatusView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        ImageOfStatusView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        typeOfReportMessage.leadingAnchor.constraint(equalTo: ImageOfStatusView.trailingAnchor, constant: 15).isActive = true
        typeOfReportMessage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        DateMessage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        DateMessage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if let label = typeOfReport {
            typeOfReportMessage.text = label
        }
        if let image = imageOfStatus {
            ImageOfStatusView.image = image
        }
        if let label = date {
            DateMessage.text = label
        }
    }
}

