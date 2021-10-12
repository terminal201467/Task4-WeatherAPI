//
//  View.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/9/29.
//

import UIKit

class WeatherDetailView: UIView {
    ///PlaceLabel
    let cityLabel:UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        label.font = label.font.withSize(30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    ///weatherCondition
    let weatherConditionLabel:UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    ///temperature
    let temperatureLabel:UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    ///left:maxTemp
    let maxLabel:UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        label.font = label.font.withSize(15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    ///right:minTemp
    let minLabel:UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        label.font = label.font.withSize(15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK:-StackView
    lazy var maxMinTemperatureStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [maxLabel,minLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var stackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cityLabel,
                                                       weatherConditionLabel,
                                                       temperatureLabel,
                                                       maxMinTemperatureStackView])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK:-InitializeTheView
    override init(frame: CGRect){
        super.init(frame: frame)
        ///View is Initialized
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
    
    //MARK:-AutoLayout
    func autoLayout(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
