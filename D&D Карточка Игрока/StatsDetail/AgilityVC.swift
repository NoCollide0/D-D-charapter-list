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
        charapter.agilityValue = String(Int(AgilityStepper.value))
        agilityLabel.text = String(Int(AgilityStepper.value))
                
        //Бонус от ловкости
        switch AgilityStepper.value {
        case 1:
            bonusAgility.text = "-5"
            charapter.bonusAgility = bonusAgility.text
            secondaryStatUpdate()
            break
        case 2...3:
            bonusAgility.text = "-4"
            charapter.bonusAgility = bonusAgility.text
            secondaryStatUpdate()
            break
        case 4...5:
            bonusAgility.text = "-3"
            charapter.bonusAgility = bonusAgility.text
            secondaryStatUpdate()
            break
        case 6...7:
            bonusAgility.text = "-2"
            charapter.bonusAgility = bonusAgility.text
            secondaryStatUpdate()
            break
        case 8...9:
            bonusAgility.text = "-1"
            charapter.bonusAgility = bonusAgility.text
            secondaryStatUpdate()
            break
        case 10...11:
            bonusAgility.text = "0"
            charapter.bonusAgility = bonusAgility.text
            secondaryStatUpdate()
            break
        case 12...13:
            bonusAgility.text = "+1"
            charapter.bonusAgility = bonusAgility.text
            secondaryStatUpdate()
            break
        case 14...15:
            bonusAgility.text = "+2"
            charapter.bonusAgility = bonusAgility.text
            secondaryStatUpdate()
            break
        case 16...17:
            bonusAgility.text = "+3"
            charapter.bonusAgility = bonusAgility.text
            secondaryStatUpdate()
            break
        case 18...19:
            bonusAgility.text = "+4"
            charapter.bonusAgility = bonusAgility.text
            secondaryStatUpdate()
            break
        case 20...21:
            bonusAgility.text = "+5"
            charapter.bonusAgility = bonusAgility.text
            secondaryStatUpdate()
            break
        case 22...23:
            bonusAgility.text = "+6"
            charapter.bonusAgility = bonusAgility.text
            secondaryStatUpdate()
            break
        case 24...25:
            bonusAgility.text = "+7"
            charapter.bonusAgility = bonusAgility.text
            secondaryStatUpdate()
            break
        case 26...27:
            bonusAgility.text = "+8"
            charapter.bonusAgility = bonusAgility.text
            secondaryStatUpdate()
            break
        case 28...29:
            bonusAgility.text = "+9"
            charapter.bonusAgility = bonusAgility.text
            secondaryStatUpdate()
            break
        case 30:
            bonusAgility.text = "+10"
            charapter.bonusAgility = bonusAgility.text
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
            charapter.acrobaticSkill = AcrobaticSkill.selectedSegmentIndex
            acrobaticSkillValue = 0
            charapter.acrobaticSkillValue = acrobaticSkillValue
            acrobaticUpdate()
        case 1:
            charapter.acrobaticSkill = AcrobaticSkill.selectedSegmentIndex
            acrobaticSkillValue = 2
            charapter.acrobaticSkillValue = acrobaticSkillValue
            acrobaticUpdate()
        case 2:
            charapter.acrobaticSkill = AcrobaticSkill.selectedSegmentIndex
            acrobaticSkillValue = 4
            charapter.acrobaticSkillValue = acrobaticSkillValue
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
            charapter.handAgSkill = HandAgSkill.selectedSegmentIndex
            handAgSkillValue = 0
            charapter.handAgSkillValue = handAgSkillValue
            handAgUpdate()
        case 1:
            charapter.handAgSkill = HandAgSkill.selectedSegmentIndex
            handAgSkillValue = 2
            charapter.handAgSkillValue = handAgSkillValue
            handAgUpdate()
        case 2:
            charapter.handAgSkill = HandAgSkill.selectedSegmentIndex
            handAgSkillValue = 4
            charapter.handAgSkillValue = handAgSkillValue
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
            charapter.stealthSkill = StealthSkill.selectedSegmentIndex
            stealthSkillValue = 0
            charapter.stealthSkillValue = stealthSkillValue
            stealthUpdate()
        case 1:
            charapter.stealthSkill = StealthSkill.selectedSegmentIndex
            stealthSkillValue = 2
            charapter.stealthSkillValue = stealthSkillValue
            stealthUpdate()
        case 2:
            charapter.stealthSkill = StealthSkill.selectedSegmentIndex
            stealthSkillValue = 4
            charapter.stealthSkillValue = stealthSkillValue
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
        bonusAgility.text = charapter.bonusAgility
        
        //Загрузка значения ловкости в степпер и в лейбл при загрузке экрана
        AgilityStepper.value = Double(charapter.agilityValue!)!
        agilityLabel.text = String(Int(AgilityStepper.value))
        
        //Загрузки подстатов
            //Акробатика
                //Загрузка селектора мастерства
        AcrobaticSkill.selectedSegmentIndex = charapter.acrobaticSkill
                //Загрузка общего бонуса
        AcrobaticBonus.text = charapter.acrobaticBonusText
        acrobaticSkillValue = charapter.acrobaticSkillValue
            //Ловкость рук
                //Загрузка селектора мастерства
        HandAgSkill.selectedSegmentIndex = charapter.handAgSkill
                //Загрузка общего бонуса
        HandAgBonus.text = charapter.handAgBonusText
        handAgSkillValue = charapter.handAgSkillValue
            //Скрытность
                //Загрузка селектора мастерства
        StealthSkill.selectedSegmentIndex = charapter.stealthSkill
                //Загрузка общего бонуса
        StealthBonus.text = charapter.stealthBonusText
        stealthSkillValue = charapter.stealthSkillValue
        
    }
    
    //Функции общего бонуса
        //Атлетика
    func acrobaticUpdate() {
        AcrobaticBonus.text = "\(Int(bonusAgility.text!)! + acrobaticSkillValue)"
        charapter.acrobaticBonusText = AcrobaticBonus.text!
    }
        //Ловкость рук
    func handAgUpdate() {
        HandAgBonus.text = "\(Int(bonusAgility.text!)! + handAgSkillValue)"
        charapter.handAgBonusText = HandAgBonus.text!
    }
        //Скрытность
    func stealthUpdate() {
        StealthBonus.text = "\(Int(bonusAgility.text!)! + stealthSkillValue)"
        charapter.stealthBonusText = StealthBonus.text!
    }
    
    //Обновление всех вторичных статов
    func secondaryStatUpdate() {
        acrobaticUpdate()
        handAgUpdate()
        stealthUpdate()
    }
    
}
