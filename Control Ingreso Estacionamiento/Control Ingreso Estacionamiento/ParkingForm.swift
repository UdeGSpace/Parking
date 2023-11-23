//
//  ParkingForm.swift
//  Control Ingreso Estacionamiento
//
//  Created by Sergio Sanchez Roldan on 22/11/23.
//

import SwiftUI
import Foundation

struct CarRegistration: Encodable {
    let name: String
    let brand: String
    let color: String
    let plate: String
    let arrivingTimeStamp: String
    let doorNum: Int
    let module: String
}

struct ParkingForm: View {
    @State private var name = ""
    @State private var brand = ""
    @State private var color = ""
    @State private var plate = ""
    @State private var arrivingTime = Date()
    @State private var doorNum = 1
    @State private var module = ""

    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Registro de Estacionamiento")) {
                    TextField("Nombre: ", text: $name)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Placas: ", text: $plate)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Marca: ", text: $brand)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Color: ", text: $color)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Modulo: ", text: $module)
                        .textFieldStyle(DefaultTextFieldStyle())
                    DatePicker(selection: $arrivingTime, label: { Text("Fecha") })
                        .datePickerStyle(.compact)
                    Picker("Puerta:", selection: $doorNum) {
                        Text("P1: Olimpica").tag(1)
                        Text("P2: Boulevard").tag(2)
                        Text("P3: Revolución").tag(3)
                    }
                    Button(action: {
                        print("Fecha seleccionada: \(arrivingTime)")
                        registerCar()
                    }) {
                        Text("Registrar")
                    }
                }
            }
        }
    }

    private func registerCar() {
        // Crear una instancia del objeto CarRegistration con los datos del formulario
        let carData = CarRegistration(
            name: name,
            brand: brand,
            color: color,
            plate: plate,
            arrivingTimeStamp: "\(arrivingTime)",
            doorNum: doorNum,
            module: module
        )

        // Crear la URL a la que enviar la solicitud
        guard let url = URL(string: "http://127.0.0.1:3000/parking/register") else {
            return
        }

        // Crear la solicitud URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Convertir el objeto CarRegistration a datos JSON
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(carData)
            request.httpBody = jsonData
        } catch {
            print("Error al codificar los datos como JSON: \(error.localizedDescription)")
            return
        }

        // Realizar la solicitud
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error en la solicitud: \(error.localizedDescription)")
                return
            }

            if let data = data {
                // Puedes procesar la respuesta aquí si es necesario
                let responseString = String(data: data, encoding: .utf8)
                print("Respuesta del servidor: \(responseString ?? "")")
            }
        }

        // Iniciar la tarea
        task.resume()
    }
}

struct ParkingForm_Previews: PreviewProvider {
    static var previews: some View {
        ParkingForm()
    }
}
