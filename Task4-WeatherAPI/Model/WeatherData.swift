//
//  WeatherData.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import Foundation

//MARK:-WeatherAPI DataStruct
struct WeatherCoord:Decodable {
    var lon:Double
    var lat:Double
    
    var lonString:String{
        return "\(lon)"
    }
    var latString:String{
        return "\(lat)"
    }
}

struct MainMessage:Decodable {
    var temp:Double
    var feels_like:Double
    var temp_min:Double
    var temp_max:Double
    var pressure:Double
    var humidity:Int
    
    var tempInFahrenheit:Double{
        let f = 9/5 * temp + 32
        return f
    }
    
    var tempMinFahrenheit:Double{
        let f = 9/5 * temp_min + 32
        return f
    }
    
    var tempMaxFahrenheit:Double{
        let f = 9/5 * temp_max + 32
        return f
    }
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



//MARK:-WeatherViewController's DataStruct
struct WeatherArray {
    var todayWeatherData:[CurrentWeatherData] = []
    
    var cityString:String
    var temperature:String
    
}

//MARK:-WeatherDetailViewController's DataStruct
struct WeatherDetail {
    var currentWeatherData:CurrentWeatherData
}
