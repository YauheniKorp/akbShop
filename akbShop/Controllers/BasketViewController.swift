//
//  BasketViewController.swift
//  akbShop
//
//  Created by Admin on 10.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class BasketViewController: UIViewController {
    
    var myTableView = UITableView()
    var totalPriceLabel = UILabel()
    var buyButton = UIButton()
    
    
    struct Cells {
        static let batteryCell = "BatteryCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButton))
        
        self.title = "Корзина выбранных товаров"
        setTableView()
        setBuyButton()
        setTotalPriceLabel()
    }
    
    
    func setBuyButton() {
        buyButton.frame = CGRect(x: 260, y: self.view.frame.height - 40, width: 90, height: 30)
        buyButton.setTitle("Заказать!", for: .normal)
        buyButton.backgroundColor = .systemYellow
        buyButton.layer.cornerRadius = 10.0
        buyButton.setTitleColor(.black, for: .normal)
        buyButton.addTarget(self, action: #selector(makeOrder), for: .touchUpInside)
        self.view.addSubview(buyButton)
    }
    
    
    func setTotalPriceLabel() {
        totalPriceLabel.frame = CGRect(x: 5, y: self.view.frame.height - 70, width: 250, height: 100)
        totalPriceLabel.textColor = .black
        self.view.addSubview(totalPriceLabel)
        var totPrice = 0
        
        for value in basketArray {
            var arr = [Int]()
            var str = String()
            for value1 in value.priceLabel {
                switch value1 {
                case "1":
                    arr.append(Int(String(value1)) ?? 0)
                case "2":
                    arr.append(Int(String(value1)) ?? 0)
                case "3":
                    arr.append(Int(String(value1)) ?? 0)
                case "4":
                    arr.append(Int(String(value1)) ?? 0)
                case "5":
                    arr.append(Int(String(value1)) ?? 0)
                case "6":
                    arr.append(Int(String(value1)) ?? 0)
                case "7":
                    arr.append(Int(String(value1)) ?? 0)
                case "8":
                    arr.append(Int(String(value1)) ?? 0)
                case "9":
                    arr.append(Int(String(value1)) ?? 0)
                case "0":
                    arr.append(Int(String(value1)) ?? 0)
                    
                default:
                    break
                }
            }
            for value in arr {
                str += String(value)
            }
            totPrice += Int(str) ?? 0
        }
        
        totalPriceLabel.text = "Итоговая стоимость: \(String(totPrice))р"
        
    }
    
    func setTableView() {
        view.addSubview(myTableView)
        setDelegate()
        myTableView.rowHeight = 100
        myTableView.register(BatteryCell.self, forCellReuseIdentifier: Cells.batteryCell)
        //        myTableView.pin(to: view)
        myTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 40)
    }
    
    
    func setDelegate() {
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @objc func editButton() {
        myTableView.isEditing = !myTableView.isEditing
    }
    
    @objc func makeOrder() {
        
        let alertController = UIAlertController(title: "Данные заказа", message: "Заполните поля, указанные ниже:", preferredStyle: .alert)

        
        alertController.addTextField { (textField) in
            textField.placeholder = "Введите свое имя"
            textField.borderStyle = .roundedRect
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Введите номер телефона"
            textField.borderStyle = .roundedRect

        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Введите адрес доставки"
            textField.borderStyle = .roundedRect

        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Введите время доставки"
            textField.borderStyle = .roundedRect

        }
        
        for textField in alertController.textFields! {
            let container = textField.superview
            let effectView = container?.superview?.subviews[0]
            if (effectView != nil) {
                container?.backgroundColor = UIColor.clear
                effectView?.removeFromSuperview()
            }
        }
        let action = UIAlertAction(title: "Заказать!", style: .default) { (action) in
            
            func forIntTextFields() {
                var fullTextFields = [UITextField]()
                var emptyTextFields = [UITextField]()
                for textField in alertController.textFields! {
                    if textField.text == "" {
                        emptyTextFields.append(textField)
                    } else {
                        fullTextFields.append(textField)
                    }
                }
                if fullTextFields.count == alertController.textFields?.count {
                    basketArray.removeAll()
                    self.totalPriceLabel.text = "Итоговая стоимость: 0р"
                    self.myTableView.reloadData()
                } else {
                    for textField in alertController.textFields! {
                        textField.text = ""
                    }
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            
            forIntTextFields()

            //action.isEnabled = true


        }
        
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)

    }
}

extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: Cells.batteryCell) as! BatteryCell
        let batteries = basketArray[indexPath.row]
        cell.set(battery: batteries)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            basketArray.remove(at: indexPath.row)
            myTableView.deleteRows(at: [indexPath], with: .left)
            var totPrice = 0
            
            for value in basketArray {
                var arr = [Int]()
                var str = String()
                for value1 in value.priceLabel {
                    switch value1 {
                    case "1":
                        arr.append(Int(String(value1)) ?? 0)
                    case "2":
                        arr.append(Int(String(value1)) ?? 0)
                    case "3":
                        arr.append(Int(String(value1)) ?? 0)
                    case "4":
                        arr.append(Int(String(value1)) ?? 0)
                    case "5":
                        arr.append(Int(String(value1)) ?? 0)
                    case "6":
                        arr.append(Int(String(value1)) ?? 0)
                    case "7":
                        arr.append(Int(String(value1)) ?? 0)
                    case "8":
                        arr.append(Int(String(value1)) ?? 0)
                    case "9":
                        arr.append(Int(String(value1)) ?? 0)
                    case "0":
                        arr.append(Int(String(value1)) ?? 0)
                        
                    default:
                        break
                    }
                }
                for value in arr {
                    str += String(value)
                }
                totPrice += Int(str) ?? 0
            }
            
            totalPriceLabel.text = "Итоговая стоимость: \(String(totPrice))р"
        }
    }
    
}
