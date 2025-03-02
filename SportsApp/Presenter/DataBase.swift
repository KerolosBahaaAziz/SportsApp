//
//  DataBase.swift
//  SportsApp
//
//  Created by Kerlos on 31/01/2025.
//

import Foundation
import CoreData
import UIKit

class DataBase
{
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static var manger = appDelegate.persistentContainer.viewContext
    
    static func storeLeagueToCoreData(leagueToStored : LeaguesDetails)
    {
        // let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Fav", in: manger) else {
            fatalError("Failed to load entity description for Movie")
        }
        
        let league = NSManagedObject(entity: entity, insertInto: manger)
        
        league.setValue(leagueToStored.league_name, forKey: "league")
        league.setValue(leagueToStored.country_name, forKey: "country")
        league.setValue(leagueToStored.league_logo, forKey: "logo")
        league.setValue(leagueToStored.league_key, forKey: "key")
        
        do{
            try manger.save()
            print("Saved")
        }catch let error{
            print("error")
        }
    }
    
    
    static func fetchFromCoreData(compilationHandler : @escaping ([NSManagedObject]?)->Void)
    {
        var leagues : [NSManagedObject]
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Fav")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manger = appDelegate.persistentContainer.viewContext
        // predicate
        
        /*let predicate = NSPredicate(format: "rating < %f and title == %@" ,5.0, "movie1")
         fetch.predicate = predicate*/
        do{
            leagues = try manger.fetch(fetchRequest)
            compilationHandler(leagues)
        }catch let error
        {
            print(error.localizedDescription)
        }
    }
    
    
    static func deleteFromCoreData(lagueToDeleted : LeaguesDetails)
    {
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "Fav")
        
        do{
            var movies = try manger.fetch(fetch)
            for item in movies
            {
                if item.value(forKey: "key") as! Int == lagueToDeleted.league_key
                {
                    DataBase.manger.delete(item)
                }
            }
            //movies.remove(at: row)
            print("deleted")
            
            try DataBase.manger.save()
        }catch let error
        {
            print(error.localizedDescription)
        }
    }
    
    static func isKeyStored(key: Int) -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return false
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Fav")
        
        fetchRequest.predicate = NSPredicate(format: "key == %d", key)
        
        do {
            let results = try context.fetch(fetchRequest)
            return !results.isEmpty  // If results exist, key is stored
        } catch {
            print("Failed to fetch: \(error.localizedDescription)")
            return false
        }
        
    }
    
}
