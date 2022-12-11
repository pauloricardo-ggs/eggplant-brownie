//
//  AdicionarIgredientesViewController.swift
//  eggplant-brownie
//
//  Created by Paulo Ricardo on 10/12/22.
//

import UIKit

protocol AdicionarIgredientesDelegate{
    func adicionar(_ igrediente: Igrediente)
}

class AdicionarIgredientesViewController: UIViewController {

    // MARK: - Atributos
    
    var delegate: AdicionarIgredientesDelegate?
    
    init(delegate: AdicionarIgredientesDelegate){
        super.init(nibName: "AdicionarIgredientesViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func adicionarIgrediente(_ sender: Any) {
        
        guard let nome = nomeTextField.text, let cal = caloriasTextField.text else {return}
        
        guard let calorias = Double(cal) else {return}
        
        let igrediente = Igrediente(nome: nome, calorias: calorias)
        delegate?.adicionar(igrediente)
        navigationController?.popViewController(animated: true)
    }
    
}
