//
//  ParkingLotSelectorVC.swift
//  LocalPark
//
//  Created by Felipe Soares on 09/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import UIKit

class ParkingLotSelectorVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, CustomAlertDelegate {
    
    var text:String!
    
    @IBOutlet weak var parkingNameLbl: UILabel!
    
    @IBOutlet weak var alert: CustomAlert!
    
    let lots = ["1","2","3","4","5","6"]
    let image = [true,false,false,false,true,false]
    
    
    @IBOutlet weak var parkingLotsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(text)
        alert.delegate = self
        alert.unshow()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.lots.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("parkingLotCell", forIndexPath: indexPath) as! ParkingLotCell
        
        cell.carImage.hidden = self.image[indexPath.row]
        cell.lotNumberLbl.text = self.lots[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("clicou")
        alert.setupTitle("Confirmar seleção de vaga", andText: "Você confirma a seleção da vaga \(lots[indexPath.row])?")
        alert.show()
    }
    
    func buttonCancelPressed() {
        alert.unshow()
    }
    
    func buttonOkPressed() {
        print("selecionou a vaga")
    }
    
    @IBAction func buttonSectorsPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    

}
