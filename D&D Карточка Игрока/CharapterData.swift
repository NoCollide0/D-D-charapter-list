//
//  charapterClass.swift
//  D&D Карточка Игрока
//
//  Created by Федор Шашков on 02.10.2023.
//

import UIKit

let defaults = UserDefaults.standard

final class CharapterData: Codable{
    var charapterName: String? = "Имя персонажа" {
        didSet {
            saveCharapterData()
        }
    }
    
    var charapterRace: String? = "Раса" {
        didSet {
            saveCharapterData()
        }
    }
    
    var charapterClass: String? = "Класс" {
        didSet {
            saveCharapterData()
        }
    }
    var bonusSila: String? = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var silaValue: String? = "10" {
        didSet {
            saveCharapterData()
        }
    }
    
    var bonusAgility: String? = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var agilityValue: String? = "10" {
        didSet {
            saveCharapterData()
        }
    }
    
    var bonusConst: String? = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var constValue: String? = "10" {
        didSet {
            saveCharapterData()
        }
    }
    
    var bonusIntellect: String? = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var intellectValue: String? = "10" {
        didSet {
            saveCharapterData()
        }
    }
    
    var bonusWisdom: String? = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var wisdomValue: String? = "10" {
        didSet {
            saveCharapterData()
        }
    }
    
    var bonusCharisma: String? = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var charismaValue: String? = "10" {
        didSet {
            saveCharapterData()
        }
    }
    
    var initiative: Int? = 30 {
        didSet {
            saveCharapterData()
        }
    }
    
    var speed: Int? = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var armorClass: Int? = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var endAnimationPoint: Double = 0.5 {
        didSet {
            saveCharapterData()
        }
    }
    
    var maxHpLabel: String = "10" {
        didSet {
            saveCharapterData()
        }
    }
    
    var hpDiceLabel: String = "D4-D12" {
        didSet {
            saveCharapterData()
        }
    }
    var greenValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var redValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var hp: Int = 9 {
        didSet {
            saveCharapterData()
        }
    }
    
    var hpDice: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var currentHp: Float = 5.0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var startAnimationPoint: Double = 0.0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var atleticSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var atleticSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var atleticBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var acrobaticSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var acrobaticSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var handAgSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var handAgSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var stealthSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var stealthSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var acrobaticBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var handAgBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var stealthBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    var analyticSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var analyticSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var historySkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var historySkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var magicSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var magicSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var natureSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var natureSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var religionSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var religionSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var analyticBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var historyBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var magicBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var natureBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var religionBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var attentionSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var attentionSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var survivalSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var survivalSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var medicalSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var medicalSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var insightSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var insightSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var animalCareSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var animalCareSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var attentionBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var survivalBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var medicalBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var animalCareBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var insightBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var performanceSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var performanceSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var intimidationSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var intimidationSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var lieSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var lieSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var beliefSkill: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var beliefSkillValue: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var performanceBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var intimidationBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var lieBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var beliefBonusText: String = "0" {
        didSet {
            saveCharapterData()
        }
    }
    
    var equipmentData: [String] = ["1!lfds"] {
        didSet {
            saveCharapterData()
        }
    }
    
    var textFieldConterEquipment: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var spellsData: [String] = ["1!lfds"] {
        didSet {
            saveCharapterData()
        }
    }
    
    var textFieldConterSpells: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
    var attackData: [String] = ["1!lfds"] {
        didSet {
            saveCharapterData()
        }
    }
    
    var textFieldConter: Int = 0 {
        didSet {
            saveCharapterData()
        }
    }
    
}



var charapter = CharapterData()



func saveCharapterData() {
    do {
        let data = try JSONEncoder().encode(charapter)
        defaults.set(data, forKey: "charapterData")
        print("Сохранено")
    } catch {
        print("Ошибка при кодировании CharapterData: \(error.localizedDescription)")
    }
}

func loadCharapterData() {
    if let data = defaults.data(forKey: "charapterData") {
        do {
            charapter = try JSONDecoder().decode(CharapterData.self, from: data)
            print("Загружено")
        } catch {
            print("Ошибка при декодировании CharapterData: \(error.localizedDescription)")
        }
    }
}
