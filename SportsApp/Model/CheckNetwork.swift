//
//  CheckNetwork.swift
//  SportsApp
//
//  Created by Kerlos on 01/02/2025.
//

import Foundation
import Network

class CheckNetwork
{
    static func checkNetworkConnectionSync() -> Bool {
        let semaphore = DispatchSemaphore(value: 0) // Used to wait for the connection check
        var isConnected = false // Variable to store the connection result
        
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "NetworkMonitorQueue")
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("Internet connection is available")
                isConnected = true
            } else {
                print("No internet connection")
                isConnected = false
            }
            
            monitor.cancel() // Stop monitoring after getting the result
            semaphore.signal() // Notify that the network status is ready
        }
        
        monitor.start(queue: queue)
        semaphore.wait() // Wait until the pathUpdateHandler completes
        return isConnected
    }
}
