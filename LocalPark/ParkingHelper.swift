//
//  ParkingHelper.swift
//  LocalPark
//
//  Created by Felipe Soares on 10/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import Foundation

class ParkingHelper{
    
    static let sharedInstance = ParkingHelper()
    var _parkings:[Parking]!
    var _sectors:[Sector]!
    var _parkingSpaces:[ParkingSpace]!
    
    
    private init(){
//        _parkings = [Parking]()
//        _sectors = [Sector]()
//        _parkingSpaces = [ParkingSpace]()
        _parkings = [Parking]()
        _parkings.append(Factory.singleton.parking)
        _sectors = Factory.singleton.sectors
        _parkingSpaces = Factory.singleton.parkingSpaces
    }
    
    func getNumberOfSpacesInSector(sector:Sector) -> Int{
        var count = 0
        for aSpace in _parkingSpaces{
            if aSpace.sector === sector{
                count = count + 1
            }
        }
        
        return count
    }
    
    func getNumberOfFreeSpacesInSector(sector:Sector) -> Int{
        var count = 0
        
        for aSpace in _parkingSpaces{
            if aSpace.sector === sector{
                if aSpace.isSpaceFree(){
                    count = count + 1
                }
            }
        }
        
        return count
    }
    
    func getNumberOfOccupiedSpacesInSector(sector:Sector) -> Int{
        return getNumberOfSpacesInSector(sector) - getNumberOfFreeSpacesInSector(sector)
    }
    
    
    func getParkingByName(name:String) -> Parking?{
        for aParking in _parkings{
            if aParking.name == name{
                return aParking
            }
        }
        return nil
    }
    
    func getSectorsFromParking(parking:Parking) -> [Sector]{
        var parkingSectors = [Sector]()
        for aSector in _sectors{
            if aSector.parking === parking{
                parkingSectors.append(aSector)
            }
        }
        return parkingSectors
    }
    
    func getSectorByName(name:String, from parking:Parking) -> Sector?{
        for aSector in _sectors{
            if aSector.parking === parking && aSector.name == name{
                return aSector
            }
        }
        return nil
    }
    
    func getParkingsSpacesFromSector(sector:Sector) -> [ParkingSpace]{
        var spaces = [ParkingSpace]()
        for aSpace in _parkingSpaces{
            if aSpace.sector.name == sector.name{
                spaces.append(aSpace)
            }
        }
        return spaces
    }
    
    func getParkingSpaceByNumber(number:Int, from sector:Sector) -> ParkingSpace?{
        for aSpace in _parkingSpaces{
            if aSpace.sector === sector && aSpace.spaceNumber == number{
                return aSpace
            }
        }
        
        return nil
    }
    
