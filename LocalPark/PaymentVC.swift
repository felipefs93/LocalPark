//
//  PaymentVC.swift
//  LocalPark
//
//  Created by Felipe Soares on 11/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import UIKit

class PaymentVC: UIViewController, UITextFieldDelegate, PaymentAlertDelegate {
    
    var priceText:String!
    
    var tag:Int!
    
    
    @IBOutlet weak var paymentAlert: PaymentAlert!
    
    @IBOutlet weak var ownerTxtField: UITextField!
    
    @IBOutlet weak var cardNumberTxtField: UITextField!
    
    @IBOutlet weak var expirationTxtField: UITextField!
    
    @IBOutlet weak var cvcTxtField: UITextField!
    
    @IBOutlet weak var priceLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        paymentAlert.delegate = self
        paymentAlert.unshow()

        priceLbl.text = priceText
        
        ownerTxtField.delegate = self
        cardNumberTxtField.delegate = self
        expirationTxtField.delegate = self
        cvcTxtField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func payButtonPressed(sender: AnyObject) {
        if cvcTxtField.text == "000"{
            tag = 0
            paymentAlert.setupTitle("Falha no pagamento", andText: "Não foi possível realizar o pagamento do ticket. Tente novamente ou dirija-se ao guichê.")
            paymentAlert.show()
        }else{
            tag = 1
            paymentAlert.setupTitle("Pagamento realizado", andText: "Obrigado por utilizar o LocalPark.")
            paymentAlert.show()
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func buttonOkPressed(){
        if tag == 0{
            paymentAlert.unshow()
        }else if tag == 1{
            ParkingHelper.sharedInstance._selectedSpace?.setSpaceFree()
            paymentAlert.unshow()
            self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
            
        }
    
    }
    
    
    
    


}
