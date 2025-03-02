//
//  Services.swift
//  MVP
//
//  Created by Kerlos on 23/01/2025.
//

import Foundation

class Services
{
    static func fetchLeaguesFromApi(link : String , complitionHandler : @escaping (Leagues?)->Void)
    {
        let url = URL(string: link)
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            do
            {
                let json = try JSONDecoder().decode(Leagues.self, from: data!)
                print(json.result![0].league_name)
                complitionHandler(json)
                
            }
            catch let error
            {
                print(error.localizedDescription)
                print("error")
            }
        }
        task.resume()
    }
    
    
    static func fetchTeamsFromApi(link : String , complitionHandler : @escaping (Teams?)->Void)
    {
        let url = URL(string: link)
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            do
            {
                let json = try JSONDecoder().decode(Teams.self, from: data!)
                //print(json.result![0].team_name)
                complitionHandler(json)
                
            }
            catch let error
            {
                print(error.localizedDescription)
                print("error")
            }
        }
        task.resume()
    }

    
    static func fetchFinishedMatchesFromApi(link : String , complitionHandler : @escaping (FinishedMatches?)->Void)
    {
        let url = URL(string: link)
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            do
            {
                let json = try JSONDecoder().decode(FinishedMatches.self, from: data!)
                print("=========================")
                print(json.result![0].event_final_result)
                complitionHandler(json)
                
            }
            catch let error
            {
                print(error.localizedDescription)
                print("error")
            }
        }
        task.resume()
    }
    
    
    static func fetchUpcomingMatchesFromApi(link : String , complitionHandler : @escaping (UpcomingMatches?)->Void)
    {
        let url = URL(string: link)
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            do
            {
                let json = try JSONDecoder().decode(UpcomingMatches.self, from: data!)
                print("=========================")
                print(json.result![0].event_final_result)
                complitionHandler(json)
                
            }
            catch let error
            {
                print(error.localizedDescription)
                print("error")
            }
        }
        task.resume()
    }
    
    
}

