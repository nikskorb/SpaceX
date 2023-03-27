//
//  Reusable.swift
//  SpaceX_petProject
//
//  Created by Larry Livingston on 27.03.2023.
//
import UIKit
protocol Reusable {
    static var identifire: String {
        get
    }
}

extension Reusable {
    static var identifire: String {
        String(describing: Self.self)
    }
}


extension SettingTableViewCell: Reusable {
    
}

extension UICollectionViewCell: Reusable {
    
}
