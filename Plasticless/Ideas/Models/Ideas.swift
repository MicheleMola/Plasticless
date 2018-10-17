//
//  Idea.swift
//  Plasticless
//
//  Created by Antonio Biondi on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.

import UIKit

enum Category {
    case creativity
    case suggestion //oppure tip (?)
}

struct Idea {
    let image: UIImage //se si apre una seconda immagine poi in details va creata una nuova variabile image
    let title: String
    let description: String
    let steps: String
    let category: Category
    
}
