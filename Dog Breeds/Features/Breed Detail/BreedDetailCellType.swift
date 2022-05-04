//
//  BreedDetailCellType.swift
//  Dog Breeds
//
//  Created by mobdev on 02-05-22.
//

import Foundation

enum BreedDetailCellType: CaseIterable {
    case title
    case image
    case description
    
    static let `default` = [title, image, description]
}
