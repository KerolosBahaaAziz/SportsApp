//
//  PresentNetwork.swift
//  SportsApp
//
//  Created by Kerlos on 01/02/2025.
//

import Foundation

class PresentNetwork
{
    
    static func checkNtwork() -> Bool
    {
        return CheckNetwork.checkNetworkConnectionSync()
    }
}
