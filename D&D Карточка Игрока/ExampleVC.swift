//
//  ExampleVC.swift
//  D&D Карточка Игрока
//
//  Created by Федор Шашков on 01.10.2023.
//

import UIKit

class ExampleVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
        
    //Сохранение при помощи UserDefaults
    let defaults = UserDefaults.standard
    
    
    //Кнопки инициативы скорости и класса брони
    let screenWidth = UIScreen.main.bounds.width - 10
    let screenHeight = UIScreen.main.bounds.height / 2

    var buttonPressedCheck:String!
    
    var initiative:Int!
    var speed:Int!
    var armorClass:Int!
    
    let initiativeArray = Array(-30...30)
    let speedArray = Array(0...30)
    let armorClassArray = Array(0...30)
    
    var pickerTitle:String!
    
    @IBOutlet weak var initiativeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var armorClassLabel: UILabel!
    
    @IBAction func initiativeButton(_ sender: UIButton) {
        buttonPressedCheck = "initiative"
        buttonPressedAlert()
    }
    
    @IBAction func speedButton(_ sender: UIButton) {
        buttonPressedCheck = "speed"
        buttonPressedAlert()
    }
    
    @IBAction func armorClassButton(_ sender: UIButton) {
        buttonPressedCheck = "armorClass"
        buttonPressedAlert()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Присваиваем значени по умолчанию
        let defaultValues: [String: Any] = ["initiative": 0, "speed": 0, "armorClass": 0]
        UserDefaults.standard.register(defaults: defaultValues)
        
        //Загрузки из UserDefaults
        initiative = defaults.integer(forKey: "initiative")
        speed = defaults.integer(forKey: "speed")
        armorClass = defaults.integer(forKey: "armorClass")
            initiativeLabel.text = "\(initiativeArray[initiative])"
            speedLabel.text = "\(speedArray[speed])"
            armorClassLabel.text = "\(armorClassArray[armorClass])"
    }
    
    //Функция кнопок инициативы, скорости и класса брони
    func buttonPressedAlert(){
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: screenWidth, height: screenHeight)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        pickerView.dataSource = self
        pickerView.delegate = self
        
        if buttonPressedCheck == "initiative" {
            pickerView.selectRow(initiative, inComponent: 0, animated: false)
            pickerTitle = "Бонус инициативы"
        } else if buttonPressedCheck == "speed" {
            pickerView.selectRow(speed, inComponent: 0, animated: false)
            pickerTitle = "Скорость"
        } else if buttonPressedCheck == "armorClass" {
            pickerView.selectRow(armorClass, inComponent: 0, animated: false)
            pickerTitle = "Класс брони"
        }
        
        vc.view.addSubview(pickerView)
        pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        let alert = UIAlertController(title: pickerTitle, message: "", preferredStyle: .actionSheet)
        
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Готово", style: .default, handler: { (UIAlertAction) in
            
            if self.buttonPressedCheck == "initiative" {
                self.initiative = pickerView.selectedRow(inComponent: 0)
                self.defaults.set(self.initiative, forKey: "initiative")
                self.initiativeLabel.text = "\(self.initiativeArray[self.initiative])"
            } else if self.buttonPressedCheck == "speed" {
                self.speed = pickerView.selectedRow(inComponent: 0)
                self.defaults.set(self.speed, forKey: "speed")
                self.speedLabel.text = "\(self.speedArray[self.speed])"
            } else if self.buttonPressedCheck == "armorClass" {
                self.armorClass = pickerView.selectedRow(inComponent: 0)
                self.defaults.set(self.armorClass, forKey: "armorClass")
                self.armorClassLabel.text = "\(self.armorClassArray[self.armorClass])"
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //Настройки UiPicker, кол-во компонентов, элементов компонентов и заполнение элементов данными
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 30))
        
        if buttonPressedCheck == "initiative" {
            pickerLabel.text = Array(initiativeArray.map(String.init))[row]
            pickerLabel.sizeToFit()
            return pickerLabel
        } else if buttonPressedCheck == "speed" {
            pickerLabel.text = Array(speedArray.map(String.init))[row]
            pickerLabel.sizeToFit()
            return pickerLabel
        } else if buttonPressedCheck == "armorClass" {
            pickerLabel.text = Array(armorClassArray.map(String.init))[row]
            pickerLabel.sizeToFit()
            return pickerLabel
        }
        return pickerLabel
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var numberOfRowsInComponent:Int!
        if buttonPressedCheck == "initiative" {
            numberOfRowsInComponent = initiativeArray.count
        } else if buttonPressedCheck == "speed" {
            numberOfRowsInComponent = speedArray.count
        } else if buttonPressedCheck == "armorClass" {
            numberOfRowsInComponent = armorClassArray.count
        }
        return numberOfRowsInComponent
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }


    
    
    
}
