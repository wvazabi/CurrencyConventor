//
//  CollectionViewCell.swift
//  CurrencyConventor
//
//  Created by Enes Kaya on 26.10.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let countryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBackground
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    
    let currencyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let rateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func addViews(){
        backgroundColor = .systemBackground
        
        addSubview(countryImageView)
        addSubview(currencyLabel)
        addSubview(rateLabel)
        
        countryImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        countryImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        countryImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        countryImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        currencyLabel.topAnchor.constraint(equalTo: countryImageView.bottomAnchor, constant: 10).isActive = true
        currencyLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        currencyLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        currencyLabel.textAlignment = .center
        
        rateLabel.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: 10).isActive = true
        rateLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        rateLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        rateLabel.textAlignment = .center
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
