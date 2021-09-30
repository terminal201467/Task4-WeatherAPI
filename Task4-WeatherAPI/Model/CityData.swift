//
//  CityData.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import Foundation

//MARK:-setDataStructForCityAPI

struct City:Decodable{
    var coord:CityCoord
    var country:String
    var name:String
}

struct CityCoord:Decodable{
    var lat:Double
    var lon:Double
}

struct SearchArray {
    var cityDataArray:[City] = []
    var resultArray:[City] = []
    
    
    mutating func filterCity(for searchText:String){
        
        resultArray = cityDataArray.filter({filterItem -> Bool in
    
            let words = filterItem.name
            
            let isMach = words.localizedCaseInsensitiveContains(searchText)
            
            return isMach
        })
    }

}




//IdeaOfThinkAboutSearchController's String Handling

//searchControllerOnlyReadAndProduct"String"
//but lat/lon is Double


//searchControllerlatlonFilter



