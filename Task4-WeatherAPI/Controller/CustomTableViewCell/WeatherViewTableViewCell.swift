//
//  WeatherViewTableViewCell.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/10/1.
//

import UIKit

extension UITableViewCell{
    
    static var reuseIdentifier:String{
        return "\(Self.self)"
    }
}

class WeatherViewTableViewCell: UITableViewCell {
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        label.textColor = .red
        return label
    }()
    
    let temperatureLabel:UILabel = {
        var label = UILabel()
        label.textAlignment = .right
        label.font = .systemFont(ofSize:20)
        label.textColor = .white
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuration(currentWeather:CurrentWeatherData){
        textLabel?.text = currentWeather.name
        detailTextLabel?.text = currentWeather.main.tempString
    }
}


