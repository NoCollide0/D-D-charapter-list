//
//  SilaVC.swift
//  D&D Карточка Игрока
//
//  Created by Федор Шашков on 03.06.2023.
//

import UIKit

class SilaVC: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var silaLabel: UILabel!
    
    @IBOutlet weak var bonusSila: UILabel!
    
    @IBOutlet weak var SilaStepper: UIStepper!
    //Сохранение значения силы после изменения и присвоение значения лейблу с переводом в инт и далее в стринг
    //А так же отправка значения силы через notification
    @IBAction func SilaChange(_ sender: UIStepper) {
        defaults.set(String(Int(SilaStepper.value)), forKey: "silaValue")
        silaLabel.text = String(Int(SilaStepper.value))
                
        //Бонус от силы
        switch SilaStepper.value {
        case 1:
            bonusSila.text = "-5"
            defaults.set(bonusSila.text, forKey: "bonusSila")
            secondaryStatUpdate()
            break
        case 2...3:
            bonusSila.text = "-4"
            defaults.set(bonusSila.text, forKey: "bonusSila")
            secondaryStatUpdate()
            break
        case 4...5:
            bonusSila.text = "-3"
            defaults.set(bonusSila.text, forKey: "bonusSila")
            secondaryStatUpdate()
            break
        case 6...7:
            bonusSila.text = "-2"
            defaults.set(bonusSila.text, forKey: "bonusSila")
            secondaryStatUpdate()
            break
        case 8...9:
            bonusSila.text = "-1"
            defaults.set(bonusSila.text, forKey: "bonusSila")
            secondaryStatUpdate()
            break
        case 10...11:
            bonusSila.text = "0"
            defaults.set(bonusSila.text, forKey: "bonusSila")
            secondaryStatUpdate()
            break
        case 12...13:
            bonusSila.text = "+1"
            defaults.set(bonusSila.text, forKey: "bonusSila")
            secondaryStatUpdate()
            break
        case 14...15:
            bonusSila.text = "+2"
            defaults.set(bonusSila.text, forKey: "bonusSila")
            secondaryStatUpdate()
            break
        case 16...17:
            bonusSila.text = "+3"
            defaults.set(bonusSila.text, forKey: "bonusSila")
            secondaryStatUpdate()
            break
        case 18...19:
            bonusSila.text = "+4"
            defaults.set(bonusSila.text, forKey: "bonusSila")
            secondaryStatUpdate()
            break
        case 20...21:
            bonusSila.text = "+5"
            defaults.set(bonusSila.text, forKey: "bonusSila")
            secondaryStatUpdate()
            break
        case 22...23:
            bonusSila.text = "+6"
            defaults.set(bonusSila.text, forKey: "bonusSila")
            secondaryStatUpdate()
            break
        case 24...25:
            bonusSila.text = "+7"
            defaults.set(bonusSila.text, forKey: "bonusSila")
            secondaryStatUpdate()
            break
        case 26...27:
            bonusSila.text = "+8"
            defaults.set(bonusSila.text, forKey: "bonusSila")
            secondaryStatUpdate()
            break
        case 28...29:
            bonusSila.text = "+9"
            defaults.set(bonusSila.text, forKey: "bonusSila")
            secondaryStatUpdate()
            break
        case 30:
            bonusSila.text = "+10"
            defaults.set(bonusSila.text, forKey: "bonusSila")
            secondaryStatUpdate()
            break
        default:
            print("silaStepperError")
        }
        NotificationCenter.default.post(name: MainScreenVC.deliverySilaValue, object: nil, userInfo: ["sila": silaLabel.text!,"bonusSila": bonusSila.text!])
    }
    
    //Атлетика
        //Мастерство
    @IBOutlet weak var AtleticSkill: UISegmentedControl!
    
    var atleticSkillValue = 0
    @IBAction func AtleticSkillChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            defaults.set(AtleticSkill.selectedSegmentIndex, forKey: "AtleticSkill")
            atleticSkillValue = 0
            defaults.set(atleticSkillValue, forKey: "atleticSkillValue")
            atleticUpdate()
        case 1:
            defaults.set(AtleticSkill.selectedSegmentIndex, forKey: "AtleticSkill")
            atleticSkillValue = 2
            defaults.set(atleticSkillValue, forKey: "atleticSkillValue")
            atleticUpdate()
        case 2:
            defaults.set(AtleticSkill.selectedSegmentIndex, forKey: "AtleticSkill")
            atleticSkillValue = 4
            defaults.set(atleticSkillValue, forKey: "atleticSkillValue")
            atleticUpdate()
        default:
            print("AtleticSelectorError")
        }
    }
         //Общий бонус атлетики
    @IBOutlet weak var AtleticBonus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Загрузка бонуса силы
        bonusSila.text = defaults.string(forKey: "bonusSila") ?? "0"
        
        //Загрузка значения силы в степпер и в лейбл при загрузке экрана
        SilaStepper.value = Double(defaults.string(forKey: "silaValue") ?? "10")!
        silaLabel.text = String(Int(SilaStepper.value))
        
        //Загрузки подстатов
           //Атлетика
               //Загрузка селектора мастерства
        AtleticSkill.selectedSegmentIndex = defaults.integer(forKey: "AtleticSkill")
               //Загрузка общего бонуса атлетики
        AtleticBonus.text = defaults.string(forKey: "AtleticBonus.text") ?? "0"
        atleticSkillValue = defaults.integer(forKey: "atleticSkillValue")
        
                
        // Do any additional setup after loading the view.
    }
    
    //Функции общего бонуса
        //Атлетика
    func atleticUpdate() {
        AtleticBonus.text = "\(Int(bonusSila.text!)! + atleticSkillValue)"
        defaults.set(AtleticBonus.text, forKey: "AtleticBonus.text")
    }
    
    //Обновление всех вторичных статов
    func secondaryStatUpdate() {
        atleticUpdate()
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
