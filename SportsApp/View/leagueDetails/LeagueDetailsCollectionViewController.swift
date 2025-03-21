//
//  LeagueDetailsCollectionViewController.swift
//  SportsApp
//
//  Created by Kerlos on 27/01/2025.
//

import UIKit

private let reuseIdentifier = "Cell"

class LeagueDetailsCollectionViewController: UICollectionViewController , FinishedMatchesProtocol, UpcomingMatchesProtocol , TeamsProtocol{
    
    var myFinishedMatches : [FinishedMatchesDetails] = []
    var myUpcomingMatches : [UpcomingMatchesDetails] = []
    var myTeams : [TeamDetails] = []
    var league : LeaguesDetails?
    var selectedLeague : [FinishedMatchesDetails] = []
    var upcomingSelected : [UpcomingMatchesDetails] = []
    var isFavorite = 0
    var isConnected = false
    var fetchTeam : String = ""
    
    func renderToView(result: Teams) {
       
        print("model teams done")
        //print(result.result!.count)
        myTeams = result.result ?? []
               
        DispatchQueue.main.async
        {
            self.collectionView.reloadData()
        }
    }
    
    
       
    func renderToView(result: UpcomingMatches) {
        print("model coming done")
        print(result.result!.count)
        myUpcomingMatches = result.result!
       
        UpcomingfilterData()
        
        DispatchQueue.main.async
        {
            self.collectionView.reloadData()
        }
    }
    
    
    func renderToView(result: FinishedMatches) {
        print("model h2h done")
        print(result.result!.count)
        myFinishedMatches = result.result!
       
        filterData()
        
        DispatchQueue.main.async
        {
            self.collectionView.reloadData()
        }
        
    }
    
   /* func applyGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top-left
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) // Bottom-right
        gradientLayer.frame = CGRect(x: 0, y: 0, width: collectionView.contentSize.width, height: collectionView.contentSize.height)

        let backgroundView = UIView(frame: gradientLayer.frame)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)

        collectionView.backgroundView = backgroundView
    }*/
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let gradientLayer = collectionView.backgroundView?.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = CGRect(x: 0, y: 0, width: collectionView.contentSize.width, height: collectionView.contentSize.height)
        }
    }

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //applyGradientBackground()
        collectionView.register(UICollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "header")
        
        print("selected = \(league?.league_key)")
        
        fetchTeam=FootballApiURLs.teamsURL
        fetchTeam.append("&leagueId=")
        var key = league?.league_key ?? 0
        fetchTeam.append(String(key))
        print(fetchTeam)
        
        let rightButton = UIBarButtonItem(
                    image: UIImage(systemName: "heart"),
                    style: .plain,
                    target: self,
                    action: #selector(makeFavorite)
                )
        
        
        rightButton.tintColor = .blue
        navigationItem.rightBarButtonItem = rightButton

        if DataBase.isKeyStored(key: (league?.league_key)!)
        {
            print ("stored in core data")
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart.fill")

        }
        
        
        let layout = UICollectionViewCompositionalLayout{index,environment in
            switch index
            {
            case 0 :
                return self.drawFirstSection()
                
            case 1 :
                return self.drawSecondSection()
            
            default:
                return self.drawThirdSection()

            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
        isConnected = PresentNetwork.checkNtwork()
        if isConnected
        {
            FetchFinishedMatches.fetchView(view: self)
            FetchFinishedMatches.fetchFinishedMatchesLeagues(link: FootballApiURLs.finishedMatchesURL)
            
            FetchUpcomingMatches.fetchView(view: self)
            FetchUpcomingMatches.fetchUpcomingMatchesLeagues(link: FootballApiURLs.upcomingMatchesURL)
            
            FetchTeams.fetchView(view: self)
            FetchTeams.fetchFootTeams(link: fetchTeam)
        }else
        {
            let alertConnection = UIAlertController(title: "No Connection!", message: "check your network", preferredStyle: .alert)
            alertConnection.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                self.navigationController?.popViewController(animated: true)            }))
            present(alertConnection, animated: true, completion: nil)
        }
       
    }
    
    @objc func makeFavorite() {
        
        if DataBase.isKeyStored(key: (league?.league_key)!)
        {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart")
            DataBase.deleteFromCoreData(lagueToDeleted: league!)
        }
        else{
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart.fill")
            DataBase.storeLeagueToCoreData(leagueToStored: league!)
        }
    }

    func filterData()
    {
        for item in myFinishedMatches
        {
            if item.league_key == league?.league_key
            {
                selectedLeague.append(item)
            }
        }
        
        print("all data \(myFinishedMatches.count)")
        print("selected data \(selectedLeague.count)")

    }
    
    func UpcomingfilterData()
    {
        for item in myUpcomingMatches
        {
            if item.league_key == league?.league_key
            {
                upcomingSelected.append(item)
            }
        }
        
        print("all data coming\(myFinishedMatches.count)")
        print("selected data coming \(selectedLeague.count)")
        
    }
    
    
    func drawFirstSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.75),
                                               heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 32)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 16, trailing: 10)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(40))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        //applyGradientBackground()
        return section
    }

    
    func drawSecondSection()->NSCollectionLayoutSection
    {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.75), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 32)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 16, trailing: 10)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(40))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
