//
//  jsonDecoder.swift
//  Control Ingreso Estacionamiento
//
//  Created by Sergio Sanchez Roldan on 24/11/23.
//

import Foundation

// Cambios en las estructuras
struct Door: Codable, Hashable, Identifiable {
    var id = UUID()
    var name: String
    var description: String
}

struct sample: Codable {
    let doors: [Door]
}
struct Door1: Codable {
    var name: String
    var description: String
}

struct DoorData: Codable {
    var door: [Door1]
}

func copyData()-> [Door] {
    if let path = Bundle.main.path(forResource: "door", ofType: "json") {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            let doorData = try decoder.decode(DoorData.self, from: data)
            
            // Copia los datos a la nueva estructura
            var newDoors: [Door] = []
            for door1 in doorData.door {
                let newDoor = Door(name: door1.name, description: door1.description)
                newDoors.append(newDoor)
            }
            return newDoors
            
        } catch {
            print("Error al leer el archivo JSON: \(error)")
        }
    } else {
        print("No se encontró el archivo JSON.")
    }
    return[]
}

func parseDoorsToStringArray(selectedDoors: Set<Door>) -> [String] {
    return Array(selectedDoors).map { "\($0.name) \($0.description)" }
}