    func calculateBill(hours:Int, minutes:Int, days:Int, parking:Parking) -> Float{
        let value:Float!
        if parking.isPricedDaily() && parking.isDifferentlyPricedDaily() && parking.isPricedSecondHour(){
            //estacionamento com preço diário, preço diário diferente do primeiro dia e preco da segunda hora diferente da primeira hora + (preço da primeira hora e adicional por hora e fração de hora)
            value = computeTotal(hours, minutes: minutes, days: days, priceFirstHour: parking.priceFirstHour, priceSecondHour: parking.priceSecondHour, priceAddedHour: parking.priceAddedHour, priceFirstDaily: parking.priceFirstDaily, priceAddedDaily: parking.priceAddedDaily, freeMinutes: parking.freeMinutes)
            
        }else if parking.isPricedDaily() && parking.isPricedSecondHour(){
            //estacionamento com preço diário e preco da segunda hora diferente da primeira hora + (preço da primeira hora e adicional por hora e fração de hora)
            value = computeTotal(hours, minutes: minutes, days: days, priceFirstHour: parking.priceFirstHour, priceSecondHour: parking.priceSecondHour, priceAddedHour: parking.priceAddedHour, priceFirstDaily: parking.priceFirstDaily, freeMinutes: parking.freeMinutes)
        }else if parking.isPricedSecondHour(){
            //preco da segunda hora diferente da primeira hora + (preço da primeira hora e adicional por hora e fração de hora)
            value = computeTotal(hours, minutes: minutes, days: days, priceFirstHour: parking.priceFirstHour, priceSecondHour: parking.priceSecondHour, priceAddedHour: parking.priceAddedHour, freeMinutes: parking.freeMinutes)
        }else{
            //preço da primeira hora e adicional por hora e fração de hora
            value = computeTotal(hours, minutes: minutes, days: days, priceFirstHour: parking.priceFirstHour, priceAddedHour: parking.priceAddedHour, freeMinutes: parking.freeMinutes)
        }
        
        return value
    }
    
    
    func computeTotal(hours:Int, minutes:Int, days:Int, priceFirstHour:Float, priceSecondHour:Float, priceAddedHour:Float, priceFirstDaily:Float, priceAddedDaily:Float, freeMinutes:Int!) -> Float{
        
        var value:Float!
        
        if isInFreeMinutes(hours, minutes: minutes, days: days, freeMinutes: freeMinutes){
            value = 0
        }else{
            if days == 0{
                if hours == 0 && minutes > 0{
                    value = priceFirstHour
                }else if hours == 1 && minutes == 0{
                    value = priceFirstHour
                }else if hours == 1 && minutes > 0{
                    value = priceFirstHour + priceSecondHour
                }else if hours == 2 && minutes == 0{
                    value = priceFirstHour + priceSecondHour
                }else if hours == 2 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + priceAddedHour
                }else if hours > 2 && minutes == 0{
                    value = priceFirstHour + priceSecondHour + Float(hours - 2) * priceAddedHour
                }else if hours > 2 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + (Float(hours - 2) * priceAddedHour) + priceAddedHour
                }
            }else if days == 1{
                if hours == 0 && minutes > 0{
                    value = priceAddedHour + priceFirstDaily
                }else if hours == 1 && minutes == 0{
                    value = priceFirstHour + priceFirstDaily
                }else if hours == 1 && minutes > 0{
                    value = priceFirstHour + priceAddedHour + priceFirstDaily
                }else if hours == 2 && minutes == 0{
                    value = priceFirstHour + priceSecondHour + priceFirstDaily
                }else if hours == 2 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + priceAddedHour + priceFirstDaily
                }else if hours > 2 && minutes == 0{
                    value = priceFirstHour + priceSecondHour + (Float(hours - 2) * priceAddedHour) + priceFirstDaily
                }else if hours > 2 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + (Float(hours - 2) * priceAddedHour) + priceAddedHour + priceFirstDaily
                }
            }else if days > 1{
                if hours == 0 && minutes > 0{
                    value = priceAddedHour + priceFirstDaily + (Float(days - 1) * priceAddedDaily)
                }else if hours == 1 && minutes == 0{
                    value = priceFirstHour + priceFirstDaily + (Float(days - 1) * priceAddedDaily)
                }else if hours == 1 && minutes > 0{
                    value = priceFirstHour + priceAddedHour + priceFirstDaily + (Float(days - 1) * priceAddedDaily)
                }else if hours == 2 && minutes == 0{
                    value = priceFirstHour + priceSecondHour + priceFirstDaily + (Float(days - 1) * priceAddedDaily)
                }else if hours == 2 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + priceAddedHour + priceFirstDaily + (Float(days - 1) * priceAddedDaily)
                }else if hours > 2 && minutes == 0{
                    value = priceFirstHour + priceSecondHour + (Float(hours - 2) * priceAddedHour) + priceFirstDaily + (Float(days - 1) * priceAddedDaily)
                }else if hours > 2 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + (Float(hours - 2) * priceAddedHour) + priceAddedHour + priceFirstDaily + (Float(days - 1) * priceAddedDaily)
                }
            }
        }
        return value
    }
    
    
    func computeTotal(hours:Int, minutes:Int, days:Int, priceFirstHour:Float, priceSecondHour:Float, priceAddedHour:Float, priceFirstDaily:Float, freeMinutes:Int!) -> Float{
        
        var value:Float!
        
        if isInFreeMinutes(hours, minutes: minutes, days: days, freeMinutes: freeMinutes){
            value = 0
        }else{
            if days == 0{
                if hours == 0 && minutes > 0{
                    value = priceFirstHour
                }else if hours == 1 && minutes == 0{
                    value = priceFirstHour
                }else if hours == 1 && minutes > 0{
                    value = priceFirstHour + priceSecondHour
                }else if hours == 2 && minutes == 0{
                    value = priceFirstHour + priceSecondHour
                }else if hours == 2 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + priceAddedHour
                }else if hours > 2 && minutes == 0{
                    value = priceFirstHour + priceSecondHour + Float(hours - 2) * priceAddedHour
                }else if hours > 2 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + (Float(hours - 2) * priceAddedHour) + priceAddedHour
                }
            }else if days == 1{
                if hours == 0 && minutes > 0{
                    value = priceFirstHour + priceFirstDaily
                }else if hours == 1 && minutes == 0{
                    value = priceFirstHour + priceFirstDaily
                }else if hours == 1 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + priceFirstDaily
                }else if hours == 2 && minutes == 0{
                    value = priceFirstHour + priceSecondHour + priceFirstDaily
                }else if hours == 2 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + priceAddedHour + priceFirstDaily
                }else if hours > 2 && minutes == 0{
                    value = priceFirstHour + priceSecondHour + (Float(hours - 2) * priceAddedHour) + priceFirstDaily
                }else if hours > 2 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + (Float(hours - 2) * priceAddedHour) + priceAddedHour + priceFirstDaily
                }
            }else if days > 1{
                if hours == 0 && minutes > 0{
                    value = priceFirstHour + (Float(days) * priceFirstDaily)
                }else if hours == 1 && minutes == 0{
                    value = priceFirstHour + (Float(days) * priceFirstDaily)
                }else if hours == 1 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + (Float(days) * priceFirstDaily)
                }else if hours == 2 && minutes == 0{
                    value = priceFirstHour + priceSecondHour + (Float(days) * priceFirstDaily)
                }else if hours == 2 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + priceAddedHour + (Float(days) * priceFirstDaily)
                }else if hours > 2 && minutes == 0{
                    value = priceFirstHour + priceSecondHour + (Float(hours - 2) * priceAddedHour) + (Float(days) * priceFirstDaily)
                }else if hours > 2 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + (Float(hours - 2) * priceAddedHour) + priceAddedHour + (Float(days) * priceFirstDaily)                }
            }
        }
        return value
    }
    
    
    func computeTotal(hours:Int, minutes:Int, days:Int, priceFirstHour:Float, priceSecondHour:Float, priceAddedHour:Float, freeMinutes:Int!) -> Float{
        
        var value:Float!
        let priceDaily = (priceFirstHour + priceSecondHour + 22*(priceAddedHour))
        
        if isInFreeMinutes(hours, minutes: minutes, days: days, freeMinutes: freeMinutes){
            value = 0
        }else{
            if days == 0{
                if hours == 0 && minutes > 0{
                    value = priceFirstHour
                }else if hours == 1 && minutes == 0{
                    value = priceFirstHour
                }else if hours == 1 && minutes > 0{
                    value = priceFirstHour + priceSecondHour
                }else if hours == 2 && minutes == 0{
                    value = priceFirstHour + priceSecondHour
                }else if hours == 2 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + priceAddedHour
                }else if hours > 2 && minutes == 0{
                    value = priceFirstHour + priceSecondHour + Float(hours - 2) * priceAddedHour
                }else if hours > 2 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + (Float(hours - 2) * priceAddedHour) + priceAddedHour
                }
            }else if days >= 1{
                if hours == 0 && minutes > 0{
                    value = priceFirstHour + Float(days) * priceDaily
                }else if hours == 1 && minutes == 0{
                    value = priceFirstHour + Float(days) * priceDaily
                }else if hours == 1 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + Float(days) * priceDaily
                }else if hours == 2 && minutes == 0{
                    value = priceFirstHour + priceSecondHour + Float(days) * priceDaily
                }else if hours == 2 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + priceAddedHour + Float(days) * priceDaily
                }else if hours > 2 && minutes == 0{
                    value = priceFirstHour + priceSecondHour + (Float(hours - 2) * priceAddedHour) + Float(days) * priceDaily
                }else if hours > 2 && minutes > 0{
                    value = priceFirstHour + priceSecondHour + (Float(hours - 2) * priceAddedHour) + priceAddedHour + Float(days) * priceDaily
                }
            }
        }
        return value
    }
    
    
    func computeTotal(hours:Int, minutes:Int, days:Int, priceFirstHour:Float, priceAddedHour:Float, freeMinutes:Int!) -> Float{
        
        var value:Float!
        let priceDaily = (priceFirstHour + 23*(priceAddedHour))
        
        if isInFreeMinutes(hours, minutes: minutes, days: days, freeMinutes: freeMinutes){
            value = 0
        }else{
            if hours == 0 && minutes > 0{
                value = priceFirstHour + Float(days) * priceDaily
            }else if hours == 1 && minutes == 0{
                value = priceFirstHour + Float(days) * priceDaily
            }else if hours == 1 && minutes > 0{
                value = priceFirstHour + priceAddedHour + Float(days) * priceDaily
            }else if hours >= 1 && minutes == 0{
                value = priceFirstHour + (Float(hours - 1) * (priceAddedHour)) + Float(days) * priceDaily
            }else if hours >= 1 && minutes > 0{
                value = priceFirstHour + (Float(hours - 1) * (priceAddedHour)) + priceAddedHour + Float(days) * priceDaily
            }else if days == 1 && hours == 0 && minutes == 0{
                value = Float(days) * priceDaily
            }
        }
        return value
    }
    
    
    
    func isInFreeMinutes(hours:Int, minutes:Int, days:Int, freeMinutes:Int) -> Bool{
        if hours == 0 && days == 0{
            if minutes < freeMinutes{
                return true
            }
            return false
        }
        return false
    }
    
    
}
