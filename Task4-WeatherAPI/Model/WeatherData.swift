//
//  WeatherData.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import Foundation

struct WeatherCoord:Decodable {
    var lon:Double
    var lat:Double
}

struct MainMessage:Decodable {
    var temp:Double
    var feels_like:Double
    var temp_min:Double
    var temp_max:Double
    var pressure:Double
    var humidity:Int
}

struct Wind:Decodable {
    var speed:Double
    var deg:Int
}

struct Clouds:Decodable {
    var all:Int
    
}

struct WeatherData:Decodable {
    var id:Int
    var main:String
    var description:String
    //var icon:String
}

struct CurrentWeatherData:Decodable{
    var name:String
    var id:Int
    var dt:TimeInterval
    
    var coord:WeatherCoord
    var main:MainMessage
    var wind:Wind
    var clouds:Clouds
    var weather:[WeatherData]
}

struct API{
    var key:String = "71f500bc843aedee86afefe5d6329fa4"
}


//MARK:-setTemperatureUnitTransition
enum TemperatureUnit{
    case c,f
}
