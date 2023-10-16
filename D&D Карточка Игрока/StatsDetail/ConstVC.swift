//
//  SilaVC.swift
//  D&D Карточка Игрока
//
//  Created by Федор Шашков on 03.06.2023.
//

import UIKit

class ConstVC: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var constLabel: UILabel!
    
    @IBOutlet weak var bonusConst: UILabel!
    
    @IBOutlet weak var ConstStepper: UIStepper!
    //Сохранение значения стойкости после изменения и присвоение значения лейблу с переводом в инт и далее в стринг
    //А так же отправка значения стойкости через notification
    @IBAction func ConstChange(_ sender: UIStepper) {
        ///defaults.set(String(Int(ConstStepper.value)), forKey: "constValue")
        charapter.constValue = String(Int(ConstStepper.value))
        constLabel.text = String(Int(ConstStepper.value))
                
        //Бонус от стойкости
        switch ConstStepper.value {
        case 1:
            bonusConst.text = "-5"
            charapter.bonusConst = bonusConst.text
            break
        case 2...3:
            bonusConst.text = "-4"
            charapter.bonusConst = bonusConst.text
            break
        case 4...5:
            bonusConst.text = "-3"
            charapter.bonusConst = bonusConst.text
            break
        case 6...7:
            bonusConst.text = "-2"
            charapter.bonusConst = bonusConst.text
            break
        case 8...9:
            bonusConst.text = "-1"
            charapter.bonusConst = bonusConst.text
            break
        case 10...11:
            bonusConst.text = "0"
            charapter.bonusConst = bonusConst.text
            break
        case 12...13:
            bonusConst.text = "+1"
            charapter.bonusConst = bonusConst.text
            break
        case 14...15:
            bonusConst.text = "+2"
            charapter.bonusConst = bonusConst.text
            break
        case 16...17:
            bonusConst.text = "+3"
            charapter.bonusConst = bonusConst.text
            break
        case 18...19:
            bonusConst.text = "+4"
            charapter.bonusConst = bonusConst.text
            break
        case 20...21:
            bonusConst.text = "+5"
            charapter.bonusConst = bonusConst.text
            break
        case 22...23:
            bonusConst.text = "+6"
            charapter.bonusConst = bonusConst.text
            break
        case 24...25:
            bonusConst.text = "+7"
            charapter.bonusConst = bonusConst.text
            break
        case 26...27:
            bonusConst.text = "+8"
            charapter.bonusConst = bonusConst.text
            break
        case 28...29:
            bonusConst.text = "+9"
            charapter.bonusConst = bonusConst.text
            break
        case 30:
            bonusConst.text = "+10"
            charapter.bonusConst = bonusConst.text
            break
        default:
            print("constStepperError")
        }
        NotificationCenter.default.post(name: MainScreenVC.deliveryConstValue, object: nil, userInfo: ["const": constLabel.text!,"bonusConst": bonusConst.text!])
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Загрузка бонуса стойкости
        ///bonusConst.text = defaults.string(forKey: "bonusConst") ?? "0"
        bonusConst.text = charapter.bonusConst
        
        //Загрузка значения стойкости в степпер и в лейбл при загрузке экрана
        ///ConstStepper.value = Double(defaults.string(forKey: "constValue") ?? "10")!
        ConstStepper.value = Double(charapter.constValue!)!
        constLabel.text = String(Int(ConstStepper.value))
        
                
        // Do any additional setup after loading the view.
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
