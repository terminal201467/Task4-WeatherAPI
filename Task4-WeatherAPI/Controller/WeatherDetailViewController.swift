//
//  ViewController.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import UIKit

protocol PassWeatherToMainPageDelegate:AnyObject{
    func weatherToMainPage(data:CurrentWeatherData)
}

class WeatherDetailViewController: UIViewController {
    
    ///GetWeather
    let weatherAPI = WeatherAPI()
    
    ///View
    let weatherDetailView:WeatherDetailView = .init()
    
    ///DataStruct
    var weatherDetailData:WeatherDetailData = .init()
    
    ///Delegate
    weak var cityDataPassDelegate: CityDataDelegate?
    weak var latlonDataPassDelegate: LatLonDataDelegate?
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = weatherDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setDataPassDelegate()
        weatherTextLabel()
        
        }
    
    //MARK:-MethodForNavigationBar
    @objc func addWeather(){
        //dismiss
        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
        //passValue
        let weatherMainViewController = WeatherMainViewController()
        //backToTheWeatherMainPage
        weatherMainViewController.modalTransitionStyle = .coverVertical
        weatherMainViewController.modalPresentationStyle = .formSheet
        present(weatherMainViewController, animated: true, completion: nil)
    }
    
    @objc func backToSearchPage(){
        //dismiss every page
        dismiss(animated: true, completion: nil)
        
        DispatchQueue.main.async {
            self.weatherDetailView.cityLabel.text = ""
            self.weatherDetailView.weatherConditionLabel.text = ""
            self.weatherDetailView.temperatureLabel.text = ""
            self.weatherDetailView.maxLabel.text = ""
            self.weatherDetailView.minLabel.text = ""
        }

    }
    
    //MARK:-setNavigationBar
    func setNavigationBar(){
        navigationController?.navigationBar.tintColor = .white
        
        let addButton = UIBarButtonItem(title: "加入",
                                        style: .plain,
                                        target: self,
                                        action: #selector(WeatherDetailViewController.addWeather))
        
        let cancelButton = UIBarButtonItem(title: "取消",
                                           style: .plain,
                                           target: self,
                                           action: #selector(WeatherDetailViewController.backToSearchPage))
        
        navigationItem.rightBarButtonItem = addButton
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    //MARK:-DataDelegate
    func setDataPassDelegate(){
        cityDataPassDelegate = self
        latlonDataPassDelegate = self
    }
    
    //MARK:-setWeatherText
    func weatherTextLabel(){
        if weatherDetailData.cityString != ""{
            weatherAPI.getWeatherByCity(city: weatherDetailData.cityString) { usableData in
                DispatchQueue.main.async {
                self.weatherDetailView.cityLabel.text = usableData.name
                self.weatherDetailView.weatherConditionLabel.text = usableData.weather[0].description
                self.weatherDetailView.temperatureLabel.text = "\(usableData.main.temp)°"
                self.weatherDetailView.maxLabel.text = "最高\(usableData.main.temp_max)°"
                self.weatherDetailView.minLabel.text = "最低\(usableData.main.temp_min)°"
                }
            }
        }else{
            weatherAPI.getWeatherByLatLon(lat: weatherDetailData.latString, lon: weatherDetailData.lonString){ usableData in
                DispatchQueue.main.async {
                self.weatherDetailView.cityLabel.text = usableData.name
                self.weatherDetailView.weatherConditionLabel.text = usableData.weather[0].description
                self.weatherDetailView.temperatureLabel.text = "\(usableData.main.temp)°"
                self.weatherDetailView.maxLabel.text = "最高\(usableData.main.temp_max)°"
                self.weatherDetailView.minLabel.text = "最低\(usableData.main.temp_min)°"
                }
            }
        }
    }
}

//MARK:-setDataPass
extension WeatherDetailViewController:CityDataDelegate,LatLonDataDelegate{
    func cityDataDelegate(text: String) {

        weatherDetailData.cityString = text
    }
 
    func LatLonDataDelegate(lat: String, lon: String) {
    
        weatherDetailData.latString = lat
        weatherDetailData.lonString = lon
        
    }
}


