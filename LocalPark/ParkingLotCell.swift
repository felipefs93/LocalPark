//
//  ParkingLotCell.swift
//  LocalPark
//
//  Created by Felipe Soares on 09/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import UIKit

class ParkingLotCell: UICollectionViewCell {
    
    
    @IBOutlet weak var carImage: UIImageView!
    
    
    @IBOutlet weak var lotNumberLbl: UILabel!
    
    func setupCell(number:Int, freeSpace:Bool){
        lotNumberLbl.text = String(number)
        carImage.hidden = freeSpace
        
    }
    
}
