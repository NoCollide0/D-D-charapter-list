//
//  SilaVC.swift
//  D&D Карточка Игрока
//
//  Created by Федор Шашков on 03.06.2023.
//

import UIKit

class WisdomVC: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var wisdomLabel: UILabel!
    
    @IBOutlet weak var bonusWisdom: UILabel!
    
    @IBOutlet weak var WisdomStepper: UIStepper!
    //Сохранение значения мудрости после изменения и присвоение значения лейблу с переводом в инт и далее в стринг
    //А так же отправка значения мудрости через notification
    @IBAction func WisdomChange(_ sender: UIStepper) {
        ///defaults.set(String(Int(WisdomStepper.value)), forKey: "wisdomValue")
        charapter.wisdomValue = String(Int(WisdomStepper.value))
        wisdomLabel.text = String(Int(WisdomStepper.value))
                
        //Бонус от мудрости
        switch WisdomStepper.value {
        case 1:
            bonusWisdom.text = "-5"
            charapter.bonusWisdom = bonusWisdom.text
            secondaryStatUpdate()
            break
        case 2...3:
            bonusWisdom.text = "-4"
            charapter.bonusWisdom = bonusWisdom.text
            secondaryStatUpdate()
            break
        case 4...5:
            bonusWisdom.text = "-3"
            charapter.bonusWisdom = bonusWisdom.text
            secondaryStatUpdate()
            break
        case 6...7:
            bonusWisdom.text = "-2"
            charapter.bonusWisdom = bonusWisdom.text
            secondaryStatUpdate()
            break
        case 8...9:
            bonusWisdom.text = "-1"
            charapter.bonusWisdom = bonusWisdom.text
            secondaryStatUpdate()
            break
        case 10...11:
            bonusWisdom.text = "0"
            charapter.bonusWisdom = bonusWisdom.text
            secondaryStatUpdate()
            break
        case 12...13:
            bonusWisdom.text = "+1"
            charapter.bonusWisdom = bonusWisdom.text
            secondaryStatUpdate()
            break
        case 14...15:
            bonusWisdom.text = "+2"
            charapter.bonusWisdom = bonusWisdom.text
            secondaryStatUpdate()
            break
        case 16...17:
            bonusWisdom.text = "+3"
            charapter.bonusWisdom = bonusWisdom.text
            secondaryStatUpdate()
            break
        case 18...19:
            bonusWisdom.text = "+4"
            charapter.bonusWisdom = bonusWisdom.text
            secondaryStatUpdate()
            break
        case 20...21:
            bonusWisdom.text = "+5"
            charapter.bonusWisdom = bonusWisdom.text
            secondaryStatUpdate()
            break
        case 22...23:
            bonusWisdom.text = "+6"
            charapter.bonusWisdom = bonusWisdom.text
            secondaryStatUpdate()
            break
        case 24...25:
            bonusWisdom.text = "+7"
            charapter.bonusWisdom = bonusWisdom.text
            secondaryStatUpdate()
            break
        case 26...27:
            bonusWisdom.text = "+8"
            charapter.bonusWisdom = bonusWisdom.text
            secondaryStatUpdate()
            break
        case 28...29:
            bonusWisdom.text = "+9"
            charapter.bonusWisdom = bonusWisdom.text
            secondaryStatUpdate()
            break
        case 30:
            bonusWisdom.text = "+10"
            charapter.bonusWisdom = bonusWisdom.text
            secondaryStatUpdate()
            break
        default:
            print("wisdomStepperError")
        }
        NotificationCenter.default.post(name: MainScreenVC.deliveryWisdomValue, object: nil, userInfo: ["wisdom": wisdomLabel.text!,"bonusWisdom": bonusWisdom.text!])
    }
    
    
    //Подстаты
        //Внимательность
            //Мастерство
    @IBOutlet weak var AttentionSkill: UISegmentedControl!
    var attentionSkillValue = 0
    @IBAction func AttentionSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            ///defaults.set(AttentionSkill.selectedSegmentIndex, forKey: "AttentionSkill")
            charapter.attentionSkill = AttentionSkill.selectedSegmentIndex
            attentionSkillValue = 0
            ///defaults.set(attentionSkillValue, forKey: "attentionSkillValue")
            charapter.attentionSkillValue = attentionSkillValue
            attentionUpdate()
        case 1:
            ///defaults.set(AttentionSkill.selectedSegmentIndex, forKey: "AttentionSkill")
            charapter.attentionSkill = AttentionSkill.selectedSegmentIndex
            attentionSkillValue = 2
            ///defaults.set(attentionSkillValue, forKey: "attentionSkillValue")
            charapter.attentionSkillValue = attentionSkillValue
            attentionUpdate()
        case 2:
            ///defaults.set(AttentionSkill.selectedSegmentIndex, forKey: "AttentionSkill")
            charapter.attentionSkill = AttentionSkill.selectedSegmentIndex
            attentionSkillValue = 4
            ///defaults.set(attentionSkillValue, forKey: "attentionSkillValue")
            charapter.attentionSkillValue = attentionSkillValue
            attentionUpdate()
        default:
            print("AttentionSelectorError")
        }
    }
            //Общий бонус
    @IBOutlet weak var AttentionBonus: UILabel!
        //Выживание
            //Мастерство
    @IBOutlet weak var SurvivalSkill: UISegmentedControl!
    var survivalSkillValue = 0
    @IBAction func SurvivalSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            ///defaults.set(SurvivalSkill.selectedSegmentIndex, forKey: "SurvivalSkill")
            charapter.survivalSkill = SurvivalSkill.selectedSegmentIndex
            survivalSkillValue = 0
            ///defaults.set(survivalSkillValue, forKey: "survivalSkillValue")
            charapter.survivalSkillValue = survivalSkillValue
            survivalUpdate()
        case 1:
            ///defaults.set(SurvivalSkill.selectedSegmentIndex, forKey: "SurvivalSkill")
            charapter.survivalSkill = SurvivalSkill.selectedSegmentIndex
            survivalSkillValue = 2
            ///defaults.set(survivalSkillValue, forKey: "survivalSkillValue")
            charapter.survivalSkillValue = survivalSkillValue
            survivalUpdate()
        case 2:
            ///defaults.set(SurvivalSkill.selectedSegmentIndex, forKey: "SurvivalSkill")
            charapter.survivalSkill = SurvivalSkill.selectedSegmentIndex
            survivalSkillValue = 4
            ///defaults.set(survivalSkillValue, forKey: "survivalSkillValue")
            charapter.survivalSkillValue = survivalSkillValue
            survivalUpdate()
        default:
            print("SurvivalSelectorError")
        }
    }
            //Общий бонус
    @IBOutlet weak var SurvivalBonus: UILabel!
        //Медицина
            //Мастерство
    @IBOutlet weak var MedicalSkill: UISegmentedControl!
    var medicalSkillValue = 0
    @IBAction func MedicalSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            ///defaults.set(MedicalSkill.selectedSegmentIndex, forKey: "MedicalSkill")
            charapter.medicalSkill = MedicalSkill.selectedSegmentIndex
            medicalSkillValue = 0
            ///defaults.set(medicalSkillValue, forKey: "medicalSkillValue")
            charapter.medicalSkillValue = medicalSkillValue
            medicalUpdate()
        case 1:
            ///defaults.set(MedicalSkill.selectedSegmentIndex, forKey: "MedicalSkill")
            charapter.medicalSkill = MedicalSkill.selectedSegmentIndex
            medicalSkillValue = 2
            ///defaults.set(medicalSkillValue, forKey: "medicalSkillValue")
            charapter.medicalSkillValue = medicalSkillValue
            medicalUpdate()
        case 2:
            ///defaults.set(MedicalSkill.selectedSegmentIndex, forKey: "MedicalSkill")
            charapter.medicalSkill = MedicalSkill.selectedSegmentIndex
            medicalSkillValue = 4
            ///defaults.set(medicalSkillValue, forKey: "medicalSkillValue")
            charapter.medicalSkillValue = medicalSkillValue
            medicalUpdate()
        default:
            print("MedicalSelectorError")
        }
    }
            //Общий бонус
    @IBOutlet weak var MedicalBonus: UILabel!
        //Проницательность
            //Мастерство
    @IBOutlet weak var InsightSkill: UISegmentedControl!
    var insightSkillValue = 0
    @IBAction func InsightSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            ///defaults.set(InsightSkill.selectedSegmentIndex, forKey: "InsightSkill")
            charapter.insightSkill = InsightSkill.selectedSegmentIndex
            insightSkillValue = 0
            ///defaults.set(insightSkillValue, forKey: "insightSkillValue")
            charapter.insightSkillValue = insightSkillValue
            insightUpdate()
        case 1:
            ///defaults.set(InsightSkill.selectedSegmentIndex, forKey: "InsightSkill")
            charapter.insightSkill = InsightSkill.selectedSegmentIndex
            insightSkillValue = 2
            ///defaults.set(insightSkillValue, forKey: "insightSkillValue")
            charapter.insightSkillValue = insightSkillValue
            insightUpdate()
        case 2:
            ///defaults.set(InsightSkill.selectedSegmentIndex, forKey: "InsightSkill")
            charapter.insightSkill = InsightSkill.selectedSegmentIndex
            insightSkillValue = 4
            ///defaults.set(insightSkillValue, forKey: "insightSkillValue")
            charapter.insightSkillValue = insightSkillValue
            insightUpdate()
        default:
            print("InsightSelectorError")
        }
    }
            //Общий бонус
    @IBOutlet weak var InsightBonus: UILabel!
        //Уход за животными
            //Мастерство
    @IBOutlet weak var AnimalCareSkill: UISegmentedControl!
    var animalCareSkillValue = 0
    @IBAction func AnimalCareSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            ///defaults.set(AnimalCareSkill.selectedSegmentIndex, forKey: "AnimalCareSkill")
            charapter.animalCareSkill = AnimalCareSkill.selectedSegmentIndex
            animalCareSkillValue = 0
            ///defaults.set(animalCareSkillValue, forKey: "animalCareSkillValue")
            charapter.animalCareSkillValue = animalCareSkillValue
            animalCareUpdate()
        case 1:
            ///defaults.set(AnimalCareSkill.selectedSegmentIndex, forKey: "AnimalCareSkill")
            charapter.animalCareSkill = AnimalCareSkill.selectedSegmentIndex
            animalCareSkillValue = 2
            ///defaults.set(animalCareSkillValue, forKey: "animalCareSkillValue")
            charapter.animalCareSkillValue = animalCareSkillValue
            animalCareUpdate()
        case 2:
            ///defaults.set(AnimalCareSkill.selectedSegmentIndex, forKey: "AnimalCareSkill")
            charapter.animalCareSkill = AnimalCareSkill.selectedSegmentIndex
            animalCareSkillValue = 4
            ///defaults.set(animalCareSkillValue, forKey: "animalCareSkillValue")
            charapter.animalCareSkillValue = animalCareSkillValue
            animalCareUpdate()
        default:
            print("AnimalCareSelectorError")
    }
}
            //Общий бонус
    @IBOutlet weak var AnimalCareBonus: UILabel!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Загрузка бонуса мудрости
        ///bonusWisdom.text = defaults.string(forKey: "bonusWisdom") ?? "0"
        bonusWisdom.text = charapter.bonusWisdom
        
        //Загрузка значения мудрости в степпер и в лейбл при загрузке экрана
        ///WisdomStepper.value = Double(defaults.string(forKey: "wisdomValue") ?? "10")!
        WisdomStepper.value = Double(charapter.wisdomValue!)!
        wisdomLabel.text = String(Int(WisdomStepper.value))
        
        
        //Загрузки подстатов
            //Внимание
                //Загрузка селектора мастерства
        ///AttentionSkill.selectedSegmentIndex = defaults.integer(forKey: "AttentionSkill")
        AttentionSkill.selectedSegmentIndex = charapter.attentionSkill
                //Загрузка общего бонуса
        ///AttentionBonus.text = defaults.string(forKey: "AttentionBonus.text") ?? "0"
        AttentionBonus.text = charapter.attentionBonusText
        ///attentionSkillValue = defaults.integer(forKey: "attentionSkillValue")
        attentionSkillValue = charapter.attentionSkillValue
            //Выживание
                //Загрузка селектора мастерства
        ///SurvivalSkill.selectedSegmentIndex = defaults.integer(forKey: "SurvivalSkill")
        SurvivalSkill.selectedSegmentIndex = charapter.survivalSkill
                //Загрузка общего бонуса
        ///SurvivalBonus.text = defaults.string(forKey: "SurvivalBonus.text") ?? "0"
        SurvivalBonus.text = charapter.survivalBonusText
        ///survivalSkillValue = defaults.integer(forKey: "survivalSkillValue")
        survivalSkillValue = charapter.survivalSkillValue
            //Медицина
                //Загрузка селектора мастерства
        ///MedicalSkill.selectedSegmentIndex = defaults.integer(forKey: "MedicalSkill")
        MedicalSkill.selectedSegmentIndex = charapter.medicalSkill
                //Загрузка общего бонуса
        ///MedicalBonus.text = defaults.string(forKey: "MedicalBonus.text") ?? "0"
        MedicalBonus.text = charapter.medicalBonusText
        ///medicalSkillValue = defaults.integer(forKey: "medicalSkillValue")
        medicalSkillValue = charapter.medicalSkillValue
            //Уход за животными
                //Загрузка селектора мастерства
        ///AnimalCareSkill.selectedSegmentIndex = defaults.integer(forKey: "AnimalCareSkill")
        AnimalCareSkill.selectedSegmentIndex = charapter.animalCareSkill
                //Загрузка общего бонуса
        ///AnimalCareBonus.text = defaults.string(forKey: "AnimalCareBonus.text") ?? "0"
        AnimalCareBonus.text = charapter.animalCareBonusText
        ///animalCareSkillValue = defaults.integer(forKey: "animalCareSkillValue")
        animalCareSkillValue = charapter.animalCareSkillValue
            //Внимательность
                //Загрузка селектора мастерства
        ///InsightSkill.selectedSegmentIndex = defaults.integer(forKey: "InsightSkill")
        InsightSkill.selectedSegmentIndex = charapter.insightSkill
                //Загрузка общего бонуса
        ///InsightBonus.text = defaults.string(forKey: "InsightBonus.text") ?? "0"
        InsightBonus.text = charapter.insightBonusText
        ///insightSkillValue = defaults.integer(forKey: "insightSkillValue")
        insightSkillValue = charapter.insightSkillValue
        
        // Do any additional setup after loading the view.
    }
    
    //Функции общего бонуса
        //Внимание
    func attentionUpdate() {
        AttentionBonus.text = "\(Int(bonusWisdom.text!)! + attentionSkillValue)"
        ///defaults.set(AttentionBonus.text, forKey: "AttentionBonus.text")
        charapter.attentionBonusText = AttentionBonus.text!
    }
        //Выживание
    func survivalUpdate() {
        SurvivalBonus.text = "\(Int(bonusWisdom.text!)! + survivalSkillValue)"
        ///defaults.set(SurvivalBonus.text, forKey: "SurvivalBonus.text")
        charapter.survivalBonusText = SurvivalBonus.text!
    }
        //Медицина
    func medicalUpdate() {
        MedicalBonus.text = "\(Int(bonusWisdom.text!)! + medicalSkillValue)"
        ///defaults.set(MedicalBonus.text, forKey: "MedicalBonus.text")
        charapter.medicalBonusText = MedicalBonus.text!
    }
        //Уход за животными
    func animalCareUpdate() {
        AnimalCareBonus.text = "\(Int(bonusWisdom.text!)! + animalCareSkillValue)"
        ///defaults.set(AnimalCareBonus.text, forKey: "AnimalCareBonus.text")
        charapter.animalCareBonusText = AnimalCareBonus.text!
    }
        //Внимательность
    func insightUpdate() {
        InsightBonus.text = "\(Int(bonusWisdom.text!)! + insightSkillValue)"
        ///defaults.set(InsightBonus.text, forKey: "InsightBonus.text")
        charapter.insightBonusText = InsightBonus.text!
    }


    
    //Обновление всех вторичных статов
    func secondaryStatUpdate() {
        attentionUpdate()
        survivalUpdate()
        medicalUpdate()
        animalCareUpdate()
        insightUpdate()
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
