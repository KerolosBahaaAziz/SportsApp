//
//  ApiURLs.swift
//  SportsApp
//
//  Created by Kerlos on 27/01/2025.
//

import Foundation

struct FootballApiURLs
{
    static let leaguesUrl = "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=14699b384623bfce278843fd64cd525d18a2c86b38676d938367aa57b591feb3"
    
    let countriesURL = "https://apiv2.allsportsapi.com/football/?met=Countries&APIkey=14699b384623bfce278843fd64cd525d18a2c86b38676d938367aa57b591feb3"
    
    static var teamsURL = "https://apiv2.allsportsapi.com/football/?&met=Teams&APIkey=14699b384623bfce278843fd64cd525d18a2c86b38676d938367aa57b591feb3"
    
    static let finishedMatchesURL = "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=14699b384623bfce278843fd64cd525d18a2c86b38676d938367aa57b591feb3&from=2021-05-18&to=2021-05-18"
    
    static let upcomingMatchesURL = "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=14699b384623bfce278843fd64cd525d18a2c86b38676d938367aa57b591feb3&from=2025-02-01&to=2025-02-07"
}


struct BasketballApiURLs
{
    static let leaguesUrl = "https://apiv2.allsportsapi.com/basketball/?met=Leagues&APIkey=14699b384623bfce278843fd64cd525d18a2c86b38676d938367aa57b591feb3"
    
}

struct TennisApiURLs
{
    static let leaguesUrl = "https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=14699b384623bfce278843fd64cd525d18a2c86b38676d938367aa57b591feb3"
    
}

