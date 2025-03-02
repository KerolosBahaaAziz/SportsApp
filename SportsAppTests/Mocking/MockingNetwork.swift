//
//  MockingNetwork.swift
//  news from APITests
//
//  Created by Kerlos on 01/02/2025.
//

import Foundation

import XCTest
@testable import SportsApp

final class MockNetworkManger: XCTestCase {

    
    var fakeNetworkObj = SimulateNetwork(shouldReturnError: false) //error
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDataFromAPI()
    {
        fakeNetworkObj.loadLeaguesFromAPI(url:FootballApiURLs.leaguesUrl) { new, error in
            
            if let error = error{
                XCTFail()
            }else{
                XCTAssertNotNil(new)
            }
            
        }
        
        fakeNetworkObj.loadFinishedMatchesFromAPI(url:FootballApiURLs.finishedMatchesURL) { new, error in
            
            if let error = error{
                XCTFail()
            }else{
                XCTAssertNotNil(new)
            }
            
        }
        fakeNetworkObj.loadTeamsFromAPI(url:FootballApiURLs.teamsURL) { new, error in
            
            if let error = error{
                XCTFail()
            }else{
                XCTAssertNotNil(new)
            }
            
        }
        
        fakeNetworkObj.loadUpcomingMatchesFromAPI(url:FootballApiURLs.upcomingMatchesURL) { new, error in
            
            if let error = error{
                XCTFail()
            }else{
                XCTAssertNotNil(new)
            }
            
        }

    }
    
}
