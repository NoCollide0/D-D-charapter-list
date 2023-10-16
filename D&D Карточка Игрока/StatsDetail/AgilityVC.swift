//
//  SilaVC.swift
//  D&D Карточка Игрока
//
//  Created by Федор Шашков on 03.06.2023.
//

import UIKit

class AgilityVC: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var agilityLabel: UILabel!
    
    @IBOutlet weak var bonusAgility: UILabel!
    
    @IBOutlet weak var AgilityStepper: UIStepper!
    //Сохранение значения ловкости после изменения и присвоение значения лейблу с переводом в инт и далее в стринг
    //А так же отправка значения ловкости через notification
    @IBAction func AgilityChange(_ sender: UIStepper) {
        defaults.set(String(Int(AgilityStepper.value)), forKey: "agilityValue")
        agilityLabel.text = String(Int(AgilityStepper.value))
                
        //Бонус от ловкости
        switch AgilityStepper.value {
        case 1:
            bonusAgility.text = "-5"
            defaults.set(bonusAgility.text, forKey: "bonusAgility")
            secondaryStatUpdate()
            break
        case 2...3:
            bonusAgility.text = "-4"
            defaults.set(bonusAgility.text, forKey: "bonusAgility")
            secondaryStatUpdate()
            break
        case 4...5:
            bonusAgility.text = "-3"
            defaults.set(bonusAgility.text, forKey: "bonusAgility")
            secondaryStatUpdate()
            break
        case 6...7:
            bonusAgility.text = "-2"
            defaults.set(bonusAgility.text, forKey: "bonusAgility")
            secondaryStatUpdate()
            break
        case 8...9:
            bonusAgility.text = "-1"
            defaults.set(bonusAgility.text, forKey: "bonusAgility")
            secondaryStatUpdate()
            break
        case 10...11:
            bonusAgility.text = "0"
            defaults.set(bonusAgility.text, forKey: "bonusAgility")
            secondaryStatUpdate()
            break
        case 12...13:
            bonusAgility.text = "+1"
            defaults.set(bonusAgility.text, forKey: "bonusAgility")
            secondaryStatUpdate()
            break
        case 14...15:
            bonusAgility.text = "+2"
            defaults.set(bonusAgility.text, forKey: "bonusAgility")
            secondaryStatUpdate()
            break
        case 16...17:
            bonusAgility.text = "+3"
            defaults.set(bonusAgility.text, forKey: "bonusAgility")
            secondaryStatUpdate()
            break
        case 18...19:
            bonusAgility.text = "+4"
            defaults.set(bonusAgility.text, forKey: "bonusAgility")
            secondaryStatUpdate()
            break
        case 20...21:
            bonusAgility.text = "+5"
            defaults.set(bonusAgility.text, forKey: "bonusAgility")
            secondaryStatUpdate()
            break
        case 22...23:
            bonusAgility.text = "+6"
            defaults.set(bonusAgility.text, forKey: "bonusAgility")
            secondaryStatUpdate()
            break
        case 24...25:
            bonusAgility.text = "+7"
            defaults.set(bonusAgility.text, forKey: "bonusAgility")
            secondaryStatUpdate()
            break
        case 26...27:
            bonusAgility.text = "+8"
            defaults.set(bonusAgility.text, forKey: "bonusAgility")
            secondaryStatUpdate()
            break
        case 28...29:
            bonusAgility.text = "+9"
            defaults.set(bonusAgility.text, forKey: "bonusAgility")
            secondaryStatUpdate()
            break
        case 30:
            bonusAgility.text = "+10"
            defaults.set(bonusAgility.text, forKey: "bonusAgility")
            secondaryStatUpdate()
            break
        default:
            print("agilityStepperError")
        }
        NotificationCenter.default.post(name: MainScreenVC.deliveryAgilityValue, object: nil, userInfo: ["agility": agilityLabel.text!,"bonusAgility": bonusAgility.text!])
    }
    
    
    //Подстаты
        //Акробатика
            //Мастерство
    @IBOutlet weak var AcrobaticSkill: UISegmentedControl!
    var acrobaticSkillValue = 0
    @IBAction func AcrobaticSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            defaults.set(AcrobaticSkill.selectedSegmentIndex, forKey: "AcrobaticSkill")
            acrobaticSkillValue = 0
            defaults.set(acrobaticSkillValue, forKey: "acrobaticSkillValue")
            acrobaticUpdate()
        case 1:
            defaults.set(AcrobaticSkill.selectedSegmentIndex, forKey: "AcrobaticSkill")
            acrobaticSkillValue = 2
            defaults.set(acrobaticSkillValue, forKey: "acrobaticSkillValue")
            acrobaticUpdate()
        case 2:
            defaults.set(AcrobaticSkill.selectedSegmentIndex, forKey: "AcrobaticSkill")
            acrobaticSkillValue = 4
            defaults.set(acrobaticSkillValue, forKey: "acrobaticSkillValue")
            acrobaticUpdate()
        default:
            print("AcrobaticSelectorError")
        }
    }
            //Общий бонус
    @IBOutlet weak var AcrobaticBonus: UILabel!
        //Ловкость рук
            //Мастерство
    @IBOutlet weak var HandAgSkill: UISegmentedControl!
    var handAgSkillValue = 0
    @IBAction func HandAgSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            defaults.set(HandAgSkill.selectedSegmentIndex, forKey: "HandAgSkill")
            handAgSkillValue = 0
            defaults.set(handAgSkillValue, forKey: "handAgSkillValue")
            handAgUpdate()
        case 1:
            defaults.set(HandAgSkill.selectedSegmentIndex, forKey: "HandAgSkill")
            handAgSkillValue = 2
            defaults.set(handAgSkillValue, forKey: "handAgSkillValue")
            handAgUpdate()
        case 2:
            defaults.set(HandAgSkill.selectedSegmentIndex, forKey: "HandAgSkill")
            handAgSkillValue = 4
            defaults.set(handAgSkillValue, forKey: "handAgSkillValue")
            handAgUpdate()
        default:
            print("HandAgSelectorError")
        }
    }
            //Общий бонус
    @IBOutlet weak var HandAgBonus: UILabel!
        //Скрытность
            //Мастерство
    @IBOutlet weak var StealthSkill: UISegmentedControl!
    var stealthSkillValue = 0
    @IBAction func StealthSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            defaults.set(StealthSkill.selectedSegmentIndex, forKey: "StealthSkill")
            stealthSkillValue = 0
            defaults.set(stealthSkillValue, forKey: "stealthSkillValue")
            stealthUpdate()
        case 1:
            defaults.set(StealthSkill.selectedSegmentIndex, forKey: "StealthSkill")
            stealthSkillValue = 2
            defaults.set(stealthSkillValue, forKey: "stealthSkillValue")
            stealthUpdate()
        case 2:
            defaults.set(StealthSkill.selectedSegmentIndex, forKey: "StealthSkill")
            stealthSkillValue = 4
            defaults.set(stealthSkillValue, forKey: "stealthSkillValue")
            stealthUpdate()
        default:
            print("StealthSelectorError")
        }
    }
            //Общий бонус
    @IBOutlet weak var StealthBonus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Загрузка бонуса ловкости
        bonusAgility.text = defaults.string(forKey: "bonusAgility") ?? "0"
        
        //Загрузка значения ловкости в степпер и в лейбл при загрузке экрана
        AgilityStepper.value = Double(defaults.string(forKey: "agilityValue") ?? "10")!
        agilityLabel.text = String(Int(AgilityStepper.value))
        
        //Загрузки подстатов
            //Акробатика
                //Загрузка селектора мастерства
        AcrobaticSkill.selectedSegmentIndex = defaults.integer(forKey: "AcrobaticSkill")
                //Загрузка общего бонуса
        AcrobaticBonus.text = defaults.string(forKey: "AcrobaticBonus.text") ?? "0"
        acrobaticSkillValue = defaults.integer(forKey: "acrobaticSkillValue")
            //Ловкость рук
                //Загрузка селектора мастерства
        HandAgSkill.selectedSegmentIndex = defaults.integer(forKey: "HandAgSkill")
                //Загрузка общего бонуса
        HandAgBonus.text = defaults.string(forKey: "HandAgBonus.text") ?? "0"
        handAgSkillValue = defaults.integer(forKey: "handAgSkillValue")
            //Скрытность
                //Загрузка селектора мастерства
        StealthSkill.selectedSegmentIndex = defaults.integer(forKey: "StealthSkill")
                //Загрузка общего бонуса
        StealthBonus.text = defaults.string(forKey: "StealthBonus.text") ?? "0"
        stealthSkillValue = defaults.integer(forKey: "stealthSkillValue")
        
        // Do any additional setup after loading the view.
    }
    
    //Функции общего бонуса
        //Атлетика
    func acrobaticUpdate() {
        AcrobaticBonus.text = "\(Int(bonusAgility.text!)! + acrobaticSkillValue)"
        defaults.set(AcrobaticBonus.text, forKey: "AcrobaticBonus.text")
    }
        //Ловкость рук
    func handAgUpdate() {
        HandAgBonus.text = "\(Int(bonusAgility.text!)! + handAgSkillValue)"
        defaults.set(HandAgBonus.text, forKey: "HandAgBonus.text")
    }
        //Скрытность
    func stealthUpdate() {
        StealthBonus.text = "\(Int(bonusAgility.text!)! + stealthSkillValue)"
        defaults.set(StealthBonus.text, forKey: "StealthBonus.text")
    }
    
    //Обновление всех вторичных статов
    func secondaryStatUpdate() {
        acrobaticUpdate()
        handAgUpdate()
        stealthUpdate()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
