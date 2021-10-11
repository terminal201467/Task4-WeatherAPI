//
//  ViewController.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    let weatherAPI = WeatherAPI()
    let weatherDetailView = WeatherDetailView()
    let weatherHeaderView:WeatherDetailHeaderView = .init()
    var weatherDetail:WeatherDetail = .init()
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = weatherDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewDelegate()
//        getWeatherData()

    }
    
    //MARK:-setMethodGetWeatherData
    func setTableViewDelegate(){
        weatherDetailView.tableView.delegate = self
        weatherDetailView.tableView.dataSource = self
    }
}

extension WeatherDetailViewController:UITableViewDelegate,UITableViewDataSource{
    
    ///Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherAPI.weatherDetail.weatherDetailDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1.register
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherDetail", for: indexPath)
        
        //2.cell content
        cell.textLabel?.text = weatherAPI.weatherDetail.weatherDetailDataArray[indexPath.row]
        
        //3.return cell
        return cell
    }
    
    ///Header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as? WeatherDetailHeaderView
        return header
    }
}


//MARK:-setDataPass
extension WeatherDetailViewController:CityDataDelegate,LatLonDataDelegate{
    ///accept the city Data
    func cityDataDelegate(text: String) {
        ///request the weather data by city
        print(text)
        
//        print("確認城市搜尋頁面的傳值:\(weatherAPI.weatherDetail.city)")
        
        ///the get weather data should receive by a DataStruct
        
    }
    
    ///accept the lat lon Data
    func LatLonDataDelegate(lat: String, lon: String) {
        ///request the weather data by lat lon
        
        print(lat)
        print(lon)
        
        
    }
}

