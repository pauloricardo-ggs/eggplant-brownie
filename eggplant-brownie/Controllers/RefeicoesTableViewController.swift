//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Paulo Ricardo on 08/12/22.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate{
    var refeicoes = [Refeicao(nome: "Macarrao", felicidade: 4),
                     Refeicao(nome: "Arroz", felicidade: 2),
                     Refeicao(nome: "Pizza", felicidade: 5)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    func adicionar(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .ended { return }
        let celula = gesture.view as! UITableViewCell
        guard let indexPath = tableView.indexPath(for: celula) else { return }
        let refeicao = refeicoes[indexPath.row]
        
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        let botaoOk = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(botaoOk)
        present(alerta, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar"{
            if let adicionarRefeicaoViewController = segue.destination as? AdicionarRefeicaoViewController{
                adicionarRefeicaoViewController.delegate = self
            }
        }
    }
}
