//
//  HpVC.swift
//  D&D Карточка Игрока
//
//  Created by Федор Шашков on 23.06.2023.
//

import UIKit
import Lottie

class HpVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
        

    //Сохранение при помощи UserDefaults
    let defaults = UserDefaults.standard
    
    let hp = Array(1...50)
    let hpDice = ["D4","D5","D6","D7","D8","D9","D10","D11","D12"]
    
    let screenWidth = UIScreen.main.bounds.width - 10
    let screenHeight = UIScreen.main.bounds.height / 2
    var selectedRowHp = 9
    var selectedRowHpDice = 0
    
    var startAnimationPoint:Double = 0
    
    @IBOutlet weak var maxHpLabel0: UILabel!
    
    @IBOutlet weak var maxHpLabel1: UILabel!
    
    @IBOutlet weak var HpDiceLabel: UILabel!
    
    @IBOutlet weak var currentHpLabel: UILabel!
    
    @IBOutlet weak var currentHpSlider: UISlider!
    
    @IBOutlet weak var mainHpView: UIView!
    
    
    
    
    //Кнопка и вызов пикера в алерте
    @IBOutlet weak var pickerViewButton: UIButton!
    
    @IBAction func hpButton(_ sender: UIButton) {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: screenWidth, height: screenHeight)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerView.selectRow(selectedRowHp, inComponent: 0, animated: false)
        pickerView.selectRow(selectedRowHpDice, inComponent: 1, animated: false)
        
        vc.view.addSubview(pickerView)
        pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        let alert = UIAlertController(title: "Макс ХП и Кость ХП", message: "", preferredStyle: .actionSheet)
        
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Готово", style: .default, handler: { (UIAlertAction) in
            self.selectedRowHp = pickerView.selectedRow(inComponent: 0)
            self.defaults.set(self.selectedRowHp, forKey: "hp")
            self.maxHpLabel0.text = "\(self.selectedRowHp + 1)"
            self.maxHpLabel1.text = "\(self.selectedRowHp + 1)"
            self.currentHpSlider.maximumValue = Float(self.selectedRowHp + 1)
            
            self.selectedRowHpDice = pickerView.selectedRow(inComponent: 1)
            self.defaults.set(self.selectedRowHpDice, forKey: "hpDice")
            self.HpDiceLabel.text = "\(self.hpDice[self.selectedRowHpDice])"
            self.animationSet()
            self.animateSliderPosition(to: self.currentHpSlider.value)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //Слайдер текущего ХП
    @IBAction func currentHpSliderChange(_ sender: UISlider) {
        currentHpLabel.text = "Текущее здоровье: \(Int(sender.value.rounded()))"
        defaults.set(sender.value.rounded(), forKey: "currentHp")
        animationSet()
    }
    
    //Анимация ХП бара
    @IBOutlet weak var HpBarAnimationView: LottieAnimationView!
    
    
    
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Присваиваем значени по умолчанию
        let defaultValues: [String: Any] = ["hp": 9, "currentHp": 5.0, "startAnimationPoint": 0.0]
        UserDefaults.standard.register(defaults: defaultValues)
        
        //Загрузки из UserDefaults
        selectedRowHp = defaults.integer(forKey: "hp")
        selectedRowHpDice = defaults.integer(forKey: "hpDice")
            currentHpSlider.value = defaults.float(forKey: "currentHp")
        
        //Настройка лейблов
        maxHpLabel0.text = "\(selectedRowHp + 1)"
        maxHpLabel1.text = "\(selectedRowHp + 1)"
        HpDiceLabel.text = "\(hpDice[selectedRowHpDice])"
        currentHpSlider.maximumValue = Float(selectedRowHp + 1)
        currentHpLabel.text = "Текущее здоровье: \(Int(currentHpSlider.value.rounded()))"
        
        //Скругление view
        mainHpView.layer.cornerRadius = 10
        
        //Настройка стартовой точки анимации
        startAnimationPoint = defaults.double(forKey: "startAnimationPoint")
        
        //Запуск анимации
        animationSet()

    }
    
    
    
    
    //Отправление данных на главный экран через viewWillDissapear
    override func viewWillDisappear(_:Bool) {
        NotificationCenter.default.post(name: MainScreenVC.deliveryHpValue, object: nil, userInfo: ["hp": maxHpLabel0.text!, "hpDice": HpDiceLabel.text!, "currentHp": currentHpLabel.text!, "endAnimationPoint": startAnimationPoint])
        defaults.set(HpDiceLabel.text, forKey: "hpDiceLabel")
        defaults.set(maxHpLabel0.text, forKey: "maxHpLabel")
    }
    
    
    
    
    
    //Функция анимации
    func animationSet(){
        let endAnimationPoint:Double = Double(currentHpSlider.value.rounded()) / Double(maxHpLabel0.text!)!
        HpBarAnimationView.contentMode = .scaleToFill
        HpBarAnimationView.animationSpeed = 2
        HpBarAnimationView.play(fromProgress: startAnimationPoint, toProgress: endAnimationPoint)
        startAnimationPoint = endAnimationPoint
        defaults.set(startAnimationPoint, forKey: "startAnimationPoint")
    }
    
    
    //Функция анимации слайдера
    func animateSliderPosition(to value: Float) {
        UIView.animate(withDuration: 0.3) {
            self.currentHpSlider.setValue(value, animated: true)
            self.view.layoutIfNeeded()
        }
    }
    
    
    //Настройки UiPicker, кол-во компонентов, элементов компонентов и заполнение элементов данными
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if component == 0{
            let hpPickerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 30))
            let hpString = hp.map(String.init)
            hpPickerLabel.text = Array(hpString)[row]
            hpPickerLabel.sizeToFit()
            return hpPickerLabel
        }else{
            let hpDicePickerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 30))
            hpDicePickerLabel.text = Array(hpDice)[row]
            hpDicePickerLabel.sizeToFit()
            return hpDicePickerLabel
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return hp.count
        }else{
            return hpDice.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }

}


