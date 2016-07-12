//
//  MainVC.swift
//  LocalPark
//
//  Created by Felipe Soares on 03/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import UIKit

class TicketVC: UIViewController, CustomAlertDelegate {
    
    var lastButtonIndex:Int!
    
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    
    @IBOutlet weak var spaceAndSectorLbl: UILabel!
    
    
    @IBOutlet weak var parkingNameLbl: UILabel!
    
    @IBOutlet weak var parkingPriceTableTextView: UITextView!
    
    @IBOutlet weak var alert: CustomAlert!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(gambiarraGlobal)
        alert.delegate = self

        alert.unshow()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.loadMainView), name: UIApplicationDidBecomeActiveNotification, object: nil)
        
        
        loadMainView()
        
        _ = NSTimer.scheduledTimerWithTimeInterval(60.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
        print(Factory.singleton.ticket.enteredTime)
        print(Factory.singleton.ticket.durationTime)
        
    }
    
    
    
    func update() {
        print(Factory.singleton.ticket.enteredTime)
        print(Factory.singleton.ticket.durationTime)
        
        let result = TimerHelper.sharedInstance.convertSecondsToDaysHoursAndMinutes(Factory.singleton.ticket.durationTimeInSeconds)
        
        priceLbl.text = "R$ \(ParkingHelper.sharedInstance.calculateBill(result["hours"]!, minutes: result["minutes"]!, days: result["days"]!, parking: Factory.singleton.parking))0"
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        loadMainView()
    }
    
    func loadMainView(){
        //ESTA MERDA ESTÁ PERDENDO A FORMATAÇÃO
        parkingNameLbl.text = Factory.singleton.parking.name
        priceLbl.text = "R$ 0.00"
        
        if let vaga = ParkingHelper.sharedInstance.selectedSpace{
            spaceAndSectorLbl.text = "Vaga \(vaga.spaceNumber) - Setor \(vaga.sector.name)"
        }else{
            spaceAndSectorLbl.text = "Vaga X - Setor X"
        }
        
        
        
        durationLbl.text = "Entrada: \(Factory.singleton.ticket.enteredTime)"
        parkingPriceTableTextView.text = Factory.singleton.parking.getPriceTable() as String
        
        parkingPriceTableTextView.textColor = UIColor(red: 221/255, green: 237/255, blue: 253/255, alpha: 1.0)
        parkingPriceTableTextView.textAlignment = .Center
        parkingPriceTableTextView.font = UIFont(name: "HelveticaNeue", size: 16)
        
        let result = TimerHelper.sharedInstance.convertSecondsToDaysHoursAndMinutes(Factory.singleton.ticket.durationTimeInSeconds)
        
        priceLbl.text = "R$ \(ParkingHelper.sharedInstance.calculateBill(result["hours"]!, minutes: result["minutes"]!, days: result["days"]!, parking: Factory.singleton.parking))0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func payTicket(sender: AnyObject) {
        alert.setupTitle("Pagar ticket", andText: "Você deseja continuar com o pagamento do ticket?")
        lastButtonIndex = sender.tag
        alert.show()
    }
    
    
    @IBAction func cancelTicket(sender: AnyObject) {
        alert.setupTitle("Cancelar ticket", andText: "Você deseja continuar com o cancelamento do ticket?")
        lastButtonIndex = sender.tag
        alert.show()
    }
    
    func buttonOkPressed(){
        print("Clicou Ok")
        if lastButtonIndex == 0{
            print("Clicou 0")
            performSegueWithIdentifier("goToPaymentVCSegue", sender: self)
            alert.unshow()
        }else if lastButtonIndex == 1{
            print("Clicou 0")
            ParkingHelper.sharedInstance._selectedSpace?.setSpaceFree()
            alert.unshow()
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToPaymentVCSegue"{
            let vc = segue.destinationViewController as! PaymentVC
            vc.priceText = priceLbl.text
        }
    }
    
    func buttonCancelPressed(){
        print("Clicou Cancelar")
        alert.unshow()
    }
    
    
    

}
