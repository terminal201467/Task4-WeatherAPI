//
//  LatLonSearchView.swift
//  Task4-WeatherAPI
//
//  Created by Jhen Mu on 2021/10/1.
//

import UIKit

class LatLonSearchView: UIView {

    let lonLabel:UILabel = {
        var label = UILabel()
        label.text = "輸入經度"
        label.textColor = .white
        return label
    }()
    
    let latLabel:UILabel = {
        var label = UILabel()
        label.text = "輸入緯度"
        label.textColor = .white
        
        return label
    }()
    
    
    let lonTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "輸入經度"
        textField.backgroundColor = .lightGray
        textField.textColor = .white
        textField.borderStyle = .bezel
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .done
        textField.becomeFirstResponder()
        
        return textField
    }()
    
    let latTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "輸入緯度"
        textField.backgroundColor = .lightGray
        textField.textColor = .white
        textField.borderStyle = .bezel
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .done
        textField.becomeFirstResponder()
        
        return textField
    }()
    
    lazy var lonStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lonLabel,lonTextField])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var latStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [latLabel,latTextField])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    lazy var stackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lonStackView,latStackView])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(lonLabel)
        addSubview(latLabel)
        addSubview(latTextField)
        addSubview(lonTextField)
        addSubview(lonStackView)
        addSubview(latStackView)
        addSubview(stackView)
        backgroundColor = .black
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func autoLayout(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
