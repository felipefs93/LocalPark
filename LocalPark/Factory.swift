//
//  Factory.swift
//  LocalPark
//
//  Created by Felipe Soares on 10/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import Foundation

class Factory{

    private var _parking:Parking!
    private var _sectors:[Sector]!
    private var _parkingSpaces:[ParkingSpace]!
    private var _ticket:Ticket!
    
    static let singleton = Factory()
    
    var parking:Parking{
        return _parking
    }
    
    var sectors:[Sector]{
        return _sectors
    }
    
    var parkingSpaces:[ParkingSpace]{
        return _parkingSpaces
    }
    
    var ticket:Ticket{
        return _ticket
    }
    
    
    private init(){
        
        if gambiarraGlobal == "iguatemi"{
            _parking = Parking(parkingName: "Shopping Iguatemi", parkingFreeMinutes: 2, parkingPriceFirstHour: 4.00)
            _sectors = [Sector]()
            _parkingSpaces = [ParkingSpace]()
        
            var sector = Sector(sectorName: "A", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "B", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "C", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "D", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "E", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "F", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "G", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "H", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "I", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "J", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "K", sectorParking: _parking)
            
            var parkingSpace = ParkingSpace(lotNumber: 1, lotFree: false, lotSector: _sectors[0])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 2, lotFree: true, lotSector: _sectors[0])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 3, lotFree: true, lotSector: _sectors[0])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 4, lotFree: true, lotSector: _sectors[0])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 1, lotFree: true, lotSector: _sectors[1])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 2, lotFree: true, lotSector: _sectors[1])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 3, lotFree: true, lotSector: _sectors[1])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 4, lotFree: true, lotSector: _sectors[1])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 5, lotFree: true, lotSector: _sectors[1])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 6, lotFree: true, lotSector: _sectors[1])
            _parkingSpaces.append(parkingSpace)
            
        }else{
        
            _parking = Parking(parkingName: "Shopping Rio Mar", parkingFreeMinutes: 2, parkingPriceFirstHour: 4.00)
            _sectors = [Sector]()
            _parkingSpaces = [ParkingSpace]()
            
            var sector = Sector(sectorName: "A", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "B", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "C", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "D", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "E", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "F", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "G", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "H", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "I", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "J", sectorParking: _parking)
            _sectors.append(sector)
            sector = Sector(sectorName: "K", sectorParking: _parking)
            
            var parkingSpace = ParkingSpace(lotNumber: 1, lotFree: false, lotSector: _sectors[0])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 2, lotFree: true, lotSector: _sectors[0])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 3, lotFree: true, lotSector: _sectors[0])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 4, lotFree: true, lotSector: _sectors[0])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 1, lotFree: true, lotSector: _sectors[1])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 2, lotFree: true, lotSector: _sectors[1])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 3, lotFree: true, lotSector: _sectors[1])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 4, lotFree: true, lotSector: _sectors[1])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 5, lotFree: true, lotSector: _sectors[1])
            _parkingSpaces.append(parkingSpace)
            parkingSpace = ParkingSpace(lotNumber: 6, lotFree: true, lotSector: _sectors[1])
            _parkingSpaces.append(parkingSpace)
            
        }
        
        _ticket = Ticket(parking: _parking)
        
    }
    
}
