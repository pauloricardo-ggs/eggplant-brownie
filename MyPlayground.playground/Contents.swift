import UIKit

// -------------------------------------------------------------- comentar a linha selecionada: ⌘/


// -------------------------------------------------------------- funções
func Imprimir(_ nome: String, _ endereco: String){
    print("Nome: \(nome)\nEndereco: \(endereco)")
}

Imprimir("Judith", "Aracaju")


// -------------------------------------------------------------- array e laço for
let calorias = [50.5, 100, 300, 500]

print("\nPrimeira forma de escrever o for")
for i in 0...3 {
    print(calorias[i])
}

print("\nSegunda forma de escrever o for")
for i in 0...calorias.count-1 {
    print(calorias[i])
}

print("\nTerceira forma de escrever o for")
for caloria in calorias{
    print(caloria)
}

print("\nTotal de calorias")
func SomarCalorias(_ calorias: Array<Double>){
    var caloriasTotais: Double = 0
    
    for caloria in calorias{
        caloriasTotais += caloria
    }
    
    print("\(caloriasTotais)\n")
}

SomarCalorias(calorias)


// -------------------------------------------------------------- classe
class Refeicao {
    var nome: String?
    var felicidade: String?
}

let refeicao = Refeicao()
refeicao.nome = "Macarrão"

// Cuidado => forced unwrap
if refeicao.nome != nil{
    print(refeicao.nome!)
}

// Boa prática para extrair valores opcionais
if let nome = refeicao.nome{
    print(nome)
}

// Guard let
func ExibeNomeDaRefeicao(){
    if let nome = refeicao.nome{
        print(nome)
    }
    
    guard let nome = refeicao.nome else {
        return
    }
    
    print(nome)
}

ExibeNomeDaRefeicao()


// -------------------------------------------------------------- construtor
class Refeicao2 {
    var nome: String
    var felicidade: String
    
    init (_ nome: String, _ felicidade: String){
        self.nome = nome
        self.felicidade = felicidade
    }
}

let refeicao2 = Refeicao2("Brigadeiro", "5")
