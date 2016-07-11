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
    
    var parkingSpaces:[ParkingSpace]!
    
    
    @IBOutlet weak var parkingLotsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        parkingNameLbl.text = Factory.singleton.parking.name
        
        alert.delegate = self
        alert.unshow()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.parkingSpaces.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("parkingLotCell", forIndexPath: indexPath) as! ParkingLotCell
        
        let parkingSpace = parkingSpaces[indexPath.row]
        cell.setupCell(parkingSpace.spaceNumber, freeSpace: parkingSpace.isSpaceFree())
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("clicou")
        alert.setupTitle("Confirmar seleção de vaga", andText: "Você confirma a seleção da vaga \(parkingSpaces[indexPath.row].spaceNumber) no setor \(parkingSpaces[indexPath.row].sector.name)?")
        alert.show()
    }
    
    func buttonCancelPressed() {
        alert.unshow()
    }
    
    func buttonOkPressed() {
        print("selecionou a vaga")
        alert.unshow()
        let tbc = self.presentingViewController as! UITabBarController
        tbc.selectedIndex = 0
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func buttonSectorsPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    

}
