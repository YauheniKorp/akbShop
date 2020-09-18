//
//  BatteryCell.swift
//  akbShop
//
//  Created by Admin on 05.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class BatteryCell: UITableViewCell {
    
    var batteryImage = UIImageView()
    var batteryTitleLabel = UILabel()
    var basketButton = UIButton()
    var priceLabel = UILabel()
    var basketImage = UIImage(named: "basket")
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(batteryImage)
        addSubview(batteryTitleLabel)
        
        configureBatteryImage()
        configureBatteryTitleLabel()
//        configureBasketButton()
        configurePriceLabel()
        setConstraintsForImage()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(battery: AkbCell) {
        batteryImage.image = battery.image
        batteryTitleLabel.text = battery.titleLabel
        priceLabel.text = battery.priceLabel
    }
    
//    func configureBasketButton() {
//        basketButton.setBackgroundImage(basketImage, for: .normal)
//        basketButton.frame = CGRect(x: self.center.x + 100, y: self.center.y + 55, width: 20, height: 20)
//        addSubview(basketButton)
//    }
    
    func configurePriceLabel() {
        priceLabel.frame = CGRect(x: self.center.x + 140, y: self.center.y + 52, width: 30, height: 20)
        priceLabel.textColor = .black
        priceLabel.adjustsFontSizeToFitWidth = true
        addSubview(priceLabel)
    }
    
    func configureBatteryImage() {
        batteryImage.layer.cornerRadius = 10
        batteryImage.clipsToBounds = true
    }
    
    func configureBatteryTitleLabel() {
        batteryTitleLabel.numberOfLines = 0
        batteryTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setConstraintsForImage() {
        batteryImage.translatesAutoresizingMaskIntoConstraints = false
        batteryImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        batteryImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        batteryImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        batteryImage.widthAnchor.constraint(equalTo: batteryImage.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setTitleLabelConstraints() {
        batteryTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        batteryTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        batteryTitleLabel.leadingAnchor.constraint(equalTo: batteryImage.trailingAnchor, constant: 20).isActive = true
        batteryTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        batteryTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    

    
}


