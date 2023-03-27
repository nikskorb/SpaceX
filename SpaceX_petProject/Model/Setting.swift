//
//  Setting.swift
//  SpaceX_petProject
//
//  Created by Larry Livingston on 25.03.2023.
//
enum Unit {
    case meter
    case feet
    case kilogramm
    case pound
    
    var name: String {
        switch self {
        case .feet:
            return "ft"
        case .meter:
            return "m"
        case .kilogramm:
            return "kg"
        case .pound:
            return "lb"
        }
    }
}


enum SettingType: Codable {
    case diameter
    case weight
    case usefulLoad
    case height
    
    var name: String {
        switch self {
        case .height:
            return "Высота"
        case .diameter:
            return "Диаметр"
        case .usefulLoad:
            return "Полезная нагрузка"
        case .weight:
            return "Масса"
        }
    }
    var units: [Unit] {
        switch self {
        case .height, .diameter:
            return [.meter, .feet]
        case .weight, .usefulLoad:
            return [.kilogramm, .pound]
        }
    }
}

struct Setting: Codable {
    let type: SettingType
    let selectedIndex: Int
}

extension Setting: Hashable {
    
}
