//
//  FetchFinishedMatches.swift
//  SportsApp
//
//  Created by Kerlos on 29/01/2025.
//

import Foundation


class FetchFinishedMatches

{
    
    static var protocolId : FinishedMatchesProtocol!
    
    static func fetchView(view : FinishedMatchesProtocol)
    {
        self.protocolId = view
    }
    
    static func fetchFinishedMatchesLeagues(link : String )
    {
        Services.fetchFinishedMatchesFromApi(link: link, complitionHandler: { result in
            self.protocolId!.renderToView(result: result!)

        }
       )
    }
    
}
