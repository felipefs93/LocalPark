//
//  Driver.swift
//  LocalPark
//
//  Created by Felipe Soares on 10/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import Foundation

class Driver{
    private var _creditCard:CreditCard!
    private var _ticket:Ticket!
    
    init(driverCreditCard:CreditCard, driverTicket:Ticket){
        _creditCard = driverCreditCard
        _ticket = driverTicket
    }
    
    func park(space:ParkingSpace){
        space.setSpaceOccupied()
    }
    
}
