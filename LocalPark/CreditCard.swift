//
//  CreditCard.swift
//  LocalPark
//
//  Created by Felipe Soares on 10/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import Foundation

class CreditCard{
    private var _number:String!
    private var _flag:String!
    private var _expirationDate:String!
    private var _CCV:Int!
    private var _ownerName:String!
    
    var number:String{
        return _number
    }
    
    var flag:String{
        return _flag
    }
    
    var expirationDate:String{
        return _expirationDate
    }
    
    var CCV:Int{
        return _CCV
    }
    
    var ownerName:String{
        return _ownerName
    }
    
}
