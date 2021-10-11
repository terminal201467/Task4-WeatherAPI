//
//  WeatherDetailHeaderView.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/10/1.
//

import UIKit

class WeatherDetailHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "Header"
    
    ///PlaceLabel
    let cityLabel:UILabel = {
        var label = UILabel()
        label.text = "台南市"//"\()"
        label.textColor = .white
        return label
    }()
    
    ///weatherCondition
    let weatherConditionLabel:UILabel = {
        var label = UILabel()
        label.text = "雷雨"//"\()"
        label.textColor = .white
        
        return label
    }()
    
    ///temperature
    let temperatureLabel:UILabel = {
        var label = UILabel()
        label.text = "24"//"\()"
        label.textColor = .white
        
        return label
    }()
    
    ///left:maxTemp
    let maxLabel:UILabel = {
        var label = UILabel()
        label.text = "最高：30"//"最高：\()"
        label.textColor = .white
        return label
    }()
    
    ///right:minTemp
    let minLabel:UILabel = {
        var label = UILabel()
        label.text = "最低：23"//"最低：\()"
        label.textColor = .white
        return label
    }()
    
    lazy var maxMinTemperatureStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [maxLabel,minLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    lazy var stackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cityLabel,weatherConditionLabel,temperatureLabel,maxLabel,minLabel,maxMinTemperatureStackView])
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        addSubview(cityLabel)
        addSubview(weatherConditionLabel)
        addSubview(temperatureLabel)
        addSubview(maxLabel)
        addSubview(minLabel)
        addSubview(maxMinTemperatureStackView)
        addSubview(stackView)
        
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func autoLayout(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    

}
