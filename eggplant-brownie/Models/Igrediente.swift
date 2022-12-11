//
//  Item.swift
//  eggplant-brownie
//
//  Created by Paulo Ricardo on 08/12/22.
//

import UIKit

class Igrediente: NSObject {
    let nome: String
    let calorias: Double
    
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }
}
