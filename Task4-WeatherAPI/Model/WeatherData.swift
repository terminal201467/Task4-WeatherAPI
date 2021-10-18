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
    ///Kelvin temperature
    var temp:Double
    var feels_like:Double
    var temp_min:Double
    var temp_max:Double
    var pressure:Double
    var humidity:Int
    
    ///theSwitchOf
    var tempFahrenheit:String{
        let f = ((temp - 273.15 + 32) * 9/5).rounded()
        return "\(f)°F"
    }
    var tempCeisius:String{
        let c = (temp - 273.15).rounded()
        return "\(c)°C"
    }
    
    ///Ceisius
    var tempMinCeisius:String{
        let c = (temp - 273.15).rounded()
        return "\(c)°C"
    }
    
    var tempMaxCeisius:String{
        let c = (temp - 273.15).rounded()
        return "\(c)°C"
    }
    
    ///Fahrenheit
    var tempMaxFahrenheit:String{
        let f = ((temp - 273.15 + 32) * 9/5).rounded()
        return "\(f)°F"
    }
    
    var tempMinFahrenheit:String{
        let f = ((temp - 273.15 + 32) * 9/5).rounded()
        return "\(f)°F"
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
    var currentWeatherData:CurrentWeatherData?
    var todayWeatherData:[CurrentWeatherData] = []
}

//MARK:-WeatherDetailViewController's DataStruct
struct WeatherDetailData {
    var currentWeatherData:CurrentWeatherData?
    var cityString:String = ""
    var lonString:String = ""
    var latString:String = ""
}
