//
//  PaymentVC.swift
//  LocalPark
//
//  Created by Felipe Soares on 11/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import UIKit

class PaymentVC: UIViewController, UITextFieldDelegate {
    
    var priceText:String!
    
    
    
    @IBOutlet weak var priceLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        priceLbl.text = priceText
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
