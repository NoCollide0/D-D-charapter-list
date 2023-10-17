//
//  SilaVC.swift
//  D&D Карточка Игрока
//
//  Created by Федор Шашков on 03.06.2023.
//

import UIKit

class IntellectVC: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var intellectLabel: UILabel!
    
    @IBOutlet weak var bonusIntellect: UILabel!
    
    @IBOutlet weak var IntellectStepper: UIStepper!
    //Сохранение значения интеллекта после изменения и присвоение значения лейблу с переводом в инт и далее в стринг
    //А так же отправка значения интеллекта через notification
    @IBAction func IntellectChange(_ sender: UIStepper) {
        charapter.intellectValue = String(Int(IntellectStepper.value))
        intellectLabel.text = String(Int(IntellectStepper.value))
                
        //Бонус от интеллекта
        switch IntellectStepper.value {
        case 1:
            bonusIntellect.text = "-5"
            charapter.bonusIntellect = bonusIntellect.text
            secondaryStatUpdate()
            break
        case 2...3:
            bonusIntellect.text = "-4"
            charapter.bonusIntellect = bonusIntellect.text
            secondaryStatUpdate()
            break
        case 4...5:
            bonusIntellect.text = "-3"
            charapter.bonusIntellect = bonusIntellect.text
            secondaryStatUpdate()
            break
        case 6...7:
            bonusIntellect.text = "-2"
            charapter.bonusIntellect = bonusIntellect.text
            secondaryStatUpdate()
            break
        case 8...9:
            bonusIntellect.text = "-1"
            charapter.bonusIntellect = bonusIntellect.text
            secondaryStatUpdate()
            break
        case 10...11:
            bonusIntellect.text = "0"
            charapter.bonusIntellect = bonusIntellect.text
            secondaryStatUpdate()
            break
        case 12...13:
            bonusIntellect.text = "+1"
            charapter.bonusIntellect = bonusIntellect.text
            secondaryStatUpdate()
            break
        case 14...15:
            bonusIntellect.text = "+2"
            charapter.bonusIntellect = bonusIntellect.text
            secondaryStatUpdate()
            break
        case 16...17:
            bonusIntellect.text = "+3"
            charapter.bonusIntellect = bonusIntellect.text
            secondaryStatUpdate()
            break
        case 18...19:
            bonusIntellect.text = "+4"
            charapter.bonusIntellect = bonusIntellect.text
            secondaryStatUpdate()
            break
        case 20...21:
            bonusIntellect.text = "+5"
            charapter.bonusIntellect = bonusIntellect.text
            secondaryStatUpdate()
            break
        case 22...23:
            bonusIntellect.text = "+6"
            charapter.bonusIntellect = bonusIntellect.text
            secondaryStatUpdate()
            break
        case 24...25:
            bonusIntellect.text = "+7"
            charapter.bonusIntellect = bonusIntellect.text
            secondaryStatUpdate()
            break
        case 26...27:
            bonusIntellect.text = "+8"
            charapter.bonusIntellect = bonusIntellect.text
            secondaryStatUpdate()
            break
        case 28...29:
            bonusIntellect.text = "+9"
            charapter.bonusIntellect = bonusIntellect.text
            secondaryStatUpdate()
            break
        case 30:
            bonusIntellect.text = "+10"
            charapter.bonusIntellect = bonusIntellect.text
            secondaryStatUpdate()
            break
        default:
            print("intelletcStepperError")
        }
        NotificationCenter.default.post(name: MainScreenVC.deliveryIntellectValue, object: nil, userInfo: ["intellect": intellectLabel.text!,"bonusIntellect": bonusIntellect.text!])
    }
    
    
    //Подстаты
        //Анализ
            //Мастерство
    @IBOutlet weak var AnalyticSkill: UISegmentedControl!
    var analyticSkillValue = 0
    @IBAction func AnalyticSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            charapter.analyticSkill = AnalyticSkill.selectedSegmentIndex
            analyticSkillValue = 0
            charapter.analyticSkillValue = analyticSkillValue
            analyticUpdate()
        case 1:
            charapter.analyticSkill = AnalyticSkill.selectedSegmentIndex
            analyticSkillValue = 2
            charapter.analyticSkillValue = analyticSkillValue
            analyticUpdate()
        case 2:
            charapter.analyticSkill = AnalyticSkill.selectedSegmentIndex
            analyticSkillValue = 4
            charapter.analyticSkillValue = analyticSkillValue
            analyticUpdate()
        default:
            print("AnalyticSelectorError")
        }
    }
            //Общий бонус
    @IBOutlet weak var AnalyticBonus: UILabel!
        //История
            //Мастерство
    @IBOutlet weak var HistorySkill: UISegmentedControl!
    var historySkillValue = 0
    @IBAction func HistorySkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            charapter.historySkill = HistorySkill.selectedSegmentIndex
            historySkillValue = 0
            charapter.historySkillValue = historySkillValue
            historyUpdate()
        case 1:
            charapter.historySkill = HistorySkill.selectedSegmentIndex
            historySkillValue = 2
            charapter.historySkillValue = historySkillValue
            historyUpdate()
        case 2:
            charapter.historySkill = HistorySkill.selectedSegmentIndex
            historySkillValue = 4
            charapter.historySkillValue = historySkillValue
            historyUpdate()
        default:
            print("HistorySelectorError")
        }
    }
            //Общий бонус
    @IBOutlet weak var HistoryBonus: UILabel!
        //Магия
            //Мастерство
    @IBOutlet weak var MagicSkill: UISegmentedControl!
    var magicSkillValue = 0
    @IBAction func MagicSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            charapter.magicSkill = MagicSkill.selectedSegmentIndex
            magicSkillValue = 0
            charapter.magicSkillValue = magicSkillValue
            magicUpdate()
        case 1:
            charapter.magicSkill = MagicSkill.selectedSegmentIndex
            magicSkillValue = 2
            charapter.magicSkillValue = magicSkillValue
            magicUpdate()
        case 2:
            charapter.magicSkill = MagicSkill.selectedSegmentIndex
            magicSkillValue = 4
            charapter.magicSkillValue = magicSkillValue
            magicUpdate()
        default:
            print("MagicSelectorError")
        }
    }
            //Общий бонус
    @IBOutlet weak var MagicBonus: UILabel!
        //Природа
            //Мастерство
    @IBOutlet weak var NatureSkill: UISegmentedControl!
    var natureSkillValue = 0
    @IBAction func NatureSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            charapter.natureSkill = NatureSkill.selectedSegmentIndex
            natureSkillValue = 0
            charapter.natureSkillValue = natureSkillValue
            natureUpdate()
        case 1:
            charapter.natureSkill = NatureSkill.selectedSegmentIndex
            natureSkillValue = 2
            charapter.natureSkillValue = natureSkillValue
            natureUpdate()
        case 2:
            charapter.natureSkill = NatureSkill.selectedSegmentIndex
            natureSkillValue = 4
            charapter.natureSkillValue = natureSkillValue
            natureUpdate()
        default:
            print("NatureSelectorError")
    }
}
            //Общий бонус
    @IBOutlet weak var NatureBonus: UILabel!
        //Религия
            //Мастерство
    @IBOutlet weak var ReligionSkill: UISegmentedControl!
    var religionSkillValue = 0
    @IBAction func ReligionSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            charapter.religionSkill = ReligionSkill.selectedSegmentIndex
            religionSkillValue = 0
            charapter.religionSkillValue = religionSkillValue
            religionUpdate()
        case 1:
            charapter.religionSkill = ReligionSkill.selectedSegmentIndex
            religionSkillValue = 2
            charapter.religionSkillValue = religionSkillValue
            religionUpdate()
        case 2:
            charapter.religionSkill = ReligionSkill.selectedSegmentIndex
            religionSkillValue = 4
            charapter.religionSkillValue = religionSkillValue
            religionUpdate()
        default:
            print("RelgionSelectorError")
    }
}
            //Общий бонус
    @IBOutlet weak var ReligionBonus: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Загрузка бонуса интеллект
        bonusIntellect.text = charapter.bonusIntellect
        
        //Загрузка значения интеллект в степпер и в лейбл при загрузке экрана
        IntellectStepper.value = Double(charapter.intellectValue!)!
        intellectLabel.text = String(Int(IntellectStepper.value))
        
        //Загрузки подстатов
            //Анализ
                //Загрузка селектора мастерства
        AnalyticSkill.selectedSegmentIndex = charapter.analyticSkill
                //Загрузка общего бонуса
        AnalyticBonus.text = charapter.analyticBonusText
        analyticSkillValue = charapter.analyticSkillValue
            //История
                //Загрузка селектора мастерства
        HistorySkill.selectedSegmentIndex = charapter.historySkill
                //Загрузка общего бонуса
        HistoryBonus.text = charapter.historyBonusText
        historySkillValue = charapter.historySkillValue
            //Магия
                //Загрузка селектора мастерства
        MagicSkill.selectedSegmentIndex = charapter.magicSkill
                //Загрузка общего бонуса
        MagicBonus.text = charapter.magicBonusText
        magicSkillValue = charapter.magicSkillValue
            //Природа
                //Загрузка селектора мастерства
        NatureSkill.selectedSegmentIndex = charapter.natureSkill
                //Загрузка общего бонуса
        NatureBonus.text = charapter.natureBonusText
        natureSkillValue = charapter.natureSkillValue
            //Религия
                //Загрузка селектора мастерства
        ReligionSkill.selectedSegmentIndex = charapter.religionSkill
                //Загрузка общего бонуса
        ReligionBonus.text = charapter.religionBonusText
        religionSkillValue = charapter.religionSkillValue
        
    }
    
    //Функции общего бонуса
        //Анализ
    func analyticUpdate() {
        AnalyticBonus.text = "\(Int(bonusIntellect.text!)! + analyticSkillValue)"
        charapter.analyticBonusText = AnalyticBonus.text!
    }
        //История
    func historyUpdate() {
        HistoryBonus.text = "\(Int(bonusIntellect.text!)! + historySkillValue)"
        charapter.historyBonusText = HistoryBonus.text!
    }
        //Магия
    func magicUpdate() {
        MagicBonus.text = "\(Int(bonusIntellect.text!)! + magicSkillValue)"
        charapter.magicBonusText = MagicBonus.text!
    }
        //Природа
    func natureUpdate() {
        NatureBonus.text = "\(Int(bonusIntellect.text!)! + natureSkillValue)"
        charapter.natureBonusText = NatureBonus.text!
    }
        //Религия
    func religionUpdate() {
        ReligionBonus.text = "\(Int(bonusIntellect.text!)! + religionSkillValue)"
        charapter.religionBonusText = ReligionBonus.text!
    }


    
    //Обновление всех вторичных статов
    func secondaryStatUpdate() {
        analyticUpdate()
        historyUpdate()
        magicUpdate()
        natureUpdate()
        religionUpdate()
    }
    
}
