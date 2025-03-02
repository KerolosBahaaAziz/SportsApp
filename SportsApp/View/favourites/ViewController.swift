//
//  ViewController.swift
//  SportsApp
//
//  Created by Kerlos on 27/01/2025.
//

import UIKit
import CoreData
import Kingfisher

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var table: UITableView!
    
    
    @IBOutlet weak var noFavouritesL: UILabel!
    var favouriteLeagues : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none 
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        DataBase.fetchFromCoreData { result in
            self.favouriteLeagues = result!
            print("fetched")
            print(self.favouriteLeagues.count)
            self.table.reloadData()
        }
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.blue]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        self.navigationItem.title = "Favourite Leagues"
        
        if favouriteLeagues.count == 0
        {
            noFavouritesL.text = "No Favourites list"
            noFavouritesL.font = UIFont.boldSystemFont(ofSize: 25)

        }
        else {
            noFavouritesL.text = ""
        }
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteLeagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FootTableViewCell
       

        cell.contentView.layer.cornerRadius = 15
        cell.contentView.layer.masksToBounds = true
        cell.contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        (cell.viewWithTag(2) as! UILabel).text = favouriteLeagues[indexPath.row].value(forKey: "league") as? String
        
        if let logoUrlString = favouriteLeagues[indexPath.row].value(forKey: "logo") as? String
        {
            let logoUrl = URL(string: logoUrlString)
            (cell.viewWithTag(1) as! UIImageView ).makeRounded()
            (cell.viewWithTag(1) as! UIImageView ).kf.setImage(with: logoUrl)
        }
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let objToLeaguePage = storyboard.instantiateViewController(withIdentifier: "league") as? LeagueDetailsCollectionViewController {
            objToLeaguePage.league = convertToLeagueDetails(from: favouriteLeagues[indexPath.row])
            navigationController!.pushViewController(objToLeaguePage, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func convertToLeagueDetails(from managedObject: NSManagedObject) -> LeaguesDetails {
        return LeaguesDetails(
            league_key: managedObject.value(forKey: "key") as? Int,
            league_name: managedObject.value(forKey: "league") as? String,
            country_name: managedObject.value(forKey: "country") as? String ?? "",
            league_logo: managedObject.value(forKey: "logo") as? String
        )
    }
    
     
    /* func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.blue  // Background color of the header

        let label = UILabel()
        label.text = "Favourites Leagues"  // Set header text
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.frame = CGRect(x: 15, y: 5, width: tableView.frame.width - 30, height: 30)
        
        headerView.addSubview(label)
        return headerView
    }

     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40 // Adjust as needed
    }
    */
}



