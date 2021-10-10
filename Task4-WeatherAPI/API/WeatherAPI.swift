//
//  WeatherAPI.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import Foundation

//setClassForRequestTheWeatherAPI
class WeatherAPI{
    //setBaseURL
    
    var weatherDetail:WeatherDetail = .init()
    
    let baseURL = URL(string:"https://api.openweathermap.org/data/2.5/weather?")
    let api = API()
    
    //setFunctionForCity
    //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    func getWeatherByCity(city:String){
        
        var urlComponent = URLComponents()
        
        urlComponent.queryItems = [
            URLQueryItem(name: "name", value: city),
            URLQueryItem(name: "appid", value: api.key)
        ]
        
        if let url = baseURL?.appendingPathComponent("getWeatherByCity"){
            URLSession.shared.dataTask(with: url){(data,response,error) in
                
                if let error = error{
                    print("Error:\(error.localizedDescription)")
                    return
                }
                
                if let response = response as? HTTPURLResponse{
                    print("StatusCode:\(response.statusCode)")
                    
                }
                
                if let data = data {
                    let decoder = JSONDecoder()
                    do{
                        self.weatherDetail.weatherData = try decoder.decode(CurrentWeatherData.self, from: data)
                    }catch{
                        print("Not Decode")
                    }
                }
            }
        }
    }
    
    //setFunctionForlatlon
    //api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    func getWeatherByLatLon(lat:String,lon:String){
        var urlComponent = URLComponents()
            
            urlComponent.queryItems = [
                URLQueryItem(name: "lat", value: lat),
                URLQueryItem(name: "lon", value: lon),
                URLQueryItem(name: "appid", value: api.key)
            ]
            
            if let url = baseURL?.appendingPathComponent("getWeatherByLatLon"){
                URLSession.shared.dataTask(with: url){(data,response,error) in
                    if let error = error{
                        print("Error:\(error.localizedDescription)")
                    }
                    
                    if let response = response as? HTTPURLResponse{
                        print("Response:\(response.statusCode)")
                    }
                    
                    if let data = data{
                        let decoder = JSONDecoder()
                        do{
                            self.weatherDetail.weatherData = try decoder.decode(CurrentWeatherData.self, from: data)
                        }catch{
                            print("Not Decode")
                        }
                    }
            }
        }
    }
}



