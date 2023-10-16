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
        defaults.set(String(Int(IntellectStepper.value)), forKey: "intellectValue")
        intellectLabel.text = String(Int(IntellectStepper.value))
                
        //Бонус от интеллекта
        switch IntellectStepper.value {
        case 1:
            bonusIntellect.text = "-5"
            defaults.set(bonusIntellect.text, forKey: "bonusIntellect")
            secondaryStatUpdate()
            break
        case 2...3:
            bonusIntellect.text = "-4"
            defaults.set(bonusIntellect.text, forKey: "bonusIntellect")
            secondaryStatUpdate()
            break
        case 4...5:
            bonusIntellect.text = "-3"
            defaults.set(bonusIntellect.text, forKey: "bonusIntellect")
            secondaryStatUpdate()
            break
        case 6...7:
            bonusIntellect.text = "-2"
            defaults.set(bonusIntellect.text, forKey: "bonusIntellect")
            secondaryStatUpdate()
            break
        case 8...9:
            bonusIntellect.text = "-1"
            defaults.set(bonusIntellect.text, forKey: "bonusIntellect")
            secondaryStatUpdate()
            break
        case 10...11:
            bonusIntellect.text = "0"
            defaults.set(bonusIntellect.text, forKey: "bonusIntellect")
            secondaryStatUpdate()
            break
        case 12...13:
            bonusIntellect.text = "+1"
            defaults.set(bonusIntellect.text, forKey: "bonusIntellect")
            secondaryStatUpdate()
            break
        case 14...15:
            bonusIntellect.text = "+2"
            defaults.set(bonusIntellect.text, forKey: "bonusIntellect")
            secondaryStatUpdate()
            break
        case 16...17:
            bonusIntellect.text = "+3"
            defaults.set(bonusIntellect.text, forKey: "bonusIntellect")
            secondaryStatUpdate()
            break
        case 18...19:
            bonusIntellect.text = "+4"
            defaults.set(bonusIntellect.text, forKey: "bonusIntellect")
            secondaryStatUpdate()
            break
        case 20...21:
            bonusIntellect.text = "+5"
            defaults.set(bonusIntellect.text, forKey: "bonusIntellect")
            secondaryStatUpdate()
            break
        case 22...23:
            bonusIntellect.text = "+6"
            defaults.set(bonusIntellect.text, forKey: "bonusIntellect")
            secondaryStatUpdate()
            break
        case 24...25:
            bonusIntellect.text = "+7"
            defaults.set(bonusIntellect.text, forKey: "bonusIntellect")
            secondaryStatUpdate()
            break
        case 26...27:
            bonusIntellect.text = "+8"
            defaults.set(bonusIntellect.text, forKey: "bonusIntellect")
            secondaryStatUpdate()
            break
        case 28...29:
            bonusIntellect.text = "+9"
            defaults.set(bonusIntellect.text, forKey: "bonusIntellect")
            secondaryStatUpdate()
            break
        case 30:
            bonusIntellect.text = "+10"
            defaults.set(bonusIntellect.text, forKey: "bonusIntellect")
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
            defaults.set(AnalyticSkill.selectedSegmentIndex, forKey: "AnalyticSkill")
            analyticSkillValue = 0
            defaults.set(analyticSkillValue, forKey: "analyticSkillValue")
            analyticUpdate()
        case 1:
            defaults.set(AnalyticSkill.selectedSegmentIndex, forKey: "AnalyticSkill")
            analyticSkillValue = 2
            defaults.set(analyticSkillValue, forKey: "analyticSkillValue")
            analyticUpdate()
        case 2:
            defaults.set(AnalyticSkill.selectedSegmentIndex, forKey: "AnalyticSkill")
            analyticSkillValue = 4
            defaults.set(analyticSkillValue, forKey: "analyticSkillValue")
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
            defaults.set(HistorySkill.selectedSegmentIndex, forKey: "HistorySkill")
            historySkillValue = 0
            defaults.set(historySkillValue, forKey: "historySkillValue")
            historyUpdate()
        case 1:
            defaults.set(HistorySkill.selectedSegmentIndex, forKey: "HistorySkill")
            historySkillValue = 2
            defaults.set(historySkillValue, forKey: "historySkillValue")
            historyUpdate()
        case 2:
            defaults.set(HistorySkill.selectedSegmentIndex, forKey: "HistorySkill")
            historySkillValue = 4
            defaults.set(historySkillValue, forKey: "historySkillValue")
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
            defaults.set(MagicSkill.selectedSegmentIndex, forKey: "MagicSkill")
            magicSkillValue = 0
            defaults.set(magicSkillValue, forKey: "magicSkillValue")
            magicUpdate()
        case 1:
            defaults.set(MagicSkill.selectedSegmentIndex, forKey: "MagicSkill")
            magicSkillValue = 2
            defaults.set(magicSkillValue, forKey: "magicSkillValue")
            magicUpdate()
        case 2:
            defaults.set(MagicSkill.selectedSegmentIndex, forKey: "MagicSkill")
            magicSkillValue = 4
            defaults.set(magicSkillValue, forKey: "magicSkillValue")
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
            defaults.set(NatureSkill.selectedSegmentIndex, forKey: "NatureSkill")
            natureSkillValue = 0
            defaults.set(natureSkillValue, forKey: "natureSkillValue")
            natureUpdate()
        case 1:
            defaults.set(NatureSkill.selectedSegmentIndex, forKey: "NatureSkill")
            natureSkillValue = 2
            defaults.set(natureSkillValue, forKey: "natureSkillValue")
            natureUpdate()
        case 2:
            defaults.set(NatureSkill.selectedSegmentIndex, forKey: "NatureSkill")
            natureSkillValue = 4
            defaults.set(natureSkillValue, forKey: "natureSkillValue")
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
            defaults.set(ReligionSkill.selectedSegmentIndex, forKey: "ReligionSkill")
            religionSkillValue = 0
            defaults.set(religionSkillValue, forKey: "religionSkillValue")
            religionUpdate()
        case 1:
            defaults.set(ReligionSkill.selectedSegmentIndex, forKey: "ReligionSkill")
            religionSkillValue = 2
            defaults.set(religionSkillValue, forKey: "religionSkillValue")
            religionUpdate()
        case 2:
            defaults.set(ReligionSkill.selectedSegmentIndex, forKey: "ReligionSkill")
            religionSkillValue = 4
            defaults.set(religionSkillValue, forKey: "religionSkillValue")
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
        bonusIntellect.text = defaults.string(forKey: "bonusIntellect") ?? "0"
        
        //Загрузка значения интеллект в степпер и в лейбл при загрузке экрана
        IntellectStepper.value = Double(defaults.string(forKey: "intellectValue") ?? "10")!
        intellectLabel.text = String(Int(IntellectStepper.value))
        
        //Загрузки подстатов
            //Анализ
                //Загрузка селектора мастерства
        AnalyticSkill.selectedSegmentIndex = defaults.integer(forKey: "AnalyticSkill")
                //Загрузка общего бонуса
        AnalyticBonus.text = defaults.string(forKey: "AnalyticBonus.text") ?? "0"
        analyticSkillValue = defaults.integer(forKey: "analyticSkillValue")
            //История
                //Загрузка селектора мастерства
        HistorySkill.selectedSegmentIndex = defaults.integer(forKey: "HistorySkill")
                //Загрузка общего бонуса
        HistoryBonus.text = defaults.string(forKey: "HistoryBonus.text") ?? "0"
        historySkillValue = defaults.integer(forKey: "historySkillValue")
            //Магия
                //Загрузка селектора мастерства
        MagicSkill.selectedSegmentIndex = defaults.integer(forKey: "MagicSkill")
                //Загрузка общего бонуса
        MagicBonus.text = defaults.string(forKey: "MagicBonus.text") ?? "0"
        magicSkillValue = defaults.integer(forKey: "magicSkillValue")
            //Природа
                //Загрузка селектора мастерства
        NatureSkill.selectedSegmentIndex = defaults.integer(forKey: "NatureSkill")
                //Загрузка общего бонуса
        NatureBonus.text = defaults.string(forKey: "NatureBonus.text") ?? "0"
        natureSkillValue = defaults.integer(forKey: "natureSkillValue")
            //Религия
                //Загрузка селектора мастерства
        ReligionSkill.selectedSegmentIndex = defaults.integer(forKey: "ReligionSkill")
                //Загрузка общего бонуса
        ReligionBonus.text = defaults.string(forKey: "ReligionBonus.text") ?? "0"
        religionSkillValue = defaults.integer(forKey: "religionSkillValue")
        
        // Do any additional setup after loading the view.
    }
    
    //Функции общего бонуса
        //Анализ
    func analyticUpdate() {
        AnalyticBonus.text = "\(Int(bonusIntellect.text!)! + analyticSkillValue)"
        defaults.set(AnalyticBonus.text, forKey: "AnalyticBonus.text")
    }
        //История
    func historyUpdate() {
        HistoryBonus.text = "\(Int(bonusIntellect.text!)! + historySkillValue)"
        defaults.set(HistoryBonus.text, forKey: "HistoryBonus.text")
    }
        //Магия
    func magicUpdate() {
        MagicBonus.text = "\(Int(bonusIntellect.text!)! + magicSkillValue)"
        defaults.set(MagicBonus.text, forKey: "MagicBonus.text")
    }
        //Природа
    func natureUpdate() {
        NatureBonus.text = "\(Int(bonusIntellect.text!)! + natureSkillValue)"
        defaults.set(NatureBonus.text, forKey: "MagicBonus.text")
    }
        //Религия
    func religionUpdate() {
        ReligionBonus.text = "\(Int(bonusIntellect.text!)! + religionSkillValue)"
        defaults.set(ReligionBonus.text, forKey: "ReligionBonus.text")
    }


    
    //Обновление всех вторичных статов
    func secondaryStatUpdate() {
        analyticUpdate()
        historyUpdate()
        magicUpdate()
        natureUpdate()
        religionUpdate()
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
