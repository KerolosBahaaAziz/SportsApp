//
//  TennisTableViewController.swift
//  SportsApp
//
//  Created by Kerlos on 28/01/2025.
//

import UIKit
import Network

class TennisTableViewController: UITableViewController , LeaguesProtocol {
    
    
    var myLeagues : [LeaguesDetails] = []
    var isConnected : Bool = false
    
    func renderToView(result: Leagues) {
        print("model done")
        myLeagues = result.result!
        print("firest key = \(myLeagues[0].league_key)")
        DispatchQueue.main.async
        {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none // Hide default separators

        
        isConnected = PresentNetwork.checkNtwork()
        if isConnected {
            FetchLeagues.fetchView(view: self)
            FetchLeagues.fetchFootLeagues(link: TennisApiURLs.leaguesUrl)
        }else{
            let alertConnection = UIAlertController(title: "No Connection!", message: "check your network", preferredStyle: .alert)
            alertConnection.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            present(alertConnection, animated: true, completion: nil)
        }
        
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
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TennisTableViewCell

        

     //   cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.contentView.layer.cornerRadius = 15
        cell.contentView.layer.masksToBounds = true
        cell.contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        cell.textLabel?.text = myLeagues[indexPath.row].league_name
      //  cell.detailTextLabel?.text = myLeagues[indexPath.row].country_name
        
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
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let spacing: CGFloat = 10 // Adjust spacing here

        let frame = cell.frame
        cell.frame = CGRect(x: frame.origin.x + 10,  // Left padding
                            y: frame.origin.y + spacing / 2,  // Top padding
                            width: frame.size.width - 20,  // Right padding
                            height: frame.size.height - spacing) // Bottom padding
    }
    
   /* override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.blue  

        let label = UILabel()
        label.text = "Leagues"  // Set header text
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.frame = CGRect(x: 15, y: 5, width: tableView.frame.width - 30, height: 30)
        
        headerView.addSubview(label)
        return headerView
    }*/
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
