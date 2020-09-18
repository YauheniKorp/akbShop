//
//  BannerVC.swift
//  akbShop
//
//  Created by Admin on 30.08.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class BannerVC: UIViewController {

    var myTableView = UITableView()
    var basketButton = UIButton()
    var images: [AkbCell] = []
    let basket = UIImage(named: "basket")
    
    struct Cells {
        static let batteryCell = "BatteryCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        initializeBasketButton()
        images = fetchData()
        
        self.title = "Banner"
    }
    


    func configureTableView() {
        self.view.addSubview(myTableView)
        setDelegate()
        myTableView.rowHeight = 100
        myTableView.register(BatteryCell.self, forCellReuseIdentifier: Cells.batteryCell)
        myTableView.pin(to: self.view)
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



extension BannerVC: UITableViewDataSource, UITableViewDelegate {
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
    
    func fetchData() -> [AkbCell]{
        let image1 = AkbCell(image: BannerImages.banner45AsiaEuro, titleLabel: "Banner 45 Ah Asia.\nГабариты: 238х129х227 мм.\nЕмкость: 45 Ач.\nПусковой ток: 390 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "180р")
        let image2 = AkbCell(image: BannerImages.banner45AsiaRus, titleLabel: "Banner 45 Ah Asia.\nГабариты: 238х129х227 мм.\nЕмкость: 45 Ач.\nПусковой ток: 390 А.\nПолярность: обратная (+ -).\nЦена: ", priceLabel: "180р")
        let image3 = AkbCell(image: BannerImages.banner50Euro, titleLabel: "Banner 50 Ah.\nГабариты: 207х175х190 мм.\nЕмкость: 50 Ач.\nПусковой ток: 450 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "170р")
        let image4 = AkbCell(image: BannerImages.banner55, titleLabel: "Banner 55 Ah \nГабариты: 242х175х190 мм.\nЕмкость: 55 Ач.\nПусковой ток: 480 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "190р")
        let image5 = AkbCell(image: BannerImages.banner60, titleLabel: "Banner 60 Ah.\nГабариты: 242х175х190 мм.\nЕмкость: 60 Ач.\nПусковой ток: 540 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "220р")
        let image6 = AkbCell(image: BannerImages.banner60AsiaEuro, titleLabel: "Banner 60 Ah Asia.\nГабариты: 232х173х225 мм.\nЕмкость: 60 Ач.\nПусковой ток: 540 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "220р")
        let image7 = AkbCell(image: BannerImages.banner60AsiaRus, titleLabel: "Banner 60 Ah Asia.\nГабариты: 232х173х225 мм.\nЕмкость: 60 Ач.\nПусковой ток: 540 А.\nПолярность: обратная (+ -).\nЦена: ", priceLabel: "220р")
        let image8 = AkbCell(image: BannerImages.banner62, titleLabel: "Banner 62 Ah.\nГабариты: 242х175х175 мм.\nЕмкость: 62 Ач.\nПусковой ток: 600 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "230р")
        let image9 = AkbCell(image: BannerImages.banner63, titleLabel: "Banner 63 Ah.\nГабариты: 242х175х190 мм.\nЕмкость: 63 Ач.\nПусковой ток: 610 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "240р")
        let image10 = AkbCell(image: BannerImages.banner70AsiaEuro, titleLabel: "Banner 70 Ah Asia.\nГабариты: 261х175х220 мм.\nЕмкость: 70 Ач.\nПусковой ток: 600 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "250р")
        let image11 = AkbCell(image: BannerImages.banner70AsiaRus, titleLabel: "Banner 70 Ah Asia.\nГабариты: 261х175х220 мм.\nЕмкость: 70 Ач.\nПусковой ток: 600 А.\nПолярность: обратная (+ -).\nЦена: ", priceLabel: "250р")
        let image12 = AkbCell(image: BannerImages.banner74, titleLabel: "Banner 74 Ah.\nГабариты: 278х175х175 мм.\nЕмкость: 74 Ач.\nПусковой ток: 680 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "250р")
        let image13 = AkbCell(image: BannerImages.banner77, titleLabel: "Banner 77 Ah.\nГабариты: 278х175х190 мм.\nЕмкость: 77 Ач.\nПусковой ток: 680 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "260р")
        let image14 = AkbCell(image: BannerImages.banner84, titleLabel: "Banner 84 Ah.\nГабариты: 315х175х190 мм.\nЕмкость: 84 Ач.\nПусковой ток: 800 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "300р")
        let image15 = AkbCell(image: BannerImages.banner80AsiaEuro, titleLabel: "Banner 80 Ah Asia.\nГабариты: 261х175х220 мм.\nЕмкость: 80 Ач.\nПусковой ток: 650 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "280р")
        let image16 = AkbCell(image: BannerImages.banner95AsiaEuro, titleLabel: "Banner 95 Ah Asia.\nГабариты: 306х173х225 мм.\nЕмкость: 95 Ач.\nПусковой ток: 780 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "265р")
        let image17 = AkbCell(image: BannerImages.banner95AsiaRus, titleLabel: "Banner 95 Ah Asia.\nГабариты: 306х173х225 мм.\nЕмкость: 95 Ач.\nПусковой ток: 780 А.\nПолярность: обратная (+ -).\nЦена: ", priceLabel: "320р")
        let image18 = AkbCell(image: BannerImages.banner100, titleLabel: "Banner 100 Ah.\nГабариты: 353х175х190 мм.\nЕмкость: 100 Ач.\nПусковой ток: 830 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "265р")
        let image19 = AkbCell(image: BannerImages.banner70Agm, titleLabel: "Banner 70 Ah AGM.\nГабариты: 278х175х190 мм.\nЕмкость: 70 Ач.\nПусковой ток: 760 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "400р")
        let image20 = AkbCell(image: BannerImages.banner80Agm, titleLabel: "Banner 80 Ah AGM.\nГабариты: 315х175х190 мм.\nЕмкость: 80 Ач.\nПусковой ток: 800 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "470р")
        let image21 = AkbCell(image: BannerImages.banner92Agm, titleLabel: "Banner 92 Ah AGM.\nГабариты: 353х175х190 мм.\nЕмкость: 92 Ач.\nПусковой ток: 850 А.\nПолярность: обратная (- +).\nЦена: ", priceLabel: "550р")
        
        
        return [image1,image2,image3,image4,image5,image6,image7,image8,image9,image10,image11,image12,image13,image14,image15,image16,image17,image18,image19,image20,image21]
    }
    
}
