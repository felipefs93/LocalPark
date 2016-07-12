//
//  PaymentAlert.swift
//  LocalPark
//
//  Created by Felipe Soares on 11/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import UIKit

protocol PaymentAlertDelegate {
    func buttonOkPressed()
}

@IBDesignable
class PaymentAlert: UIView {
    
    @IBOutlet weak var alertTitleLbl:UILabel!
    @IBOutlet weak var alertTextLbl:UILabel!
    

    var delegate: PaymentAlertDelegate?
    
    @IBInspectable var cornerRadius: CGFloat = 5.0{
        didSet{
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func setupView(){
        self.layer.cornerRadius = cornerRadius
        self.backgroundColor = UIColor.whiteColor()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red:207/255.0, green:216/255.0, blue:220/255.0, alpha: 1.0).CGColor
    }
    
    func setupTitle(title:String, andText text:String){
        self.alertTitleLbl.text = title
        self.alertTextLbl.text = text
    }
    
    func show(){
        self.hidden = false
    }
    
    func unshow(){
        self.hidden = true
    }
    
    @IBAction func buttonOkClick(sender: AnyObject){
        if let delegate = self.delegate {
            delegate.buttonOkPressed()
        }
    }

}
