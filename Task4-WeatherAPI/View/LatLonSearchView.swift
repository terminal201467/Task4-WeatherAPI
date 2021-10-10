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
        label.text = "輸入經度："
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lonTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.backgroundColor = .darkGray
        textField.textColor = .white
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .done
        textField.becomeFirstResponder()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let latLabel:UILabel = {
        var label = UILabel()
        label.text = "輸入緯度："
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let latTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.backgroundColor = .darkGray
        textField.textColor = .white
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .done
        textField.becomeFirstResponder()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //lontitude searching
    lazy var lonStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lonLabel,lonTextField])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //latitude searching
    lazy var latStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [latLabel,latTextField])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //vertical arrange
    lazy var stackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lonStackView,latStackView])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(lonLabel)
        addSubview(latLabel)
        addSubview(lonTextField)
        addSubview(latTextField)
        
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
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 20),
            stackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor,constant: -20),
            stackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor,constant: 20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
