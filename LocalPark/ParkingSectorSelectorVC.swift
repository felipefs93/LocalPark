//
//  ParkingSectorVC.swift
//  LocalPark
//
//  Created by Felipe Soares on 09/07/16.
//  Copyright © 2016 Felipe Soares. All rights reserved.
//

import UIKit

class ParkingSectorSelectorVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var sectorsCollectionView: UICollectionView!
    
    
    @IBOutlet weak var parkingTitleLbl: UILabel!
    
    let sectors = ["A","B","C","D","E","F","G"]
    let parkingLotsAvailable = ["Vagas: 4/20","Vagas: 4/20","Vagas: 4/20","Vagas: 4/20","Vagas: 4/20","Vagas: 4/20","Vagas: 4/20"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sectors.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("sectorCell", forIndexPath: indexPath) as! SectorCell
        
        cell.setupCell(self.sectors[indexPath.row], availableSpaces: 2, totalSpaces: 10)
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showLots", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showLots"{
            let indexPaths = self.sectorsCollectionView.indexPathsForSelectedItems()
            let indexPath = indexPaths![0] as NSIndexPath
            
            let vc = segue.destinationViewController as! ParkingLotSelectorVC
            
            vc.text = self.parkingLotsAvailable[indexPath.row]
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
