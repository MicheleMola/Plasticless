//
//  Idea.swift
//  Plasticless
//
//  Created by Antonio Biondi on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.

import UIKit

enum Category: String, Codable {
    case Creativity
    case Suggestion
}

struct Idea: Codable {
    let imageURL: URL
    let title: String
    let description: String
    let category: Category
}
