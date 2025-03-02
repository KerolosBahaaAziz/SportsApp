//
//  HomeCollectionViewController.swift
//  SportsApp
//
//  Created by Kerlos on 27/01/2025.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    var photos = ["football" , "basketball" , "tennis" , "cricket"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.blue]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        self.navigationItem.title = "Sports"
        
    }

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
    
        cell.sportImage.image = UIImage(named: photos[indexPath.row])
        cell.sportNameLabel.text = photos[indexPath.row]
    
        return cell
    }

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        switch indexPath.row {
        case 0:
            navigateToFootLeugueTable()
        case 1:
            navigateToBasketLeugueTable()
        default:
            navigateToTennisLeugueTable()

        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width/2, height: UIScreen.main.bounds.size.height/2 )
    }
    
    
    func navigateToFootLeugueTable()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let objToFootPage = storyboard.instantiateViewController(withIdentifier: "foot") as? FootTableViewController {
            navigationController!.pushViewController(objToFootPage, animated: true)
        }
    }
    
    func navigateToBasketLeugueTable()
    {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let objToBasketPage = storyboard.instantiateViewController(withIdentifier: "basket") as? BasketLeaguesTableViewController {
            navigationController!.pushViewController(objToBasketPage, animated: true)
       }
        
    }
    
    func navigateToTennisLeugueTable()
    {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let objToTennisPage = storyboard.instantiateViewController(withIdentifier: "tennis") as? TennisTableViewController {
            navigationController!.pushViewController(objToTennisPage, animated: true)
       }
        
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
