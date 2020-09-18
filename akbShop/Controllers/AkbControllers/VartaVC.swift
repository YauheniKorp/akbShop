//
//  VartaVC.swift
//  akbShop
//
//  Created by Admin on 30.08.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class VartaVC: UIViewController {

    var myTableView = UITableView()
    let basketButton = UIButton()
    
    let basket = UIImage(named: "basket")
    
    var images: [AkbCell] = []
    
    
    struct Cells {
        static let batteryCell = "BatteryCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Varta"
        images = fetchData()
        initializeBasketButton()
        configureTableView()
        
        
        
    }
    
    func configureTableView() {
        view.addSubview(myTableView)
        setDelegate()
        myTableView.rowHeight = 100
        myTableView.register(BatteryCell.self, forCellReuseIdentifier: Cells.batteryCell)
        myTableView.pin(to: view)
        
    }

    func setDelegate() {
        myTableView.delegate = self
        myTableView.dataSource = self
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

}

var basketArray = [AkbCell]()

extension VartaVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: Cells.batteryCell) as! BatteryCell
        let batteries = images[indexPath.row]
        cell.set(battery: batteries)
                
        return cell
    }
    


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Уведомление", message: "Вы хотите добавить в корзину?", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Да", style: .default) { (action) in
            basketArray.append(self.images[indexPath.row])
        }
        let alertAction1 = UIAlertAction(title: "Нет", style: .cancel, handler: nil)
        
        alert.addAction(alertAction)
        alert.addAction(alertAction1)
        self.present(alert, animated: true, completion: nil)
    }
    
}


extension VartaVC {
    
