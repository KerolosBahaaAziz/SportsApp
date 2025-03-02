//
//  FetchLeagues.swift
//  SportsApp
//
//  Created by Kerlos on 27/01/2025.
//

import Foundation

class FetchLeagues
{
    static var protocolId : LeaguesProtocol!
    
    static func fetchView(view : LeaguesProtocol)
    {
        self.protocolId = view
    }
    
    static func fetchFootLeagues(link : String )
    {
        Services.fetchLeaguesFromApi(link: link) { result in
            self.protocolId!.renderToView(result: result!)
        }
    }
}

