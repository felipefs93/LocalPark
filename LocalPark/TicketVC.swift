//
//  MainVC.swift
//  LocalPark
//
//  Created by Felipe Soares on 03/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import UIKit

class TicketVC: UIViewController, CustomAlertDelegate {
    
    
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    
    @IBOutlet weak var spaceAndSectorLbl: UILabel!
    
    
    @IBOutlet weak var parkingNameLbl: UILabel!
    
    @IBOutlet weak var parkingPriceTableTextView: UITextView!
    
    @IBOutlet weak var alert: CustomAlert!

    override func viewDidLoad() {
        super.viewDidLoad()
        alert.delegate = self

        alert.unshow()
        
        print(Factory.singleton.parking.name)
        print(Factory.singleton.sectors[0].name)
        print(Factory.singleton.sectors[0].parking.name)
        print(ParkingHelper.sharedInstance.getParkingByName("Shopping Iguatemi")!.name)
    print(ParkingHelper.sharedInstance.getSectorsFromParking(Factory.singleton.parking)[0].name)
        
        //ESTA MERDA ESTÁ PERDENDO A FORMATAÇÃO
        parkingNameLbl.text = Factory.singleton.parking.name
        priceLbl.text = "R$ 0.00"
        spaceAndSectorLbl.text = "Vaga X - Setor X"
        durationLbl.text = ""
        let text1 = "1ª Hora ------------------------ R$ 04.00"
        let text2 = "2ª Hora ------------------------ R$ 03.00"
        let text3 = "1ª Diária ---------------------- R$ 22.00"
        let text4 = "2ª Diária ---------------------- R$ 12.00"
        let text5 = "Hora/Fração -------------------- R$ 02.00"
        let text6 = "Diária Extra ------------------- R$ 22.00"
        let text:NSString = "\(text1)\n\(text2)\n\(text3)\n\(text4)\n\(text5)\n\(text6)"
        parkingPriceTableTextView.text = text as String
        
        parkingPriceTableTextView.textColor = UIColor(red: 221/255, green: 237/255, blue: 253/255, alpha: 1.0)
        parkingPriceTableTextView.textAlignment = .Center
        parkingPriceTableTextView.font = UIFont(name: "HelveticaNeue", size: 16)
        
        
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
