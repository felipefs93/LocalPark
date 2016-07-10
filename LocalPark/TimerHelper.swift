//
//  TimerHelper.swift
//  LocalPark
//
//  Created by Felipe Soares on 10/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import Foundation

class TimerHelper{
    
    static let sharedInstance = TimerHelper()
    
    private init(){
        
    }
    
    func computeDurationTime(enteredDate: NSDate) -> String{
        let timeNow = NSDate()
        let totalTime = timeNow.timeIntervalSinceDate(enteredDate)
        return formatTimeToHoursAndMinutes(totalTime)
    }
    
    func computeDurationTimeInSeconds(enteredDate: NSDate) -> String{
        let timeNow = NSDate()
        let totalTime = timeNow.timeIntervalSinceDate(enteredDate)
        return String(totalTime)
    }
    
    func formatTimeToHoursAndMinutes(timeInterval:NSTimeInterval) -> String{
        var hours = String(Int(timeInterval/3600))
        var minutes = String(Int((timeInterval%3600)/60))
        
        if Int(hours) < 10{
            hours = "0\(hours)"
        }
        if Int(minutes) < 10{
            minutes = "0\(minutes)"
        }
        
        return "\(hours):\(minutes)"
    }
    
    func getFormatedEnteredTimeAndDate(enteredDate: NSDate) -> String{
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Day, NSCalendarUnit.Month, NSCalendarUnit.Year], fromDate: enteredDate)
        var hours = String(components.hour)
        var minutes = String(components.minute)
        var day = String(components.day)
        var month = String(components.month)
        let year = String(components.year)
        
        if Int(minutes) < 10{
            minutes = "0\(minutes)"
        }
        if Int(hours) < 10{
            hours = "0\(hours)"
        }
        if Int(day) < 10{
            day = "0\(day)"
        }
        if Int(month) < 10{
            month = "0\(month)"
        }
        
        return "\(hours):\(minutes) - \(day)/\(month)/\(year)"
    }
    
    func hoursToDay(hours:Int) -> Int{
        return hours/24
    }
    
    func convertSecondsToDaysHoursAndMinutes(totalTime:String)->[String:Int]{
        var dictionaryOfTimes = [String:Int]()
        var days:Int
        var hours:Int
        var minutes:Int
        
        days = Int(Float(totalTime)!) / (3600 * 24);
        hours = (Int(Float(totalTime)!) % (3600 * 24))/3600;
        minutes = ((Int(Float(totalTime)!) % (3600 * 24))%3600)/60;
        
        
        dictionaryOfTimes = ["days":days,"hours":hours,"minutes":minutes]
        
        return dictionaryOfTimes
        
    }
    
}
