//
//  WeatherViewTableViewCell.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/10/1.
//

import UIKit

extension UITableViewCell{
    static var reuseIdentifier:String{
        return "WeatherCell"
    }
}

class WeatherViewTableViewCell: UITableViewCell {
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 35)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let temperatureLabel:UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize:40)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cityLabel,temperatureLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        ///label Didn't show the text
        ///why it happend?
        contentView.addSubview(cityLabel)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(stackView)
        autoLayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:-autoLayout
    func autoLayout(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    ///inCeisius
    func configurationInCeisius(currentWeather:CurrentWeatherData){
        cityLabel.text = currentWeather.name
        temperatureLabel.text = currentWeather.main.tempCeisius
    }
    ///inFahrenheit
    func configurationInFahrenheit(currentWeather:CurrentWeatherData){
        cityLabel.text = currentWeather.name
        temperatureLabel.text = currentWeather.main.tempFahrenheit
    }
}


