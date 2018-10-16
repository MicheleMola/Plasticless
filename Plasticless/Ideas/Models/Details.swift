//
//  Details.swift
//  Plasticless
//
//  Created by Antonio Biondi on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

enum Category {
    case creativity
    case suggestion
}

struct Idea {
    let image: UIImage
    let title: String
    let description: String
    let steps: String
    let category: Category
}
