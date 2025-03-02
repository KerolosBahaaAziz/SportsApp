//
//  FetchUpcomingMatches.swift
//  SportsApp
//
//  Created by Kerlos on 30/01/2025.
//

import Foundation

class FetchUpcomingMatches
{
    
       
    static var protocolId : UpcomingMatchesProtocol!
        
    static func fetchView(view : UpcomingMatchesProtocol)
        {
            self.protocolId = view
        }
        
        static func fetchUpcomingMatchesLeagues(link : String )
        {
            Services.fetchUpcomingMatchesFromApi(link: link, complitionHandler: { result in
                self.protocolId!.renderToView(result: result!)

            }
           )
        }
    
}
