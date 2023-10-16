//
//  AttackVC.swift
//  D&D Карточка Игрока
//
//  Created by Федор Шашков on 29.08.2023.
//

import UIKit

class SpellsVC: UIViewController, UITextFieldDelegate {

    //Сохранение при помощи UserDefaults
    let defaults = UserDefaults.standard
    
    var spellsData = ["1!lfds"]
    
    var vStackView: UIStackView!
    
    var scrollView: UIScrollView!
    
    var textFieldConter2 = 0
    
    var newField: Bool?
    
    var checkSpellsDataValue: Int?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spellsData = (defaults.array(forKey: "spellsData") as? [String]) ?? ["1!lfds"]
        ///spellsData = charapter.spellsData
        textFieldConter2 = defaults.integer(forKey: "textFieldConterSpells")
        ///textFieldConter2 = charapter.textFieldConterEquipment
        
        addVStackView()
        loadData()
        addFirstTextField()
       

    }
    
    
    
    
    override func viewWillDisappear(_:Bool) {
        defaults.set(spellsData, forKey: "spellsData")
        ///charapter.spellsData = spellsData
        defaults.set(textFieldConter2, forKey: "textFieldConterSpells")
        ///charapter.textFieldConterEquipment = textFieldConter2
    }
    
    
    
    
    func loadData() {
        if textFieldConter2 != 0 {
            for i in 1...textFieldConter2 {
                let textField = UITextField()
                textField.placeholder = "Заклинания."
                textField.borderStyle = .roundedRect
                textField.delegate = self
                textField.text = spellsData[i]
                vStackView.insertArrangedSubview(textField, at: 0)
            }
        }
    }
    
    func addFirstTextField() {
        let textField = UITextField()
        textField.placeholder = "Заклинания."
        textField.borderStyle = .roundedRect
        textField.delegate = self
        vStackView.insertArrangedSubview(textField, at: 0)
    }
    
    func addTextField() {
        let textField = UITextField()
        textField.placeholder = "Заклинания."
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
            var checkSpellsData = 0
            for i in 1...textFieldConter2 {
                checkSpellsData += 1
                if textField.text?.trimmingCharacters(in: .whitespaces) == spellsData[i] {
                    checkSpellsDataValue = checkSpellsData
                }
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if newField == true {
            if textField.text?.trimmingCharacters(in: .whitespaces) != "" {
                textFieldConter2 += 1
                spellsData.append((textField.text?.trimmingCharacters(in: .whitespaces))!)
                addTextField()
                UIView.animate(withDuration: 0.3) {
                    self.vStackView.layoutIfNeeded()
                }
            }
        } else if newField == false {
            if textField.text?.trimmingCharacters(in: .whitespaces) == "" {
                spellsData.remove(at: checkSpellsDataValue!)
                textField.removeFromSuperview()
                vStackView.removeArrangedSubview(textField)
                textFieldConter2 -= 1
                UIView.animate(withDuration: 0.3) {
                    self.vStackView.layoutIfNeeded()
                }
            }else{
                spellsData[checkSpellsDataValue!] = (textField.text?.trimmingCharacters(in: .whitespaces))!
            }
        }
    }
    
    
    
    
    //Закрывает клавиатуру при нажатии на кнопку "готово"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}


