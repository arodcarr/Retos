import UIKit
import Foundation

enum Sexo {
    case masculino
    case femenino
    case otro
}

struct Person {
    let nombre: String
    let apellidoPaterno: String
    let apellidoMaterno: String
    let fechaNacimiento: String
    let numeroDocumento: String
    let sexo: Sexo
    let correo: String
    let cantidadHermanos: Int
    let usuario: String
}

let person1 = Person(nombre: "Carlos José",
                     apellidoPaterno: "Robles",
                     apellidoMaterno: "Gomes",
                     fechaNacimiento: "06/08/1995",
                     numeroDocumento: "78451245",
                     sexo: .masculino,
                     correo: "carlos.roblesg@hotmail.com",
                     cantidadHermanos: 2,
                     usuario:  "carlos.roblesg")

let person2 = Person(nombre: "MIGUEL ANGEL",
                     apellidoPaterno: "QUISPE",
                     apellidoMaterno: "OTERO",
                     fechaNacimiento: "28/12/1995",
                     numeroDocumento: "79451654",
                     sexo: .masculino,
                     correo: "miguel.anguel@gmail.com",
                     cantidadHermanos: 0,
                     usuario:  "miguel.anguel")

let person3 = Person(nombre: "KARLA ALEXANDRA",
                     apellidoPaterno: "FLORES",
                     apellidoMaterno: "ROSAS",
                     fechaNacimiento: "15/02/1997",
                     numeroDocumento: "77485812",
                     sexo: .femenino,
                     correo: "Karla.alexandra@hotmail.com",
                     cantidadHermanos: 1,
                     usuario:  "Karla.alexandra")

let person4 = Person(nombre: "NICOLAS",
                     apellidoPaterno: "QUISPE",
                     apellidoMaterno: "ZEBALLOS",
                     fechaNacimiento: "08/10/1990",
                     numeroDocumento: "71748552",
                     sexo: .masculino,
                     correo: "nicolas123@gmail.com",
                     cantidadHermanos: 1,
                     usuario:  "nicolas123")
let person5 = Person(nombre: "PEDRO ANDRE",
                     apellidoPaterno: "PICASSO",
                     apellidoMaterno: "BETANCUR",
                     fechaNacimiento: "17/05/1994",
                     numeroDocumento: "74823157",
                     sexo: .masculino,
                     correo: "pedroandrepicasso@gmail.com",
                     cantidadHermanos: 2,
                     usuario:  "pedroandrepicasso")

let person6 = Person(nombre: "FABIOLA MARIA",
                     apellidoPaterno: "PALACIO",
                     apellidoMaterno: "VEGA",
                     fechaNacimiento: "02/02/1992",
                     numeroDocumento: "76758254",
                     sexo: .femenino,
                     correo: "fabi@hotmail.com",
                     cantidadHermanos: 0,
                     usuario:  "fabi@hotmail")


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
    
    func getMayor() -> Person {
        var personaMayor = listaPersona.first!
        for persona in listaPersona {
            let fechaMayor = getElementsFromDateString(date: personaMayor.fechaNacimiento)
            let fechaActual = getElementsFromDateString(date: persona.fechaNacimiento)
            if fechaActual.year < fechaMayor.year {
                personaMayor = persona
            }
        }
        return personaMayor
    }
    
    func getMenor() -> Person {
        var personaMenor = listaPersona.first!
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
    
}


let listaPersonasX = [person1, person2, person3, person4, person5, person6]
let operaciones = Operaciones(listaPersona: listaPersonasX)

print("Persona Mayor: " + operaciones.getMayor().nombre + " " + operaciones.getMayor().fechaNacimiento)
print("Persona Menor: " + operaciones.getMenor().nombre + " " + operaciones.getMenor().fechaNacimiento)
print("Cantidad de Mujeres: \(operaciones.listarGeneros().femenino.count)")
print("Cantidad de Hombres: \(operaciones.listarGeneros().masculino.count)")
print("Cantidad de Otros: \(operaciones.listarGeneros().otros.count)")
