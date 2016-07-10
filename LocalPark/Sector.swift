//
//  Sector.swift
//  LocalPark
//
//  Created by Felipe Soares on 10/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import Foundation

class Sector{
    private var _name:String!
    private var _parking:Parking!
    
    var name:String{
        return _name
    }
    
    var parking:Parking{
        return _parking
    }
    
    
    init(sectorName:String, sectorParking:Parking){
        _name = sectorName
        _parking = sectorParking
    }
    
}
