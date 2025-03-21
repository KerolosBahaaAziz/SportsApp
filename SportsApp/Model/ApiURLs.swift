//
//  ApiURLs.swift
//  SportsApp
//
//  Created by Kerlos on 27/01/2025.
//

import Foundation

struct FootballApiURLs
{
    static let leaguesUrl = "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=93fe36086687f23c181c7bd19f78a0258d76c3ee40812f09cabb79c135c88f6f"
    
    let countriesURL = "https://apiv2.allsportsapi.com/football/?met=Countries&APIkey=93fe36086687f23c181c7bd19f78a0258d76c3ee40812f09cabb79c135c88f6f"
    
    static var teamsURL = "https://apiv2.allsportsapi.com/football/?&met=Teams&APIkey=93fe36086687f23c181c7bd19f78a0258d76c3ee40812f09cabb79c135c88f6f"
    
    static let finishedMatchesURL = "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=93fe36086687f23c181c7bd19f78a0258d76c3ee40812f09cabb79c135c88f6f&from=2021-05-18&to=2021-05-18"
    
    static let upcomingMatchesURL = "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=93fe36086687f23c181c7bd19f78a0258d76c3ee40812f09cabb79c135c88f6f&from=2025-02-01&to=2025-02-07"
}


struct BasketballApiURLs
{
    static let leaguesUrl = "https://apiv2.allsportsapi.com/basketball/?met=Leagues&APIkey=9cbf9aef00b5d2e3f2334ff015d77f1d6043e815a20989b74081b2c9fc79de83"
    
}

struct TennisApiURLs
{
    static let leaguesUrl = "https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=9cbf9aef00b5d2e3f2334ff015d77f1d6043e815a20989b74081b2c9fc79de83"
    
}

