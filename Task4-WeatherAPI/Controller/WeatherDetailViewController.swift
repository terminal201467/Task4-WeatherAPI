//
//  ViewController.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    ///GetWeather
    let weatherAPI = WeatherAPI()
    
    ///View
    let weatherDetailView:WeatherDetailView = .init()
    
    ///DataStruct
    var weatherDetailData:WeatherDetailData = .init()
    
    ///Delegate
    weak var weatherDetailPassToMainDelegate:PassWeatherToMainPageDelegate?
     
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = weatherDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        weatherTextLabel()
        
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        DispatchQueue.main.async {
            self.weatherDetailView.cityLabel.text = ""
            self.weatherDetailView.weatherConditionLabel.text = ""
            self.weatherDetailView.temperatureLabel.text = ""
            self.weatherDetailView.maxLabel.text = ""
            self.weatherDetailView.minLabel.text = ""
        }
        
    }
    
    //MARK: - dataPass
    func cityDataPass(city:String){
        weatherDetailData.cityString = city
    }
    
    func latLonStringPass(lat:String,lon:String){
        weatherDetailData.latString = lat
        weatherDetailData.lonString = lon
    }
    
    //MARK:-MethodForNavigationBar
    @objc func addWeather(){
        
        if weatherDetailData.currentWeatherData != nil{
            weatherDetailPassToMainDelegate?.weatherToMainPage(weatherDetailData.currentWeatherData!)
        }
        //dismissEveryPage
        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func backToSearchPage(){
        dismiss(animated: true, completion: nil)
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
    
    //MARK:-setWeatherText
    func weatherTextLabel(){
        
        if weatherDetailData.cityString != ""{
            ///this place should add the situation about not Decode the data(but should be laterer solve)
            weatherAPI.getWeatherByCity(city: weatherDetailData.cityString) { usableData in
                DispatchQueue.main.async {
                self.weatherDetailView.cityLabel.text = usableData.name
                self.weatherDetailView.weatherConditionLabel.text = usableData.weather[0].description
                    self.weatherDetailView.temperatureLabel.text = "\(usableData.main.returnTemp)"
                self.weatherDetailView.maxLabel.text = "最高\(usableData.main.tempMaxCeisius)"
                    self.weatherDetailView.minLabel.text = "最低\(usableData.main.tempMinCeisius)"
                }
                self.weatherDetailData.currentWeatherData = usableData
            }
        }else{
            
            weatherAPI.getWeatherByLatLon(lat: weatherDetailData.latString, lon: weatherDetailData.lonString){ usableData in
                print("經度：\(self.weatherDetailData.lonString),緯度：\(self.weatherDetailData.latString)")
                DispatchQueue.main.async {
                self.weatherDetailView.cityLabel.text = usableData.name
                self.weatherDetailView.weatherConditionLabel.text = usableData.weather[0].description
                    self.weatherDetailView.temperatureLabel.text = usableData.main.returnTemp
                    self.weatherDetailView.maxLabel.text = "最高"+usableData.main.tempMaxCeisius
                    self.weatherDetailView.minLabel.text = "最低"+usableData.main.tempMinCeisius
                }
                self.weatherDetailData.currentWeatherData = usableData
            }
        }
    }
}



