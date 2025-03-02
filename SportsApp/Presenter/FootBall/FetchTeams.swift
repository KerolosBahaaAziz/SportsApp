//
//  FetchTeams.swift
//  SportsApp
//
//  Created by Kerlos on 27/01/2025.
//

import Foundation

class FetchTeams
{
    static var protocolId : TeamsProtocol!
    
    static func fetchView(view : TeamsProtocol)
    {
        self.protocolId = view
    }
    
    static func fetchFootTeams(link : String )
    {
        Services.fetchTeamsFromApi(link: link) { result in
            self.protocolId!.renderToView(result: result!)
        }
    }
}

