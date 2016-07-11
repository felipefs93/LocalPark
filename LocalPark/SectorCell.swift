//
//  SectorCell.swift
//  LocalPark
//
//  Created by Felipe Soares on 09/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import UIKit

class SectorCell: UICollectionViewCell {
    
    
    @IBOutlet weak var sectorName: UILabel!
    
    @IBOutlet weak var sectorAvailableParkingLots: UILabel!
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blueColor()
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupView(){
        self.backgroundColor = UIColor.blueColor()
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    func setupCell(name:String, availableSpaces:Int, totalSpaces:Int){
        sectorName.text = name
        sectorAvailableParkingLots.text = "Vagas: \(availableSpaces)/\(totalSpaces)"
    
    }
    
}
