//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Paulo Ricardo on 08/12/22.
//

import UIKit

class Refeicao: NSObject {
    let nome: String
    let felicidade: Int
    var igredientes: Array<Igrediente>
    
    init(nome: String, felicidade: Int, igredientes: [Igrediente] = []){
        self.nome = nome
        self.felicidade = felicidade
        self.igredientes = igredientes
    }
    
    func ObterTotalDeCalorias() -> Double{
        var totalDeCalorias = 0.0
        
        for igrediente in igredientes{
            totalDeCalorias += igrediente.calorias
        }
        
        return totalDeCalorias
    }
    
    func detalhes() -> String {
        var mensagem = "Felicidade: \(felicidade)"
        for igrediente in igredientes {
            mensagem += "\n \(igrediente.nome) - calorias: \(igrediente.calorias)"
        }
        return mensagem
    }
}
