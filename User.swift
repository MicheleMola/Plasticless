//
//  Profile.swift
//  Plasticless
//
//  Created by Paolo Di Grazia on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

// una struttura con tutti gli elementi neccessari al profilo (tutte le proprietà)
struct User {
    let image: UIImage
    let fullName: String
    let address: String
    let badges: [Badge] // è un Array di badges, si può indicare anche come let badges: Array<Badge>. Adesso è indicato con due parentesi quadre
}


