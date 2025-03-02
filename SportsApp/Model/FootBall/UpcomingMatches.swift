//
//  FinishedMatches.swift
//  SportsApp
//
//  Created by Kerlos on 29/01/2025.
//

import Foundation

class UpcomingMatches : Decodable
{
    var result : [UpcomingMatchesDetails]?
        
}



class UpcomingMatchesDetails: Decodable
{
    
    var event_date : String?
    var event_time : String?
    var event_home_team : String?
    var event_away_team : String?
    var league_name : String?
    var event_final_result : String?
    var league_key : Int?
    var home_team_logo : String?
    var away_team_logo : String?

}
