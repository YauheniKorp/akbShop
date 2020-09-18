//
//  AkbViewController.swift
//  akbShop
//
//  Created by Admin on 27.08.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class AkbViewController: UIViewController {

    

    var vartaButton = UIButton()
    var bannerButton = UIButton()
    
    
    let arrayOfAkbImage = [ UIImage(named: "varta"),
                            UIImage(named: "banner")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Аккумуляторы"

        initAkbButtons()

        
    }
    

    func initAkbButtons() {
        vartaButton = UIButton(frame: CGRect(x: 5, y: 100, width: self.view.bounds.width / 2.2, height: self.view.bounds.height / 5))
        vartaButton.setImage(arrayOfAkbImage[0], for: .normal)
        vartaButton.addTarget(self, action: #selector(goToVartaVC), for: .touchUpInside)
        
        bannerButton = UIButton(frame: CGRect(x: self.view.bounds.width / 2.2 + 10, y: 100, width: self.view.bounds.width / 2.2, height: self.view.bounds.height / 5))
        bannerButton.setImage(arrayOfAkbImage[1], for: .normal)
        bannerButton.addTarget(self, action: #selector(goToBannerVC), for: .touchUpInside)
        self.view.addSubview(bannerButton)
        self.view.addSubview(vartaButton)
    }

    
    @objc func goToBannerVC(param: Any) {
        let bannerVC = self.storyboard?.instantiateViewController(identifier: "banner")
        self.navigationController?.pushViewController(bannerVC!, animated: true)
    }
    
    @objc func goToVartaVC(param: Any) {
        let vartaVC = self.storyboard?.instantiateViewController(identifier: "varta")
        self.navigationController?.pushViewController(vartaVC!, animated: true)
    }
    

}

