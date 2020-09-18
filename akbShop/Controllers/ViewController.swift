//
//  ViewController.swift
//  akbShop
//
//  Created by Admin on 27.08.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    let imageAkb = UIImage(named: "akom")
    let imageQ8 = UIImage(named: "q8")
    
    let basketButton = UIButton()
    let basket = UIImage(named: "basket")
    
    let countBasketLabel = UILabel()
    
    
    
    @IBOutlet weak var akbButton: UIButton!
    @IBOutlet weak var akbLabel: UILabel!
    
    @IBOutlet weak var q8Button: UIButton!
    @IBOutlet weak var q8Label: UILabel!
    
    var myArray = ["Аккумуляторы", "Масло Q8"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.title = "Интернет-магазин AkbGrodno"
        initializeStartPage()
        initializeBasketButton()
    }
    
    
    
    //MARK: -initialize Buttons in 1st VC
    
    func initializeStartPage() {
        akbButton.setBackgroundImage(imageAkb, for: .normal)
        akbButton.contentMode = .scaleAspectFit
        akbLabel.text = myArray[0]
        akbButton.addTarget(self, action: #selector(goToAkbVC), for: .touchUpInside)
        q8Button.setBackgroundImage(imageQ8, for: .normal)
        q8Button.contentMode = .scaleAspectFill
        q8Button.addTarget(self, action: #selector(goToQ8VC(paramSender:)), for: .touchUpInside)
        q8Label.text = myArray[1]
        

    }
    
    func initializeBasketButton() {
        basketButton.setBackgroundImage(basket, for: .normal)
        basketButton.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        basketButton.addTarget(self, action: #selector(goToBasketVC), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: basketButton)
        

    }
    
 
    @objc func goToBasketVC(paramSender: Any) {
        let basketVC = self.storyboard?.instantiateViewController(identifier: "basketVC")
        self.navigationController?.pushViewController(basketVC!, animated: true)
    }
        //MARK: - @objc methods
    
    @objc func goToAkbVC(paramSender: Any) {
        let akbVC = self.storyboard?.instantiateViewController(identifier: "akb")
        self.navigationController?.pushViewController(akbVC!, animated: true)
    }
    
    @objc func goToQ8VC(paramSender: Any) {
        let q8VC = self.storyboard?.instantiateViewController(identifier: "oil")
        self.navigationController?.pushViewController(q8VC!, animated: true)
    }
    

}

