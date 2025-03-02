//
//  FootTableViewController.swift
//  SportsApp
//
//  Created by Kerlos on 27/01/2025.
//


import UIKit
import Kingfisher

class FootTableViewController: UITableViewController, LeaguesProtocol {
  
    var myLeagues : [LeaguesDetails] = []
    var isConnected : Bool = false
    
    
    func renderToView(result: Leagues) {
        print("model done")
        myLeagues = result.result!
        
        DispatchQueue.main.async
        {
            self.tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none // Hide default separators

        isConnected = PresentNetwork.checkNtwork()
        if isConnected
        {
            FetchLeagues.fetchView(view: self)
            FetchLeagues.fetchFootLeagues(link: FootballApiURLs.leaguesUrl)
        }else
        {
            let alertConnection = UIAlertController(title: "No Connection!", message: "check your network", preferredStyle: .alert)
            alertConnection.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            present(alertConnection, animated: true, completion: nil)
        }
        
       /* let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = UIColor.gray

            let label = UILabel(frame: CGRect(x: 15, y: 15, width: tableView.frame.width - 30, height: 30))
            label.text = "Leagues"
        label.textColor = UIColor.black
            label.font = UIFont.boldSystemFont(ofSize: 20)

            headerView.addSubview(label)
            tableView.tableHeaderView = headerView*/
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myLeagues.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FootTableViewCell

        cell.contentView.layer.cornerRadius = 15
        cell.contentView.layer.masksToBounds = true
        cell.contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
               
        
        cell.LeagueName.text = myLeagues[indexPath.row].league_name
        cell.countryName.text = myLeagues[indexPath.row].country_name
        
        
        if let logoUrlString = myLeagues[indexPath.row].league_logo,
           let logoUrl = URL(string: logoUrlString) {
            cell.leagueImg.kf.setImage(with: logoUrl)
        } else {
            // Optionally set a placeholder image
             print("no photo")
        }
            
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let objToLeaguePage = storyboard.instantiateViewController(withIdentifier: "league") as? LeagueDetailsCollectionViewController {
            print("---------------------")
            print(myLeagues[indexPath.row].league_key)
            objToLeaguePage.league = myLeagues[indexPath.row]
            navigationController!.pushViewController(objToLeaguePage, animated: true)
        }
    }
      
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.blue  // Background color of the header

        let label = UILabel()
        label.text = "Leagues"  // Set header text
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center 
        label.frame = CGRect(x: 15, y: 5, width: tableView.frame.width - 30, height: 30)
        
        headerView.addSubview(label)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40 // Adjust as needed
    }
    
    
    
    /*override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 30
        }*/

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
ee        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


