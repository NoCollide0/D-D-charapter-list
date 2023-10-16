//
//  AttackVC.swift
//  D&D Карточка Игрока
//
//  Created by Федор Шашков on 29.08.2023.
//

import UIKit

class AttackVC: UIViewController, UITextFieldDelegate {

    //Сохранение при помощи UserDefaults
    let defaults = UserDefaults.standard
    
    var attackData = ["1!lfds"]
    
    var vStackView: UIStackView!
    
    var scrollView: UIScrollView!
    
    var textFieldConter3 = 0
    
    var newField: Bool?
    
    var checkAttackDataValue: Int?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attackData = (defaults.array(forKey: "attackData") as? [String]) ?? ["1!lfds"]
        ///attackData = charapter.attackData
        textFieldConter3 = defaults.integer(forKey: "textFieldConter")
        ///textFieldConter3 = charapter.textFieldConter
        
        addVStackView()
        loadData()
        addFirstTextField()
       

    }
    
    
    
    
    override func viewWillDisappear(_:Bool) {
        defaults.set(attackData, forKey: "attackData")
        ///charapter.attackData = attackData
        defaults.set(textFieldConter3, forKey: "textFieldConter")
        ///charapter.textFieldConter = textFieldConter3
    }
    
    
    
    
    func loadData() {
        if textFieldConter3 != 0 {
            for i in 1...textFieldConter3 {
                let textField = UITextField()
                textField.placeholder = "Атаки, умения или способности."
                textField.borderStyle = .roundedRect
                textField.delegate = self
                textField.text = attackData[i]
                vStackView.insertArrangedSubview(textField, at: 0)
            }
        }
    }
    
    func addFirstTextField() {
        let textField = UITextField()
        textField.placeholder = "Атаки, умения или способности."
        textField.borderStyle = .roundedRect
        textField.delegate = self
        vStackView.insertArrangedSubview(textField, at: 0)
    }
    
    func addTextField() {
        let textField = UITextField()
        textField.placeholder = "Атаки, умения или способности."
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
            var checkAttackData = 0
            for i in 1...textFieldConter3 {
                checkAttackData += 1
                if textField.text?.trimmingCharacters(in: .whitespaces) == attackData[i] {
                    checkAttackDataValue = checkAttackData
                }
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if newField == true {
            if textField.text?.trimmingCharacters(in: .whitespaces) != "" {
                textFieldConter3 += 1
                attackData.append((textField.text?.trimmingCharacters(in: .whitespaces))!)
                addTextField()
                UIView.animate(withDuration: 0.3) {
                    self.vStackView.layoutIfNeeded()
                }
            }
        } else if newField == false {
            if textField.text?.trimmingCharacters(in: .whitespaces) == "" {
                attackData.remove(at: checkAttackDataValue!)
                textField.removeFromSuperview()
                vStackView.removeArrangedSubview(textField)
                textFieldConter3 -= 1
                UIView.animate(withDuration: 0.3) {
                    self.vStackView.layoutIfNeeded()
                }
            }else{
                attackData[checkAttackDataValue!] = (textField.text?.trimmingCharacters(in: .whitespaces))!
            }
        }
    }
   
    
    
    
    //Закрывает клавиатуру при нажатии на кнопку "готово"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}


