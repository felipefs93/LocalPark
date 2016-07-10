//
//  MainVC.swift
//  LocalPark
//
//  Created by Felipe Soares on 03/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import UIKit

class TicketVC: UIViewController, CustomAlertDelegate {
    
    
    @IBOutlet weak var alert: CustomAlert!

    override func viewDidLoad() {
        super.viewDidLoad()
        alert.delegate = self

        alert.unshow()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func payTicket(sender: AnyObject) {
        alert.setupTitle("Pagar ticket", andText: "Você deseja continuar com o pagamento do ticket?")
        alert.show()
    }
    
    
    @IBAction func cancelTicket(sender: AnyObject) {
        alert.setupTitle("Cancelar ticket", andText: "Você deseja continuar com o cancelamento do ticket?")
        alert.show()
    }
    
    func buttonOkPressed(){
        print("Clicou Ok")
    }
    
    func buttonCancelPressed(){
        print("Clicou Cancelar")
        alert.unshow()
    }
    
    
    

}
