//
//  PetCategories.swift
//  Pedopt
//
//  Created by Aman Giri on 2024-05-14.
//

import Foundation

enum PetCategoryModel: CaseIterable {
    case all
    case dog
    case cat
    case bird
    
    var petDefaultIcon: String {
        switch self {
        case .dog:
            return "dog"
        case .cat:
            return "cat"
        case .bird:
            return "bird"
        case .all:
            return "allPets"
        }
    }
    
    var name: String {
        switch self {
        case .dog:
            return "dog"
        case .cat:
            return "cat"
        case .bird:
            return "bird"
        case .all:
            return "all"
        }
    }
    
    var petSelectedIcon: String {
        switch self {
        case .dog:
            return "dogSelected"
        case .cat:
            return "catSelected"
        case .bird:
            return "birdSelected"
        case .all:
            return "allPetsSelected"
        }
    }
}
