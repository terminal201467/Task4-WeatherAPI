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
    static let shared = WeatherAPI()
    let baseURL = URL(string:"https://api.openweathermap.org/data/2.5/weather?")
    let api = API()
    
    //setFunctionForCity
    //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    func getWeatherByCity(city:String,completionHandler:((Result<CurrentWeatherData,Error>)->Void)?){
        
        var urlComponent = URLComponents()
        
        urlComponent.queryItems = [
            URLQueryItem(name: "name", value: city),
            URLQueryItem(name: "appid", value: api.key)
        ]
        
        if let url = baseURL?.appendingPathComponent("getWeatherByCity"){
            URLSession.shared.dataTask(with: url){(data,response,error) in
                
                if let error = error{
                    print("Error:\(error.localizedDescription)")
                    completionHandler?(.failure(error))
                    return
                }
                
                if let response = response as? HTTPURLResponse{
                    print("StatusCode:\(response.statusCode)")
                    
                }
                
                if let data = data {
                    let decoder = JSONDecoder()
                    do{
                        let weatherData = try decoder.decode(CurrentWeatherData.self, from: data)
                        completionHandler?(.success(weatherData))
                        
                    }catch{
                        
                        completionHandler?(.failure(error))
                    }
                }
            }
        }
    }
    
    //setFunctionForlatlon
    //api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    func getWeatherByLatLon(lat:String,lon:String,completionHandler:((Result<CurrentWeatherData,Error>)->Void)?){
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
                        completionHandler?(.failure(error))
                    }
                    
                    if let response = response as? HTTPURLResponse{
                        print("Response:\(response.statusCode)")
                    }
                    
                    if let data = data{
                        let decoder = JSONDecoder()
                        do{
                            let weather = try decoder.decode(CurrentWeatherData.self, from: data)
                            completionHandler?(.success(weather))
                        }catch{
                            completionHandler?(.failure(error))
                        }
                    }
            }
        }
    }
}



