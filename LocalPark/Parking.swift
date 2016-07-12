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
    
    func getPriceTable() -> NSString{
        if isPricedSecondHour(){
            return getTableType2()
        }else if isPricedDaily(){
            return getTableType3()
        }else if isDifferentlyPricedDaily(){
            return getTableType4()
        }else{
            return getTableType1()
        }
    }
    
    
    //NÃO MOSTRA ESSA DESGRAÇA, PORQUE TÁ FEIO...QUE DIABOS SERIA TYPE1, TYPE2...? NÃO MOSTRA. AINDA TEM REPETIÇÃO DE CÓDIGO
    func getTableType1() -> NSString{
    
        let text1 = "1ª Hora ------------------------ R$ \(_priceFirstHour)0"
        let text2 = "Hora/Fração -------------------- R$ \(_priceAddedHour)0"
        let text3 = "Este estacionamento fornece gratuidade pelos primeiros \(_freeMinutes) minutos."
        let text:NSString = "\(text1)\n\(text2)\n\n\(text3)"
        return text
        
    }
    
    func getTableType2() -> NSString{
        let text1 = "1ª Hora ------------------------ R$ \(_priceFirstHour)0"
        let text2 = "2ª Hora ------------------------ R$ \(_priceSecondHour)0"
        let text3 = "Hora/Fração -------------------- R$ \(_priceAddedHour)0"
        let text4 = "Este estacionamento fornece gratuidade pelos primeiros \(_freeMinutes) minutos."
        let text:NSString = "\(text1)\n\(text2)\n\(text3)\n\n\(text4)"
        return text
    }
    
    func getTableType3() -> NSString{
        let text1 = "1ª Hora ------------------------ R$ \(_priceFirstHour)0"
        let text2 = "2ª Hora ------------------------ R$ \(_priceSecondHour)0"
        let text3 = "Hora/Fração -------------------- R$ \(_priceAddedHour)0"
        let text4 = "1ª Diária ---------------------- R$ \(_priceFirstDaily)0"
        let text5 = "Este estacionamento fornece gratuidade pelos primeiros \(_freeMinutes) minutos."
        let text:NSString = "\(text1)\n\(text2)\n\(text3)\n\(text4)\n\n\(text5)"
        return text
    }
    
    func getTableType4() -> NSString{
        let text1 = "1ª Hora ------------------------ R$ \(_priceFirstHour)0"
        let text2 = "2ª Hora ------------------------ R$ \(_priceSecondHour)0"
        let text3 = "Hora/Fração -------------------- R$ \(_priceAddedHour)0"
        let text4 = "1ª Diária ---------------------- R$ \(_priceFirstDaily)0"
        let text5 = "Demais Diárias ----------------- R$ \(_priceAddedDaily)0"
        let text6 = "Este estacionamento fornece gratuidade pelos primeiros \(_freeMinutes) minutos."
        let text:NSString = "\(text1)\n\(text2)\n\(text3)\n\(text4)\n\(text5)\n\n\(text6)"
        return text
    }
    
}