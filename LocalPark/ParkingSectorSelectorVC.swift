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
    
    var sectors:[Sector]!

    override func viewDidLoad() {
        super.viewDidLoad()
        parkingTitleLbl.text = Factory.singleton.parking.name
        sectors = ParkingHelper.sharedInstance.getSectorsFromParking(Factory.singleton.parking)
    }
    
    override func viewWillAppear(animated: Bool) {
        sectorsCollectionView.reloadData()
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
        
        let sector = self.sectors[indexPath.row]
        let totalSectorSpaces = ParkingHelper.sharedInstance.getNumberOfSpacesInSector(sector)
        let freeSectorSpaces = ParkingHelper.sharedInstance.getNumberOfFreeSpacesInSector(sector)
        
        cell.setupCell(sector.name, availableSpaces: freeSectorSpaces, totalSpaces: totalSectorSpaces)
        
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
            
            vc.parkingSpaces = ParkingHelper.sharedInstance.getParkingsSpacesFromSector(sectors[indexPath.row])
        }
    }
    



}
