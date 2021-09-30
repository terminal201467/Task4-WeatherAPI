//
//  CityData.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import Foundation

//setDataStructForCityAPI
struct City:Decodable{
    var id:Int
    var coord:Coord
    var country:String
    var name:String
}

struct Coord:Decodable{
    var lat:Double
    var lon:Double
}



