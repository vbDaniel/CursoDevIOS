//
//  DataStore.swift
//  Trips
//
//  Created by Rethink on 08/03/22.
//

import UIKit

class DataStore{
    
    var travels: [Dictionary <String, String>] = []
    let storeKey = "locaisViagem"
    func getDefaults() -> UserDefaults{
        return UserDefaults.standard
    }
    
    func saveTravel(travel: Dictionary <String, String>){
        travels = listTrips()
        travels.append(travel)
        getDefaults().set(travels, forKey: storeKey)
        getDefaults().synchronize()
    }
    
    func listTrips() -> [Dictionary <String, String>]{
        
        let data = getDefaults().object(forKey: storeKey)
        if data != nil{
            return data as! Array
        }
        else{
            return []
        }
    }
    
    func deleteTravel(indice: Int){
        travels = listTrips()
        travels.remove(at: indice)
        
        getDefaults().set(travels, forKey: storeKey)
        getDefaults().synchronize()
    }
}
