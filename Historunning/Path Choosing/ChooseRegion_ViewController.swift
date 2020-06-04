//
//  ChoosePlace_ViewController.swift
//  Historunning
//
//  Created by Matteo Postorino on 21/05/2020.
//  Copyright © 2020 Matteo Postorino. All rights reserved.
//

import UIKit
import RealmSwift

class ChooseRegion_ViewController: UIViewController {

    let realm = try! Realm()
    
    var region = Place()
    
    let alert = UIAlertController(title: "Before you start", message: "Scroll regions and tap on the preferred one to proceed", preferredStyle: .alert)

    @IBOutlet weak var collectionViewRegions: UICollectionView!
    
    @IBOutlet weak var regionPageController: UIPageControl!
    
    
    
    //DataSource
   
    let regions = [
        UIImage(named: "Tuscany"),
        UIImage(named: "Umbria"),
        UIImage(named: "Liguria")
    ]
    
    var regionsName:[String]? = ["Tuscany","Umbria","Liguria"]
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        regionPageController.numberOfPages = regions.count
        
        alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil))
        
        self.present(alert, animated: true)
        
        //labelRegion.text = regionsName[0]
    }
    
    

}

extension ChooseRegion_ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //Returns elements count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return regions.count
    }
    
    //Returns cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionViewRegions.dequeueReusableCell(withReuseIdentifier: "RegionCell", for: indexPath) as! ChooseRegion_Cell
        
        cell.image = regions[indexPath.item] //current array element
        
        if let item = regionsName?[indexPath.row] {
            cell.regionLabel.text = item
        }
        
        region.Region = cell.regionLabel.text!
        
        return cell
    }
    
    //Returns cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        currentIndex = Int(scrollView.contentOffset.x/collectionViewRegions.frame.size.width)
        
        regionPageController.currentPage = currentIndex
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionViewRegions.dequeueReusableCell(withReuseIdentifier: "RegionCell", for: indexPath) as! ChooseRegion_Cell
        
        if let item = regionsName?[indexPath.row] {
        cell.regionLabel.text = item
            
        do
        {
            try realm.write {
                region.Region = item
                realm.add(region)
                print("User saved succesfully")
            }
        } catch {
            print("error saving message, \(error)")
        }
        performSegue(withIdentifier: "goToTowns", sender: self)
    }
    

}
    
    

}
