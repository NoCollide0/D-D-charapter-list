//
//  AttackVC.swift
//  D&D Карточка Игрока
//
//  Created by Федор Шашков on 29.08.2023.
//

import UIKit

class EquipmentVC: UIViewController, UITextFieldDelegate {

    //Сохранение при помощи UserDefaults
    let defaults = UserDefaults.standard
    
    var equipmentData = ["1!lfds"]
    
    var vStackView: UIStackView!
    
    var scrollView: UIScrollView!
    
    var textFieldConter = 0
    
    var newField: Bool?
    
    var checkEquipmentDataValue: Int?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        equipmentData = (defaults.array(forKey: "equipmentData") as? [String]) ?? ["1!lfds"]
        textFieldConter = defaults.integer(forKey: "textFieldConterEquipment")
        
        addVStackView()
        loadData()
        addFirstTextField()
       

    }
    
    
    
    
    override func viewWillDisappear(_:Bool) {
        defaults.set(equipmentData, forKey: "equipmentData")
        defaults.set(textFieldConter, forKey: "textFieldConterEquipment")
    }
    
    
    
    
    func loadData() {
        if textFieldConter != 0 {
            for i in 1...textFieldConter {
                let textField = UITextField()
                textField.placeholder = "Снаряжение."
                textField.borderStyle = .roundedRect
                textField.delegate = self
                textField.text = equipmentData[i]
                vStackView.insertArrangedSubview(textField, at: 0)
            }
        }
    }
    
    func addFirstTextField() {
        let textField = UITextField()
        textField.placeholder = "Снаряжение."
        textField.borderStyle = .roundedRect
        textField.delegate = self
        vStackView.insertArrangedSubview(textField, at: 0)
    }
    
    func addTextField() {
        let textField = UITextField()
        textField.placeholder = "Снаряжение."
        textField.borderStyle = .roundedRect
        textField.delegate = self
        vStackView.insertArrangedSubview(textField, at: 0)
    }
    
    func addVStackView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        
        vStackView = UIStackView()
        vStackView.axis = .vertical
        vStackView.spacing = 10
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(vStackView)
        
        NSLayoutConstraint.activate([
                    scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
                    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
                    scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),

                    vStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                    vStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                    vStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    vStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
                ])
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text?.trimmingCharacters(in: .whitespaces) == "" {
            newField = true
        } else {
            newField = false
            var checkEquipmentData = 0
            for i in 1...textFieldConter {
                checkEquipmentData += 1
                if textField.text?.trimmingCharacters(in: .whitespaces) == equipmentData[i] {
                    checkEquipmentDataValue = checkEquipmentData
                }
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if newField == true {
            if textField.text?.trimmingCharacters(in: .whitespaces) != "" {
                textFieldConter += 1
                equipmentData.append((textField.text?.trimmingCharacters(in: .whitespaces))!)
                addTextField()
                UIView.animate(withDuration: 0.3) {
                    self.vStackView.layoutIfNeeded()
                }
            }
        } else if newField == false {
            if textField.text?.trimmingCharacters(in: .whitespaces) == "" {
                equipmentData.remove(at: checkEquipmentDataValue!)
                textField.removeFromSuperview()
                vStackView.removeArrangedSubview(textField)
                textFieldConter -= 1
                UIView.animate(withDuration: 0.3) {
                    self.vStackView.layoutIfNeeded()
                }
            }else{
                equipmentData[checkEquipmentDataValue!] = (textField.text?.trimmingCharacters(in: .whitespaces))!
            }
        }
    }
    
    
    
    
    //Закрывает клавиатуру при нажатии на кнопку "готово"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}


