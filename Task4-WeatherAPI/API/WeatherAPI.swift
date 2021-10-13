//
//  WeatherAPI.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import Foundation

extension URL{
    
    func withQueries(_ quries:[String:String])->URL?{
        
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        
        components?.queryItems = quries.map{
            
            URLQueryItem(name: $0.key, value: $0.value)
        }
        
        return components?.url
    }
}

//setClassForRequestTheWeatherAPI
class WeatherAPI{
    //setBaseURL
    
    var weatherDetail:WeatherDetailData = .init()
    
    var baseURL = URL(string:"https://api.openweathermap.org/")
    
    let api = API()
    var usableData: CurrentWeatherData?
    //setFunctionForCity
    
    func getWeatherByCity(city:String, completion: @escaping (CurrentWeatherData) -> Void){
            let queries = [
                "q":city,
                "appid":api.key
            ]
    
        if let url = baseURL?.appendingPathComponent("data/2.5/weather").withQueries(queries){
            //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
            print(url)
            
            URLSession.shared.dataTask(with: url){ [self](data,response,error) in

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
                        
                        let data = try decoder.decode(CurrentWeatherData.self, from: data)
//                        self.usableData = data
                        completion(data)
                        self.weatherDetail.currentWeatherData = data
                        
                    }catch{
                        
                        print("Not Decode")
                        
                    }
                }
            }.resume()
        }
    }
    
    //setFunctionForlatlon
    func getWeatherByLatLon(lat:String,lon:String,completion: @escaping (CurrentWeatherData) -> Void){
            let queries = [
                "lat":lat,
                "lon":lon,
                "appid":api.key
            ]
            
        if let url = baseURL?.appendingPathComponent("data/2.5/weather").withQueries(queries){
            //api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
            print(url)
            
                URLSession.shared.dataTask(with: url){[self](data,response,error) in
                    if let error = error{
                        print("Error:\(error.localizedDescription)")
                    }
                    
                    if let response = response as? HTTPURLResponse{
                        print("Response:\(response.statusCode)")
                    }
                    
                    if let data = data{
                        let decoder = JSONDecoder()
                        do{
                            let data = try decoder.decode(CurrentWeatherData.self, from: data)
                            completion(data)
                            self.weatherDetail.currentWeatherData = data
  
                        }catch{
                            
                            print("Not Decode")
                            
                        }
                }
            }.resume()
        }
    }
}



