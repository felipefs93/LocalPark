//
//  Ticket.swift
//  LocalPark
//
//  Created by Felipe Soares on 10/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import Foundation

class Ticket{
    private var _ticketCode: String!
    private var _ticketCreatedTime: NSDate!
    private var _parking: Parking!
    
    
    var ticketCode: String{
        return _ticketCode
    }
    
    var durationTime: String{
        return TimerHelper.sharedInstance.computeDurationTime(_ticketCreatedTime)
    }
    
    var durationTimeInSeconds: String{
        return TimerHelper.sharedInstance.computeDurationTimeInSeconds(_ticketCreatedTime)
    }
    
    var enteredTime: String{
        return TimerHelper.sharedInstance.getFormatedEnteredTimeAndDate(_ticketCreatedTime)
    }
    
    init(parking: Parking){
        _ticketCode = TicketHelper.generateCode()
        _ticketCreatedTime = NSDate()
        _parking = parking
    }
     
    
    
}
