//
//  SimulateNetwork.swift
//  news from APITests
//
//  Created by Kerlos on 01/02/2025.
//

import Foundation
@testable import SportsApp

class SimulateNetwork
{
    var shouldReturnError :Bool
    let newsJsonResponse :[[String: String]] = [["author":"Bettina Inclán", "title":"NASA Named Best Place to Work in Federal Government for 8th Straight Year", "desription":"For the eighth consecutive year, NASA has been selected by the Partnership for Public Service as the Best Place to Work in Government. The rankings, announced Tuesday, reflect NASA’s unified focus and dedication to sending humans farther into space than ever before, and the agency’s highest employee satisfaction results since this index was developed.\n\n\"NASA’s selection as the Best Place to Work in Government for the eighth year in a row is a testament to the excellence of our workforce and their determination to maintain America’s leadership in space exploration,” said NASA Administrator Jim Bridenstine. “Throughout this year as I have visited each of our centers, I have personally witnessed their unparalleled commitment to accomplishing our mission. The daily devotion of our employees makes them well deserving of this award. I am honored to lead such a dedicated team. They are what makes NASA the Best Place to Work in Government.\"\n\nThe Best Places to Work rankings are based on responses from almost 883,000 at 490 federal agencies and subcomponents to the Office of Personnel Management’s annual Federal Employee Viewpoint Survey. This is the 16th edition of the Best Places to Work rankings since the first in 2003.\n\nNASA has led the charge in space exploration for more than six decades. Through its Artemis program, the agency is charting America’s return to the Moon and human exploration of Mars. As the agency strives toward sending the first woman and next man to the Moon by 2024, the employees at NASA are a crucial component to the mission’s success.",
        "imageUrl":"https://raw.githubusercontent.com/DevTides/NewsApi/master/img1.jpg",
        "url":"https://www.nasa.gov/press-release/nasa-named-best-place-to-work-in-federal-government-for-8th-straight-year",
        "publishedAt":"Dec. 18"
     ]]
    
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError //true >>error | false>>data
    }
    enum ResponseWithError:Error
    {
        case responseError
    }
    
}

extension SimulateNetwork
{
    func loadLeaguesFromAPI(url:String , complitionHandler:@escaping ([Leagues]? , Error?)->Void)
    {
        if shouldReturnError{  //offline
            
            //error in API
            complitionHandler(nil , ResponseWithError.responseError)
            
        }else{
            // function pass
            var newsArr = [Leagues]()
            complitionHandler(newsArr , nil)
        }
    }
    
    func loadFinishedMatchesFromAPI(url:String , complitionHandler:@escaping ([FinishedMatches]? , Error?)->Void)
    {
        if shouldReturnError{  //offline
            
            //error in API
            complitionHandler(nil , ResponseWithError.responseError)
            
        }else{
            // function pass
            var newsArr = [FinishedMatches]()
            complitionHandler(newsArr , nil)
        }
    }
    
    func loadTeamsFromAPI(url:String , complitionHandler:@escaping ([Teams]? , Error?)->Void)
    {
        if shouldReturnError{  //offline
            
            //error in API
            complitionHandler(nil , ResponseWithError.responseError)
            
        }else{
            // function pass
            var newsArr = [Teams]()
            complitionHandler(newsArr , nil)
        }
    }
    
    func loadUpcomingMatchesFromAPI(url:String , complitionHandler:@escaping ([UpcomingMatches]? , Error?)->Void)
    {
        if shouldReturnError{  //offline
            
            //error in API
            complitionHandler(nil , ResponseWithError.responseError)
            
        }else{
            // function pass
            var newsArr = [UpcomingMatches]()
            complitionHandler(newsArr , nil)
        }
    }
}
