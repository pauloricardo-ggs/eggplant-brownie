//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Paulo Ricardo on 07/12/22.
//

import UIKit

protocol AdicionaRefeicaoDelegate{
    func adicionar(_ refeicao: Refeicao)
}

class AdicionarRefeicaoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionarIgredientesDelegate {

    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    var igredientes: [Igrediente] = [Igrediente(nome: "Molho de tomate", calorias: 15),
                                     Igrediente(nome: "Queijo", calorias: 20),
                                     Igrediente(nome: "Calabresa", calorias: 40)]
    var igredientesSelecionados: [Igrediente] = []
    
    // MARK: - IBOutlets
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet weak var igredientesTableView: UITableView!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(self.adicionarIgrediente))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
    }
    
    @objc func adicionarIgrediente(){
        let adicionarIgredientesViewController = AdicionarIgredientesViewController(delegate: self)
        navigationController?.pushViewController(adicionarIgredientesViewController, animated: true)
    }
    
    func adicionar(_ igrediente: Igrediente) {
        igredientes.append(igrediente)
        igredientesTableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return igredientes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let linhaDaTabela = indexPath.row
        let igrediente = igredientes[linhaDaTabela]
        
        celula.textLabel?.text = igrediente.nome
        
        return celula
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        let igrediente = igredientes[indexPath.row]
        
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            igredientesSelecionados.append(igrediente)
        }
        else {
            celula.accessoryType = .none
            if let posicao = igredientesSelecionados.firstIndex(of: igrediente){
                igredientesSelecionados.remove(at: posicao)
            }
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func adicionar(){
        guard let nomeDaRefeicao = nomeTextField?.text else{
            return
        }
        
        guard let felicidade = felicidadeTextField?.text, let felicidadeDaRefeicao = Int(felicidade) else{
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidadeDaRefeicao, igredientes: igredientesSelecionados)
        
        delegate?.adicionar(refeicao)
        
        navigationController?.popViewController(animated: true)
    }
}

