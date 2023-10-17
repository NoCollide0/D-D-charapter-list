//
//  SilaVC.swift
//  D&D Карточка Игрока
//
//  Created by Федор Шашков on 03.06.2023.
//

import UIKit

class CharismaVC: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var charismaLabel: UILabel!
    
    @IBOutlet weak var bonusCharisma: UILabel!
    
    @IBOutlet weak var CharismaStepper: UIStepper!
    //Сохранение значения харизмы после изменения и присвоение значения лейблу с переводом в инт и далее в стринг
    //А так же отправка значения харизмы через notification
    @IBAction func CharismaChange(_ sender: UIStepper) {
        charapter.charismaValue = String(Int(CharismaStepper.value))
        charismaLabel.text = String(Int(CharismaStepper.value))
                
        //Бонус от харизмы
        switch CharismaStepper.value {
        case 1:
            bonusCharisma.text = "-5"
            charapter.bonusCharisma = bonusCharisma.text
            secondaryStatUpdate()
            break
        case 2...3:
            bonusCharisma.text = "-4"
            charapter.bonusCharisma = bonusCharisma.text
            secondaryStatUpdate()
            break
        case 4...5:
            bonusCharisma.text = "-3"
            charapter.bonusCharisma = bonusCharisma.text
            secondaryStatUpdate()
            break
        case 6...7:
            bonusCharisma.text = "-2"
            charapter.bonusCharisma = bonusCharisma.text
            secondaryStatUpdate()
            break
        case 8...9:
            bonusCharisma.text = "-1"
            charapter.bonusCharisma = bonusCharisma.text
            secondaryStatUpdate()
            break
        case 10...11:
            bonusCharisma.text = "0"
            charapter.bonusCharisma = bonusCharisma.text
            secondaryStatUpdate()
            break
        case 12...13:
            bonusCharisma.text = "+1"
            charapter.bonusCharisma = bonusCharisma.text
            secondaryStatUpdate()
            break
        case 14...15:
            bonusCharisma.text = "+2"
            charapter.bonusCharisma = bonusCharisma.text
            secondaryStatUpdate()
            break
        case 16...17:
            bonusCharisma.text = "+3"
            charapter.bonusCharisma = bonusCharisma.text
            secondaryStatUpdate()
            break
        case 18...19:
            bonusCharisma.text = "+4"
            charapter.bonusCharisma = bonusCharisma.text
            secondaryStatUpdate()
            break
        case 20...21:
            bonusCharisma.text = "+5"
            charapter.bonusCharisma = bonusCharisma.text
            secondaryStatUpdate()
            break
        case 22...23:
            bonusCharisma.text = "+6"
            charapter.bonusCharisma = bonusCharisma.text
            secondaryStatUpdate()
            break
        case 24...25:
            bonusCharisma.text = "+7"
            charapter.bonusCharisma = bonusCharisma.text
            secondaryStatUpdate()
            break
        case 26...27:
            bonusCharisma.text = "+8"
            charapter.bonusCharisma = bonusCharisma.text
            secondaryStatUpdate()
            break
        case 28...29:
            bonusCharisma.text = "+9"
            charapter.bonusCharisma = bonusCharisma.text
            secondaryStatUpdate()
            break
        case 30:
            bonusCharisma.text = "+10"
            charapter.bonusCharisma = bonusCharisma.text
            secondaryStatUpdate()
            break
        default:
            print("charismaStepperError")
        }
        NotificationCenter.default.post(name: MainScreenVC.deliveryCharismaValue, object: nil, userInfo: ["charisma": charismaLabel.text!,"bonusCharisma": bonusCharisma.text!])
    }
    
    
    //Подстаты
        //Выступление
            //Мастерство
    @IBOutlet weak var PerformanceSkill: UISegmentedControl!
    var performanceSkillValue = 0
    @IBAction func PerformanceSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            charapter.performanceSkill = PerformanceSkill.selectedSegmentIndex
            performanceSkillValue = 0
            charapter.performanceSkillValue = performanceSkillValue
            performanceUpdate()
        case 1:
            charapter.performanceSkill = PerformanceSkill.selectedSegmentIndex
            performanceSkillValue = 2
            charapter.performanceSkillValue = performanceSkillValue
            performanceUpdate()
        case 2:
            charapter.performanceSkill = PerformanceSkill.selectedSegmentIndex
            performanceSkillValue = 4
            charapter.performanceSkillValue = performanceSkillValue
            performanceUpdate()
        default:
            print("PerformanceSelectorError")
        }
    }
            //Общий бонус
    @IBOutlet weak var PerformanceBonus: UILabel!
        //Запугивание
            //Мастерство
    @IBOutlet weak var IntimidationSkill: UISegmentedControl!
    var intimidationSkillValue = 0
    @IBAction func IntimidationSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            charapter.intimidationSkill = IntimidationSkill.selectedSegmentIndex
            intimidationSkillValue = 0
            charapter.intimidationSkillValue = intimidationSkillValue
            intimidationUpdate()
        case 1:
            charapter.intimidationSkill = IntimidationSkill.selectedSegmentIndex
            intimidationSkillValue = 2
            charapter.intimidationSkillValue = intimidationSkillValue
            intimidationUpdate()
        case 2:
            charapter.intimidationSkill = IntimidationSkill.selectedSegmentIndex
            intimidationSkillValue = 4
            charapter.intimidationSkillValue = intimidationSkillValue
            intimidationUpdate()
        default:
            print("IntimidationSelectorError")
        }
    }
            //Общий бонус
    @IBOutlet weak var IntimidationBonus: UILabel!
        //Обман
            //Мастерство
    @IBOutlet weak var LieSkill: UISegmentedControl!
    var lieSkillValue = 0
    @IBAction func LieSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            charapter.lieSkill = LieSkill.selectedSegmentIndex
            lieSkillValue = 0
            charapter.lieSkillValue = lieSkillValue
            lieUpdate()
        case 1:
            charapter.lieSkill = LieSkill.selectedSegmentIndex
            lieSkillValue = 2
            charapter.lieSkillValue = lieSkillValue
            lieUpdate()
        case 2:
            charapter.lieSkill = LieSkill.selectedSegmentIndex
            lieSkillValue = 4
            charapter.lieSkillValue = lieSkillValue
            lieUpdate()
        default:
            print("LieSelectorError")
        }
    }
            //Общий бонус
    @IBOutlet weak var LieBonus: UILabel!
        //Убеждение
            //Мастерство
    @IBOutlet weak var BeliefSkill: UISegmentedControl!
    var beliefSkillValue = 0
    @IBAction func BeliefSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            charapter.beliefSkill = BeliefSkill.selectedSegmentIndex
            beliefSkillValue = 0
            charapter.beliefSkillValue = beliefSkillValue
            beliefUpdate()
        case 1:
            charapter.beliefSkill = BeliefSkill.selectedSegmentIndex
            beliefSkillValue = 2
            charapter.beliefSkillValue = beliefSkillValue
            beliefUpdate()
        case 2:
            charapter.beliefSkill = BeliefSkill.selectedSegmentIndex
            beliefSkillValue = 4
            charapter.beliefSkillValue = beliefSkillValue
            beliefUpdate()
        default:
            print("BeliefSelectorError")
        }
    }
            //Общий бонус
    @IBOutlet weak var BeliefBonus: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Загрузка бонуса харизмы
        bonusCharisma.text = charapter.bonusCharisma
        
        //Загрузка значения харизмы в степпер и в лейбл при загрузке экрана
        CharismaStepper.value = Double(charapter.charismaValue!)!
        charismaLabel.text = String(Int(CharismaStepper.value))
        
        
        //Загрузки подстатов
            //Выступление
                //Загрузка селектора мастерства
        PerformanceSkill.selectedSegmentIndex = charapter.performanceSkill
                //Загрузка общего бонуса
        PerformanceBonus.text = charapter.performanceBonusText
        performanceSkillValue = charapter.performanceSkillValue
            //Запугивание
                //Загрузка селектора мастерства
        IntimidationSkill.selectedSegmentIndex = charapter.intimidationSkill
                //Загрузка общего бонуса
        IntimidationBonus.text = charapter.intimidationBonusText
        intimidationSkillValue = charapter.intimidationSkillValue
            //Обман
                //Загрузка селектора мастерства
        LieSkill.selectedSegmentIndex = charapter.lieSkill
                //Загрузка общего бонуса
        LieBonus.text = charapter.lieBonusText
        lieSkillValue = charapter.lieSkillValue
            //Убеждение
                //Загрузка селектора мастерства
        BeliefSkill.selectedSegmentIndex = charapter.beliefSkill
                //Загрузка общего бонуса
        BeliefBonus.text = charapter.beliefBonusText
        beliefSkillValue = charapter.beliefSkillValue
        
    }
    
    //Функции общего бонуса
        //Внимание
    func performanceUpdate() {
        PerformanceBonus.text = "\(Int(bonusCharisma.text!)! + performanceSkillValue)"
        charapter.performanceBonusText = PerformanceBonus.text!
    }
        //Выживание
    func intimidationUpdate() {
        IntimidationBonus.text = "\(Int(bonusCharisma.text!)! + intimidationSkillValue)"
        charapter.intimidationBonusText = IntimidationBonus.text!
    }
        //Медицина
    func lieUpdate() {
        LieBonus.text = "\(Int(bonusCharisma.text!)! + lieSkillValue)"
        charapter.lieBonusText = LieBonus.text!
    }
        //Внимательность
    func beliefUpdate() {
        BeliefBonus.text = "\(Int(bonusCharisma.text!)! + beliefSkillValue)"
        charapter.beliefBonusText = BeliefBonus.text!
    }


    
    //Обновление всех вторичных статов
    func secondaryStatUpdate() {
        performanceUpdate()
        intimidationUpdate()
        lieUpdate()
        beliefUpdate()
    }
    
}