func drawThirdSection()->NSCollectionLayoutSection
{
    
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.9))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.35), heightDimension: .absolute(100))
    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
    group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)
    
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 16, trailing: 10)
    
    let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                            heightDimension: .absolute(40))
    let header = NSCollectionLayoutBoundarySupplementaryItem(
        layoutSize: headerSize,
        elementKind: UICollectionView.elementKindSectionHeader,
        alignment: .top)
    
    section.boundarySupplementaryItems = [header]
    
    return section
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
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch section {
        case 0:
            print(selectedLeague.count)
            return selectedLeague.count
        case 1:
            print(upcomingSelected.count)
            return upcomingSelected.count
        default:
            print("teams = \(myTeams.count)")
           
            return myTeams.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell : UICollectionViewCell
        
        switch indexPath.section {
        case 0:
            let Fcell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LeagueDetailsCollectionViewCell
            Fcell.layer.cornerRadius = 30
            
            Fcell.contentView.layer.cornerRadius = 15
            Fcell.contentView.layer.masksToBounds = true
            //cell.contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
            Fcell.vsL.font = UIFont.boldSystemFont(ofSize: 28)
            Fcell.vsL.textColor = .white
            if selectedLeague.count > 0
            {
                let awaylogoUrl = URL(string: selectedLeague[indexPath.row].away_team_logo!)
                Fcell.awayImg.kf.setImage(with: awaylogoUrl)
                
                let homelogoUrl = URL(string: selectedLeague[indexPath.row].home_team_logo!)
                Fcell.homeImg.kf.setImage(with: homelogoUrl)
                
                Fcell.resultL.text = selectedLeague[indexPath.row].event_final_result
                Fcell.resultL.textColor = .white
                Fcell.dateL.textColor = .white
                Fcell.dateL.text = selectedLeague[indexPath.row].event_date
            }
            cell = Fcell
        case 1 :
            let Ccell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LeagueDetailsCollectionViewCell
            Ccell.layer.cornerRadius = 30

            Ccell.contentView.layer.cornerRadius = 15
            Ccell.contentView.layer.masksToBounds = true
            //cell.contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
            Ccell.vsL.font = UIFont.boldSystemFont(ofSize: 28)
            Ccell.vsL.textColor = .white
            if upcomingSelected.count > 0
            {
                let awaylogoUrl = URL(string: upcomingSelected[indexPath.row].away_team_logo!)
                Ccell.awayImg.kf.setImage(with: awaylogoUrl)
                
                let homelogoUrl = URL(string: upcomingSelected[indexPath.row].home_team_logo!)
                Ccell.homeImg.kf.setImage(with: homelogoUrl)
                
                Ccell.dateL.text = upcomingSelected[indexPath.row].event_date
                Ccell.resultL.text = upcomingSelected[indexPath.row].event_time
                
                Ccell.dateL.textColor = .white
                Ccell.resultL.textColor = .white
            }
            cell = Ccell

        default:
            let Tcell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellT", for: indexPath) as! TeamsCollectionViewCell
        
            Tcell.layer.cornerRadius = 30
            Tcell.contentView.layer.cornerRadius = 15
            Tcell.contentView.layer.masksToBounds = true
            //Tcell.contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
            if myTeams.count > 0
            {
                print("players = \(myTeams[0].players?.count)")
                let teamlogoUrl = URL(string: myTeams[indexPath.row].team_logo ?? "no photo" )
                Tcell.teamLogo.kf.setImage(with: teamlogoUrl)
          
            }
            cell = Tcell

        }
                
        
    return cell
       
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        if indexPath.section == 2
        {
            print ("click")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let objToPlayerPage = storyboard.instantiateViewController(withIdentifier: "player") as? PlayerCollectionViewController {
                objToPlayerPage.team = myTeams[indexPath.row]
                navigationController!.pushViewController(objToPlayerPage, animated: true)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "header",
            for: indexPath)

        header.subviews.forEach { $0.removeFromSuperview() } // Clear previous views

        let titleLabel = UILabel(frame: CGRect(x: 16, y: 0, width: collectionView.frame.width - 32, height: 40))
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        switch indexPath.section {
        case 0:
            titleLabel.text = "Latest Events"
            titleLabel.textColor = .kohlyBlue
            titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        case 1:
            titleLabel.text = "Upcoming Events"
            titleLabel.textColor = .kohlyBlue
            titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        default:
            titleLabel.text = "Teams"
            titleLabel.textColor = .kohlyBlue
            titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        }
        
        header.addSubview(titleLabel)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width/2-10, height: UIScreen.main.bounds.size.height/3-10)
    }
    
    /*override func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }*/
    
    
    

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
