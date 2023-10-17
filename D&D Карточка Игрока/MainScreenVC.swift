//
//  MainScreenVC.swift
//  D&D Карточка Игрока
//
//  Created by Федор Шашков on 01.06.2023.
//

import UIKit
import Lottie

class MainScreenVC: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Сохранение при помощи UserDefaults
    let defaults = UserDefaults.standard
    
    //Имя Класс Расса
    @IBOutlet weak var charapterRace: UITextField!
    @IBOutlet weak var charapterClass: UITextField!
    @IBOutlet weak var charapterName: UITextField!
    var charapterClassMain: String?
    var charapterRaceMain: String?
    var charapterNameMain: String?
    
    //Сохраниние Имени Класса и Рассы после изменения полей
    @IBAction func endEditingCharName(_ sender: Any) {
        charapterNameMain = charapterName.text!.trimmingCharacters(in: .whitespaces)
        charapter.charapterName = charapterNameMain
    }
    @IBAction func endEditingCharRace(_ sender: Any) {
        charapterRaceMain = charapterRace.text!.trimmingCharacters(in: .whitespaces)
        charapter.charapterRace = charapterRaceMain
    }
    @IBAction func endEditingCharClass(_ sender: Any) {
        charapterClassMain = charapterClass.text!.trimmingCharacters(in: .whitespaces)
        charapter.charapterClass = charapterClassMain
    }
    
    
    
    
    //Для скругления view (кроме статов)
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var view9: UIView!
    var viewsCorner: [UIView] = []
    //Скругление статов
    @IBOutlet weak var statview1: UIView!
    @IBOutlet weak var statview2: UIView!
    @IBOutlet weak var statview3: UIView!
    @IBOutlet weak var statview4: UIView!
    @IBOutlet weak var statview5: UIView!
    @IBOutlet weak var statview6: UIView!
    var statViewsCorner: [UIView] = []
    //Скругление бонусов статов
    @IBOutlet weak var bonusStatview1: UIView!
    @IBOutlet weak var bonusStatview2: UIView!
    @IBOutlet weak var bonusStatview3: UIView!
    @IBOutlet weak var bonusStatview4: UIView!
    @IBOutlet weak var bonusStatview5: UIView!
    @IBOutlet weak var bonusStatview6: UIView!
    var bonusStatViewsCorner: [UIView] = []

    
    
    
    //Статы
        //Сила
    @IBOutlet weak var silaValue: UILabel!
    @IBOutlet weak var bonusSila: UILabel!
        //Ловкость
    @IBOutlet weak var agilityValue: UILabel!
    @IBOutlet weak var bonusAgility: UILabel!
        //Стойкость
    @IBOutlet weak var constValue: UILabel!
    @IBOutlet weak var bonusConst: UILabel!
        //Интеллект
    @IBOutlet weak var intellectValue: UILabel!
    @IBOutlet weak var bonusIntellect: UILabel!
        //Мудрость
    @IBOutlet weak var wisdomValue: UILabel!
    @IBOutlet weak var bonusWisdom: UILabel!
        //Харизма
    @IBOutlet weak var charismaValue: UILabel!
    @IBOutlet weak var bonusCharisma: UILabel!
    
    //Здоровье
    @IBOutlet weak var hpValue: UILabel!
    @IBOutlet weak var hpDice: UILabel!
    
    //Для анимации ХП бара
    var startAnimationPoint:Double = 0
    var endAnimationPoint:Double = 0.5
    
    //Для анимации спасброска
    var spasAnimationViews: [LottieAnimationView] = []
    
    var greenValue:Int?
    var redValue:Int?
    
    @IBOutlet weak var greenAnimationView1: LottieAnimationView!
    @IBOutlet weak var greenAnimationView2: LottieAnimationView!
    @IBOutlet weak var greenAnimationView3: LottieAnimationView!
    
    @IBOutlet weak var redAnimationView1: LottieAnimationView!
    @IBOutlet weak var redAnimationView2: LottieAnimationView!
    @IBOutlet weak var redAnimationView3: LottieAnimationView!
    
    @IBAction func greenButtonTapped(_ sender: Any) {
        greenAnimationSet()
    }
    @IBAction func redButtonTapped(_ sender: Any) {
        redAnimationSet()
    }
    
    
    
    
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

    
    
    
    
    //Переноса значения через notification
        //Создание notification и выполнение кода после команды observer
            //Сила
    static let deliverySilaValue = Notification.Name("silaNotification")
    @objc func changeSilaValue(notification:Notification) {
        silaValue.text = "\(notification.userInfo![AnyHashable("sila")]!)"
        bonusSila.text = "\(notification.userInfo![AnyHashable("bonusSila")]!)"
    }
            //Ловкость
    static let deliveryAgilityValue = Notification.Name("agilityNotification")
    @objc func changeAgilityValue(notification:Notification) {
        agilityValue.text = "\(notification.userInfo![AnyHashable("agility")]!)"
        bonusAgility.text = "\(notification.userInfo![AnyHashable("bonusAgility")]!)"
    }
            //Стойкость
    static let deliveryConstValue = Notification.Name("constNotification")
    @objc func changeConstValue(notification:Notification) {
        constValue.text = "\(notification.userInfo![AnyHashable("const")]!)"
        bonusConst.text = "\(notification.userInfo![AnyHashable("bonusConst")]!)"
    }
            //Интеллект
    static let deliveryIntellectValue = Notification.Name("intellectNotification")
    @objc func changeIntellectValue(notification:Notification) {
        intellectValue.text = "\(notification.userInfo![AnyHashable("intellect")]!)"
        bonusIntellect.text = "\(notification.userInfo![AnyHashable("bonusIntellect")]!)"
    }
            //Мудрость
    static let deliveryWisdomValue = Notification.Name("wisdomNotification")
    @objc func changeWisdomValue(notification:Notification) {
        wisdomValue.text = "\(notification.userInfo![AnyHashable("wisdom")]!)"
        bonusWisdom.text = "\(notification.userInfo![AnyHashable("bonusWisdom")]!)"
    }
            //Харизма
    static let deliveryCharismaValue = Notification.Name("charismaNotification")
    @objc func changeCharismaValue(notification:Notification) {
        charismaValue.text = "\(notification.userInfo![AnyHashable("charisma")]!)"
        bonusCharisma.text = "\(notification.userInfo![AnyHashable("bonusCharisma")]!)"
    }
        //Количество здоровья и костьХП
    static let deliveryHpValue = Notification.Name("hpNotification")
    @objc func changeHpValue(notification:Notification) {
        hpValue.text = "Макс ХП: \(notification.userInfo![AnyHashable("hp")]!)"
        hpDice.text = "Кость ХП: \(notification.userInfo![AnyHashable("hpDice")]!)"
        endAnimationPoint = notification.userInfo![AnyHashable("endAnimationPoint")] as! Double
        animationSet()
    }
        
        //Хп Бар Анимации
    @IBOutlet weak var HpBarAnimationView: LottieAnimationView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charapterName.delegate = self
        charapterClass.delegate = self
        charapterRace.delegate = self
        
        //Загрузка charapterData
        loadCharapterData()
        
        //Загрузки UserDefaults
        userDefaultsMainLoad()
        
        //Установка observer для регистрации получения notification из другого View Controller
        observerSetup()
        
        //Анимация ХП бара
        animationSet()
        
        //Настройки вида элементов на экране
        viewsFormSetup()
        
        //Убрать клавиатуру при тапе в любом месте экрана
        let keyboardDissmiss = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(keyboardDissmiss)
        
    }
    
    
    
    

    
    
    
    
    //Общая функция загрузки из UserDefaults
    func userDefaultsMainLoad(){
        //Присваиваем значени по умолчанию
        let defaultValues: [String: Any] = ["endAnimationPoint": 0.5, "greenValue": 0, "redValue": 0, "initiative": 30, "speed": 0, "armorClass": 0]
        UserDefaults.standard.register(defaults: defaultValues)
        
        //загрузки из UserDefaults
        charapterName.text = charapter.charapterName
        charapterRace.text = charapter.charapterRace
        charapterClass.text = charapter.charapterClass
        bonusSila.text = charapter.bonusSila
        silaValue.text = charapter.silaValue
        bonusAgility.text = charapter.bonusAgility
        agilityValue.text = charapter.agilityValue
        bonusConst.text = charapter.bonusConst
        constValue.text = charapter.constValue
        bonusIntellect.text = charapter.bonusIntellect
        intellectValue.text = charapter.intellectValue
        bonusWisdom.text = charapter.bonusWisdom
        wisdomValue.text = charapter.wisdomValue
        bonusCharisma.text = charapter.bonusCharisma
        charismaValue.text = charapter.charismaValue
        endAnimationPoint = charapter.endAnimationPoint
        initiative = charapter.initiative
        speed = charapter.speed
        armorClass = charapter.armorClass
        initiativeLabel.text = "\(initiativeArray[initiative])"
        speedLabel.text = "\(speedArray[speed])"
        armorClassLabel.text = "\(armorClassArray[armorClass])"
        
        hpValue.text = "Макс ХП: \(charapter.maxHpLabel)"
        hpDice.text = "Кость ХП: \(charapter.hpDiceLabel)"
            //Спасбросок загрузка
        greenValue = charapter.greenValue
        redValue = charapter.redValue
            greenAnimationSetLoad()
            redAnimationSetLoad()
        
    }
    
    
    
    
    func observerSetup(){
        //Установка observer для регистрации получения notification из другого View Controller
        NotificationCenter.default.addObserver(self, selector: #selector(changeSilaValue(notification:)), name: MainScreenVC.deliverySilaValue, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeAgilityValue(notification:)), name: MainScreenVC.deliveryAgilityValue, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeConstValue(notification:)), name: MainScreenVC.deliveryConstValue, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeIntellectValue(notification:)), name: MainScreenVC.deliveryIntellectValue, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeWisdomValue(notification:)), name: MainScreenVC.deliveryWisdomValue, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeCharismaValue(notification:)), name: MainScreenVC.deliveryCharismaValue, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeHpValue(notification:)), name: MainScreenVC.deliveryHpValue, object: nil)
    }
    
    
    
    
    func viewsFormSetup(){
        //Скругление углов views
        viewsCorner = [view1, view2, view3, view4, view5, view6, view7, view8, view9]
        for view in viewsCorner {
            view.layer.cornerRadius = 10
        }
        //Скругление правых углов у statview
        statViewsCorner = [statview1, statview2, statview3, statview4, statview5, statview6]
        for view in statViewsCorner {
            view.layer.cornerRadius = 5
            view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        }
        //Скругления бонуса статов view
        bonusStatViewsCorner = [bonusStatview1, bonusStatview2, bonusStatview3, bonusStatview4, bonusStatview5, bonusStatview6]
        for view in bonusStatViewsCorner {
            view.layer.cornerRadius = 5
        }
        
        //Скругление имени расы и класса
        charapterName.layer.cornerRadius = 10
        charapterRace.layer.cornerRadius = 10
        charapterClass.layer.cornerRadius = 10

        //Спасбросок, настройка формы view
        spasAnimationViews = [greenAnimationView1, greenAnimationView2, greenAnimationView3, redAnimationView1, redAnimationView2, redAnimationView3]
        for view in spasAnimationViews {
            view.layer.cornerRadius = view.frame.size.width / 2
            view.contentMode = .scaleToFill
        }

    }
    
    
    
    
    //Закрывает клавиатуру при нажатии на кнопку "готово"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    //Функция анимации ХП бара
    func animationSet(){
        HpBarAnimationView.contentMode = .scaleToFill
        HpBarAnimationView.animationSpeed = 4
        HpBarAnimationView.play(fromProgress: startAnimationPoint, toProgress: endAnimationPoint)
        charapter.endAnimationPoint = endAnimationPoint
    }
    
    
    
    
    //Функция спасброска
    func greenAnimationSet() {
        if greenValue == 0 {
            greenAnimationView1.play(toProgress: 1)
            greenValue = 1
            charapter.greenValue = greenValue!
        } else if greenValue == 1 {
            greenAnimationView1.play(toProgress: 1)
            greenAnimationView2.play(toProgress: 1)
            greenValue = 2
            charapter.greenValue = greenValue!
        } else if greenValue == 2 {
            greenAnimationView1.play(toProgress: 1)
            greenAnimationView2.play(toProgress: 1)
            greenAnimationView3.play(toProgress: 1)
            greenValue = 3
            charapter.greenValue = greenValue!
        } else if greenValue == 3 {
            greenAnimationView1.play(fromProgress:1, toProgress: 0)
            greenAnimationView2.play(fromProgress:1, toProgress: 0)
            greenAnimationView3.play(fromProgress:1, toProgress: 0)
            greenValue = 0
            charapter.greenValue = greenValue!
        }
    }
    func redAnimationSet() {
        if redValue == 0 {
            redAnimationView1.play(toProgress: 1)
            redValue = 1
            charapter.redValue = redValue!
        } else if redValue == 1 {
            redAnimationView1.play(toProgress: 1)
            redAnimationView2.play(toProgress: 1)
            redValue = 2
            charapter.redValue = redValue!
        } else if redValue == 2 {
            redAnimationView1.play(toProgress: 1)
            redAnimationView2.play(toProgress: 1)
            redAnimationView3.play(toProgress: 1)
            redValue = 3
            charapter.redValue = redValue!
        } else if redValue == 3 {
            redAnimationView1.play(fromProgress:1, toProgress: 0)
            redAnimationView2.play(fromProgress:1, toProgress: 0)
            redAnimationView3.play(fromProgress:1, toProgress: 0)
            redValue = 0
            charapter.redValue = redValue!
        }
    }
    //То же самое но для viewDidLoad
    func greenAnimationSetLoad() {
        if greenValue == 1 {
            greenAnimationView1.play(toProgress: 1)
        } else if greenValue == 2 {
            greenAnimationView1.play(toProgress: 1)
            greenAnimationView2.play(toProgress: 1)
        } else if greenValue == 3 {
            greenAnimationView1.play(toProgress: 1)
            greenAnimationView2.play(toProgress: 1)
            greenAnimationView3.play(toProgress: 1)
        } else if greenValue == 0 {
            greenAnimationView1.play(fromProgress:1, toProgress: 0)
            greenAnimationView2.play(fromProgress:1, toProgress: 0)
            greenAnimationView3.play(fromProgress:1, toProgress: 0)
        }
    }
    func redAnimationSetLoad() {
        if redValue == 1 {
            redAnimationView1.play(toProgress: 1)
        } else if redValue == 2 {
            redAnimationView1.play(toProgress: 1)
            redAnimationView2.play(toProgress: 1)
        } else if redValue == 3 {
            redAnimationView1.play(toProgress: 1)
            redAnimationView2.play(toProgress: 1)
            redAnimationView3.play(toProgress: 1)
        } else if redValue == 0 {
            redAnimationView1.play(fromProgress:1, toProgress: 0)
            redAnimationView2.play(fromProgress:1, toProgress: 0)
            redAnimationView3.play(fromProgress:1, toProgress: 0)
        }
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
                charapter.initiative = self.initiative
                self.initiativeLabel.text = "\(self.initiativeArray[self.initiative])"
            } else if self.buttonPressedCheck == "speed" {
                self.speed = pickerView.selectedRow(inComponent: 0)
                charapter.speed = self.speed
                self.speedLabel.text = "\(self.speedArray[self.speed])"
            } else if self.buttonPressedCheck == "armorClass" {
                self.armorClass = pickerView.selectedRow(inComponent: 0)
                charapter.armorClass = self.armorClass
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


    
    
    
    //Кнопка cилы
    @IBAction func tempButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ToSilaVC", sender: nil)
    }
    //Кнопка ловкости
    @IBAction func agilityButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ToAgilityVC", sender: nil)
    }
    //Кнопка стойкости
    @IBAction func constButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ToConstVC", sender: nil)
    }
    //Кнопка интеллекта
    @IBAction func intellectButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ToIntellectVC", sender: nil)
    }
    //Кнопка мудрости
    @IBAction func wisdomButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ToWisdomVC", sender: nil)
    }
    //Кнопка харизмы
    @IBAction func charismaButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ToCharismaVC", sender: nil)
    }
    
    //Кнопка ХП
    @IBAction func hpButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ToHpVC", sender: nil)
    }
    
    //Кнопка аттак и способностей
    @IBAction func attackButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "ToAttackVC", sender: nil)
    }
    
    //Кнопка снаряжения
    @IBAction func equipmentButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toEquipmentVC", sender: nil)
    }
    
    //Кнопка заклинаний
    @IBAction func spellsButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toSpellsVC", sender: nil)
    }
    
}

