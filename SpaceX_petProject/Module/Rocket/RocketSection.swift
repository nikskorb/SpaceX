//
//  RocketSection.swift
//  SpaceX_petProject
//
//  Created by Larry Livingston on 04.04.2023.
//
import Foundation

enum RocketSectionType: Hashable {
    case header
    case horizontal
    case info(title: String?)
    case button
}

enum RocketItem: Hashable {
    case header(image: URL, title: String)
    case info(title: String, value: String, UUID = UUID())
    case button
}

struct RocketSection: Hashable {
    let type: RocketSectionType
    let items: [RocketItem]
    
}