    func fetchData() -> [AkbCell] {
        
        let image1 = AkbCell(image: VartaImages.varta40AsiaEuro, titleLabel: "Varta 40 Ah Asia.\nГабариты: 187х140х227 мм.\nЕмкость: 40 Ач.\nПусковой ток: 300 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "145р")
        let image2 = AkbCell(image: VartaImages.varta40AsiaRus, titleLabel: "Varta 40 Asia.\nГабариты: 187х140х227 мм.\nЕмкость: 40 Ач.\nПусковой ток: 300 А.\nПолярность: прямая (+ -).\nЦена: ", priceLabel: "145р")
        let image3 = AkbCell(image: VartaImages.varta45AsiaEuro, titleLabel: "Varta 45 Ah Asia.\nГабариты: 238х129х227 мм.\nЕмкость: 45 Ач.\nПусковой ток: 330 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "165р")
        let image4 = AkbCell(image: VartaImages.varta45AsiaRus, titleLabel: "Varta 45 Ah Asia.\nГабариты: 238х129х227 мм.\nЕмкость: 45 Ач.\nПусковой ток: 330 А.\nПолярность: прямая (+ -).\nЦена: ", priceLabel: "165р")
        let image5 = AkbCell(image: VartaImages.varta60AsiaEuro, titleLabel: "Varta 60 Ah Asia.\nГабариты: 232х173х225 мм.\nЕмкость: 60 Ач.\nПусковой ток: 540 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "240р")
        let image6 = AkbCell(image: VartaImages.varta60AsiaRus, titleLabel: "Varta 60 Ah Asia.\nГабариты: 232х173х225 мм.\nЕмкость: 60 Ач.\nПусковой ток: 540 А.\nПолярность: прямая (+ -).\nЦена: ", priceLabel: "240р")
        let image7 = AkbCell(image: VartaImages.varta70AsiaEuro, titleLabel: "Varta 70 Ah Asia.\nГабариты: 261х175х220 мм.\nЕмкость: 70 Ач.\nПусковой ток: 630 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "280р")
        let image8 = AkbCell(image: VartaImages.varta70AsiaRus, titleLabel: "Varta 70 Ah Asia.\nГабариты: 261х175х220 мм.\nЕмкость: 70 Ач.\nПусковой ток: 630 А.\nПолярность: прямая (+ -).\nЦена: ", priceLabel: "280р")
        let image9 = AkbCell(image: VartaImages.varta95AsiaEuro, titleLabel: "Varta 95 Ah Asia.\nГабариты: 306х173х225 мм.\nЕмкость: 95 Ач.\nПусковой ток: 830 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "320р")
        let image10 = AkbCell(image: VartaImages.varta95AsiaRus, titleLabel: "Varta 95 Ah Asia.\nГабариты: 306х173х225 мм.\nЕмкость: 95 Ач.\nПусковой ток: 830 А.\nПолярность: прямая (+ -).\nЦена: ", priceLabel: "320р")
        let image11 = AkbCell(image: VartaImages.varta44, titleLabel: "Varta 44 Ah.\nГабариты: 207х175х175 мм.\nЕмкость: 44 Ач.\nПусковой ток: 440 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "185р")
        let image12 = AkbCell(image: VartaImages.varta60, titleLabel: "Varta 60 Ah.\nГабариты: 242х175х190 мм.\nЕмкость: 60 Ач.\nПусковой ток: 540 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "215р")
        let image13 = AkbCell(image: VartaImages.varta74Blue, titleLabel: "Varta 74 Ah Blue Dynamic.\nГабариты: 278х175х190 мм.\nЕмкость: 74 Ач.\nПусковой ток: 680 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "240р")
        let image14 = AkbCell(image: VartaImages.varta80, titleLabel: "Varta 80 Ah Blue Dynamic.\nГабариты: 315х175х175 мм.\nЕмкость: 80 Ач.\nПусковой ток: 740 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "280р")
        let image15 = AkbCell(image: VartaImages.varta95, titleLabel: "Varta 95 Ah Blue Dynamic.\nГабариты: 353х175х190 мм.\nЕмкость: 95 Ач.\nПусковой ток: 800 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "320р")
        let image16 = AkbCell(image: VartaImages.varta52, titleLabel: "Varta 52 Ah Silver Dynamic.\nГабариты: 204х175х175 мм.\nЕмкость: 52 Ач.\nПусковой ток: 510 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "240р")
        let image17 = AkbCell(image: VartaImages.varta54, titleLabel: "Varta 54 Ah Silver Dynamic.\nГабариты: 204х175х190 мм.\nЕмкость: 54 Ач.\nПусковой ток: 520 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "250р")
        let image18 = AkbCell(image: VartaImages.varta61, titleLabel: "Varta 61 Ah Silver Dynamic.\nГабариты: 242х175х175 мм.\nЕмкость: 61 Ач.\nПусковой ток: 600 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "290р")
        let image19 = AkbCell(image: VartaImages.varta63, titleLabel: "Varta 63 Ah Silver Dynamic.\nГабариты: 242х175х190.\nЕмкость: 63 Ач.\nПусковой ток: 610 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "300р")
        let image20 = AkbCell(image: VartaImages.varta74Silver, titleLabel: "Varta 74 Ah Silver Dynamic.\nГабариты: 278х175х175 мм.\nЕмкость: 74 Ач.\nПусковой ток: 750 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "355р")
        let image21 = AkbCell(image: VartaImages.varta77, titleLabel: "Varta 77 Ah Silver Dynamic.\nГабариты: 278х175х190 мм.\nЕмкость: 77 Ач.\nПусковой ток: 780 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "380р")
        let image22 = AkbCell(image: VartaImages.varta85, titleLabel: "Varta 85 Ah Silver Dynamic.\nГабариты: 315х175х175 мм.\nЕмкость: 85 Ач.\nПусковой ток: 850 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "390р")
        let image23 = AkbCell(image: VartaImages.varta100, titleLabel: "Varta 100 Ah Silver Dynamic.\nГабариты: 353х175х190 мм.\nЕмкость: 100 Ач.\nПусковой ток: 830 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "450р")
        let image24 = AkbCell(image: VartaImages.varta110, titleLabel: "Varta 110 Ah Silver Dynamic.\nГабариты: 393х175х190 мм.\nЕмкость: 110 Ач.\nПусковой ток: 920 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "540р")
        let image25 = AkbCell(image: VartaImages.varta60AGM, titleLabel: "Varta 60 Ah AGM.\nГабариты: 242х175х190 мм.\nЕмкость: 60 Ач.\nПусковой ток: 680 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "490р")
        let image26 = AkbCell(image: VartaImages.varta70AGM, titleLabel: "Varta 70 Ah AGM.\nГабариты: 278х175х190 мм.\nЕмкость: 70 Ач.\nПусковой ток: 760 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "525р")
        let image27 = AkbCell(image: VartaImages.varta80AGM, titleLabel: "Varta 80 Ah AGM.\nГабариты: 315х175х190 мм.\nЕмкость: 80 Ач.\nПусковой ток: 800 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "560р")
        let image28 = AkbCell(image: VartaImages.varta95AGM, titleLabel: "Varta 95 Ah AGM.\nГабариты: 353х175х190 мм.\nЕмкость: 95 Ач.\nПусковой ток: 850 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "650р")
        let image29 = AkbCell(image: VartaImages.varta105AGM, titleLabel: "Varta 105 Ah AGM.\nГабариты: 393х175х190 мм.\nЕмкость: 105 Ач.\nПусковой ток: 950 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "750р")
        
        return [image1, image2, image3, image4, image5, image6, image7, image8, image9, image10, image11, image12, image13, image14, image15, image16, image17, image18, image19, image20, image21, image22, image23, image24, image25, image26, image27, image28, image29]
    }
    
}
