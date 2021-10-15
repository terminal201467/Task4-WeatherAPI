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
    
    var latString:String{
        return "\(coord.lat)"
    }
    var lonString:String{
        return "\(coord.lon)"
    }

}

struct CityCoord:Decodable{
    var lat:Double
    var lon:Double
}


//MARK:-searchViewController's Data
struct SearchArray {
    var cityData:[City] = []
    var resultData:[String] = []
    var cityNameArray:[String]{ return cityData.map({$0.name}) }
    
    ///filter
    mutating func filterArray(for searchText:String){
        resultData = cityNameArray.filter({filterItem -> Bool in
            let words = filterItem
            let isMach = words.localizedCaseInsensitiveContains(searchText)
            return isMach
        })
    }
}

///經緯度要求
struct latLonData {
    var lat:String
    var lon:String
}



