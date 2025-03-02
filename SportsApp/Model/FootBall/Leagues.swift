//
//  Leagues.swift
//  SportsApp
//
//  Created by Kerlos on 29/01/2025.
//

import Foundation

struct Leagues : Decodable
{
    
    var result : [LeaguesDetails]?

}


struct LeaguesDetails: Decodable
{
   
    var league_key: Int?
    var league_name: String?
    var country_name: String
    var league_logo: String?
    var country_logo: String?
    
}
