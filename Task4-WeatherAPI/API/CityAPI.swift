//
//  WorldCityAPI.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import Foundation
//setClassForRequestCityAPI
class CityAPI{
    //setJson
    var searchArray:SearchArray = .init()
    func ReadJson(){
        do{
            let jsonData = Bundle.main.url(forResource: "current.city.list", withExtension: "json")!
            let data = try Data(contentsOf: jsonData)
            //setDecoder
            let cityData = try JSONDecoder().decode([City].self, from: data)
            //GetAArrayIncloud:coord、country、name
            searchArray.cityDataArray = cityData.map({City(coord: $0.coord,
                                      country: $0.country,
                                      name: $0.name)})
        }catch{
            print("Not Decode")
        }
    }
    
}



