//
//  ParkingSpace.swift
//  LocalPark
//
//  Created by Felipe Soares on 10/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import Foundation

class ParkingSpace{
    private var _spaceNumber: Int!
    private var _spaceFree: Bool!
    private var _sector:Sector!
    
    var spaceNumber:Int{
        return _spaceNumber
    }
    
    var sector:Sector{
        return _sector
    }
    
    init(lotNumber:Int,lotFree:Bool, lotSector:Sector){
        _spaceNumber = lotNumber
        _spaceFree = lotFree
        _sector = lotSector
    }
    
    func isSpaceFree() -> Bool{
        if _spaceFree == true{
            return true
        }
        return false
    }
    
    func setSpaceFree(){
        _spaceFree = true
    }
    
    func setSpaceOccupied(){
        _spaceFree = false
    }
}
