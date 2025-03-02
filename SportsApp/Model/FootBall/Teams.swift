//
//  Teams.swift
//  SportsApp
//
//  Created by Kerlos on 27/01/2025.
//

import Foundation

class Teams:Decodable
{
    var result : [TeamDetails]?
}


class TeamDetails :Decodable
{
    
    var team_key : Int?
    var team_name: String?
    var team_logo: String?
    var players : [PlayerDetails]?
    
}

class PlayerDetails:Decodable
{
    var player_image : String?
    var player_name : String?
}
