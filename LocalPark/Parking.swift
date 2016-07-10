//
//  Parking.swift
//  LocalPark
//
//  Created by Felipe Soares on 10/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import Foundation

class Parking{
    private var _name:String!
    private var _priceFirstHour: Float!
    private var _priceSecondHour:Float?
    private var _priceAddedHour:Float!
    private var _priceFirstDaily:Float?
    private var _priceAddedDaily:Float?
    private var _freeMinutes:Int!
    
    
    var name:String{
        return _name
    }
    
    var priceFirstHour:Float{
        return _priceFirstHour
    }
    
    var priceSecondHour:Float{
        return _priceSecondHour!
    }
    
    var priceAddedHour:Float{
        return _priceAddedHour
    }
    
    var priceFirstDaily:Float{
        return _priceFirstDaily!
    }
    
    var priceAddedDaily:Float{
        return _priceAddedDaily!
    }
    
    var freeMinutes:Int{
        return _freeMinutes
    }
    
    
    //Inits
    init(parkingName:String, parkingFreeMinutes:Int, parkingPriceFirstHour:Float){
        _name = parkingName
        _priceFirstHour = parkingPriceFirstHour
        _priceAddedHour = _priceFirstHour
        _freeMinutes = parkingFreeMinutes
        
    }
    
    init(parkingName:String, parkingFreeMinutes:Int, parkingPriceFirstHour:Float, parkingPriceAddedHour:Float){
        _name = parkingName
        _priceFirstHour = parkingPriceFirstHour
        _priceAddedHour = parkingPriceAddedHour
        _freeMinutes = parkingFreeMinutes
        
    }
    
    init(parkingName:String, parkingFreeMinutes:Int, parkingPriceFirstHour:Float, parkingPriceSecondHour:Float, parkingPriceAddedHour:Float){
        _name = parkingName
        _priceFirstHour = parkingPriceFirstHour
        _priceSecondHour = parkingPriceSecondHour
        _priceAddedHour = parkingPriceAddedHour
        _freeMinutes = parkingFreeMinutes
        
    }
    
    init(parkingName:String, parkingFreeMinutes:Int, parkingPriceFirstHour:Float, parkingPriceSecondHour:Float, parkingPriceAddedHour:Float, parkingPriceFirstDaily:Float){
        _name = parkingName
        _priceFirstHour = parkingPriceFirstHour
        _priceSecondHour = parkingPriceSecondHour
        _priceAddedHour = parkingPriceAddedHour
        _priceFirstDaily = parkingPriceFirstDaily
        _freeMinutes = parkingFreeMinutes
        
    }
    
    init(parkingName:String, parkingFreeMinutes:Int, parkingPriceFirstHour:Float, parkingPriceSecondHour:Float, parkingPriceAddedHour:Float, parkingPriceFirstDaily:Float, parkingPriceAddedDaily:Float){
        _name = parkingName
        _priceFirstHour = parkingPriceFirstHour
        _priceSecondHour = parkingPriceSecondHour
        _priceAddedHour = parkingPriceAddedHour
        _priceFirstDaily = parkingPriceFirstDaily
        _priceAddedDaily = parkingPriceAddedDaily
        _freeMinutes = parkingFreeMinutes
        
    }
    
    //IF's to verify details of the parking
    func isPricedSecondHour()->Bool{
        if _priceSecondHour != nil{
            return true
        }
        return false
    }
    
    func isPricedDaily()->Bool{
        if _priceFirstDaily != nil{
            return true
        }
        return false
    }
    
    func isDifferentlyPricedDaily()->Bool{
        if _priceAddedDaily != nil{
            return true
        }
        return false
    }
    
}