//
//  WeatherData.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import Foundation

//MARK:-WeatherAPI DataStruct
struct WeatherCoord:Codable {
    var lon:Double
    var lat:Double
    
    var lonString:String{
        return "\(lon)"
    }
    var latString:String{
        return "\(lat)"
    }
}

struct MainMessage:Codable {
    var temp:Double
    var feels_like:Double
    var temp_min:Double
    var temp_max:Double
    var pressure:Double
    var humidity:Int
    
    
    var tempFahrenheit:String{
        return "\(temp)°F"
    }
    
    var tempCeisius:String{
        let c = (temp - 32) * 5 / 9
        let tempInC = "\(c.rounded())°C"
        return tempInC
    }
    
    var tempMinCeisius:String{
        let c = (temp - 32) * 5 / 9
        let tempInMinC = "\(c.rounded())°C"
        return tempInMinC
    }
    
    var tempMaxCeisius:String{
        let c = (temp - 32) * 5 / 9
        let tempInMaxC = "\(c.rounded())°C"
        return tempInMaxC
    }
}

struct Wind:Codable {
    var speed:Double
    var deg:Int
}

struct Clouds:Codable {
    var all:Int
    
}

struct WeatherData:Codable {
    var id:Int
    var main:String
    var description:String
    //var icon:String
}

struct CurrentWeatherData:Codable{
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



//MARK:-WeatherMainViewController's DataStruct
struct WeatherArray {
    var todayWeatherData:[CurrentWeatherData] = []
}
//MARK:-WeatherDetailViewController's DataStruct
struct WeatherDetailData {
    var currentWeatherData:CurrentWeatherData?
    var cityString:String = ""
    var lonString:String = ""
    var latString:String = ""
}
