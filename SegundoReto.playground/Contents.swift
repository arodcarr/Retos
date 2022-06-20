import UIKit
import Foundation

enum Sexo {
    case masculino
    case femenino
    case otro
}

class Person {
    let nombre: String
    let apellidoPaterno: String
    let apellidoMaterno: String
    let fechaNacimiento: String
    let numeroDocumento: String
    let sexo: Sexo
    let correo: String
    let cantidadHermanos: Int
    var usuario: String? = nil
    
    init(nombre: String,
         apellidoPaterno: String,
         apellidoMaterno: String,
         fechaNacimiento: String,
         numeroDocumento: String,
         sexo: Sexo,
         correo: String,
         cantidadHermanos: Int) {
        self.nombre = nombre
        self.apellidoPaterno = apellidoPaterno
        self.apellidoMaterno = apellidoMaterno
        self.fechaNacimiento = fechaNacimiento
        self.numeroDocumento = numeroDocumento
        self.sexo = sexo
        self.correo = correo
        self.cantidadHermanos = cantidadHermanos
        
        if let username = correo.split(separator: "@").first {
            self.usuario = "\(username)"
        }
    }

}

let person1 = Person(nombre: "Carlos José",
                     apellidoPaterno: "Robles",
                     apellidoMaterno: "Gomes",
                     fechaNacimiento: "06/08/1995",
                     numeroDocumento: "78451245",
                     sexo: .masculino,
                     correo: "carlos.roblesg@hotmail.com",
                     cantidadHermanos: 2)

let person2 = Person(nombre: "MIGUEL ANGEL",
                     apellidoPaterno: "QUISPE",
                     apellidoMaterno: "OTERO",
                     fechaNacimiento: "28/12/1995",
                     numeroDocumento: "79451654",
                     sexo: .masculino,
                     correo: "miguel.anguel@gmail.com",
                     cantidadHermanos: 0)

let person3 = Person(nombre: "KARLA ALEXANDRA",
                     apellidoPaterno: "FLORES",
                     apellidoMaterno: "ROSAS",
                     fechaNacimiento: "15/02/1997",
                     numeroDocumento: "77485812",
                     sexo: .femenino,
                     correo: "Karla.alexandra@hotmail.com",
                     cantidadHermanos: 1)

let person4 = Person(nombre: "NICOLAS",
                     apellidoPaterno: "QUISPE",
                     apellidoMaterno: "ZEBALLOS",
                     fechaNacimiento: "08/10/1990",
                     numeroDocumento: "71748552",
                     sexo: .masculino,
                     correo: "nicolas123@gmail.com",
                     cantidadHermanos: 1)
let person5 = Person(nombre: "PEDRO ANDRE",
                     apellidoPaterno: "PICASSO",
                     apellidoMaterno: "BETANCUR",
                     fechaNacimiento: "17/05/1994",
                     numeroDocumento: "74823157",
                     sexo: .masculino,
                     correo: "pedroandrepicasso@gmail.com",
                     cantidadHermanos: 2)

let person6 = Person(nombre: "FABIOLA MARIA",
                     apellidoPaterno: "PALACIO",
                     apellidoMaterno: "VEGA",
                     fechaNacimiento: "02/02/1992",
                     numeroDocumento: "76758254",
                     sexo: .femenino,
                     correo: "fabi@hotmail.com",
                     cantidadHermanos: 0)


class Operaciones {
    
    let listaPersona: [Person]
    
    init(listaPersona: [Person]) {
        self.listaPersona = listaPersona
    }
    
    
    func getElementsFromDateString(date: String) -> (day: Int, month: Int, year: Int) {
        let fechas = date.split(separator: "/")
        let day = Int(fechas[0])
        let month = Int(fechas[1])
        let year = Int(fechas[2])
        guard let _day = day, let _month = month, let _year = year else {
            return (0, 0, 0)
        }
        return (_day, _month, _year)
    }
    
    func getLista() -> [Person] {
        return listaPersona
    }
    
    func getMayor() -> Person? {
        guard var personaMayor = listaPersona.first else {
            return nil
        }
        for persona in listaPersona {
            let fechaMayor = getElementsFromDateString(date: personaMayor.fechaNacimiento)
            let fechaActual = getElementsFromDateString(date: persona.fechaNacimiento)
            if fechaActual.year < fechaMayor.year {
                personaMayor = persona
            }
        }
        return personaMayor
    }
    
    func getMenor() -> Person? {
        guard var personaMenor = listaPersona.first else {
            return nil
        }
        for persona in listaPersona {
            let fechaMenor = getElementsFromDateString(date: personaMenor.fechaNacimiento)
            let fechaActual = getElementsFromDateString(date: persona.fechaNacimiento)
            if fechaActual.year > fechaMenor.year {
                personaMenor = persona
            }
        }
        return personaMenor
    }
    
    func listarGeneros() -> (masculino: [Person], femenino: [Person], otros:[Person]) {
        
        var listaMasculino: [Person]  = []
        var listaFemenino: [Person]  = []
        var listaOtros: [Person]  = []
        
        for persona in listaPersona {
            if persona.sexo == .masculino {
                listaMasculino.append(persona)
            } else if persona.sexo == .femenino {
                listaFemenino.append(persona)
            } else {
                listaOtros.append(persona)
            }
        }
        
        return (listaMasculino, listaFemenino, listaOtros)
    }
    
    func listaMayorDosHermanos() -> [Person] {
        var listaDosHermanos: [Person]  = []
        for persona in listaPersona {
            if persona.cantidadHermanos >= 2 {
                listaDosHermanos.append(persona)
            }
        }
        return listaDosHermanos
    }
    
}


let listaPersonas = [person1, person2, person3, person4, person5, person6]
let operaciones = Operaciones(listaPersona: listaPersonas)

if let personaMayor = operaciones.getMayor() {
    print("Persona Mayor: " + personaMayor.nombre + " " + personaMayor.fechaNacimiento)
}
if let personaMenor = operaciones.getMenor() {
    print("Persona Menor: " + personaMenor.nombre + " " + personaMenor.fechaNacimiento)
}
print("Cantidad de Mujeres: \(operaciones.listarGeneros().femenino.count)")
print("Cantidad de Hombres: \(operaciones.listarGeneros().masculino.count)")
print("Cantidad de Otros: \(operaciones.listarGeneros().otros.count)")
print("************* Lista de Personas con más de 2 Hermanos************* ")
var listaDosHermanos = operaciones.listaMayorDosHermanos()
for hermano in listaDosHermanos {
    print("\(hermano.nombre) tiene dos Hermanos")
}
print("************* Impriendo Lista de Personas con el Formato Planteado *************")

for persona in operaciones.getLista() {
    guard let primeraLetra = persona.apellidoMaterno.first else {
        break
    }
    print("\(persona.nombre.capitalized) \(persona.apellidoPaterno.capitalized) \(primeraLetra)")
}

print("************* Imprimiendo la lista de usuarios *************")

for persona in operaciones.getLista() {
    print(persona.usuario ?? "")
}
