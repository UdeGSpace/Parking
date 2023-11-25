//
//  UpdateForm.swift
//  Control Ingreso Estacionamiento
//
//  Created by Sergio Sanchez Roldan on 24/11/23.
//

import SwiftUI

struct UpdateCarDetails: Decodable, Identifiable {
    let id = UUID() // Agrega una propiedad id
    let _id: String
    var name: String  // Cambié 'let' a 'var' para permitir la modificación
    var doorNum: Int
    var color: String
    var brand: String
    var plate: String
    var arrivingTimeStamp: String
    var module: String
}

struct UpdateForm: View {
    @State private var updateCarDetails: UpdateCarDetails

    init(carDetails: CarDetails) {
        _updateCarDetails = State(initialValue: UpdateCarDetails(
            _id: carDetails._id,
            name: carDetails.name,
            doorNum: carDetails.doorNum,
            color: carDetails.color,
            brand: carDetails.brand,
            plate: carDetails.plate,
            arrivingTimeStamp: carDetails.arrivingTimeStamp,
            module: carDetails.module
        ))
    }
    
    @State private var showAlert = false
    @State private var showEmptyFieldsAlert = false

    var body: some View {
        // Usa la información de carDetails para construir tu interfaz de usuario
        Form {
            Section(header: Text("Actualizar Registro de Estacionamiento")) {
                Image(systemName: "car.top.door.front.left.open")
                    .font(.system(size: 90))
                    .foregroundColor(.yellow)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(20)
                TextField("Nombre: ", text: $updateCarDetails.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Placas: ", text: $updateCarDetails.plate)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Marca: ", text: $updateCarDetails.brand)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Color: ", text: $updateCarDetails.color)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Modulo: ", text: $updateCarDetails.module)
                    .textFieldStyle(DefaultTextFieldStyle())
                Picker("Puerta:", selection: $updateCarDetails.doorNum) {
                    Text("P1: Olimpica").tag(1)
                    Text("P2: Boulevard").tag(2)
                    Text("P3: Revolución").tag(3)
                }
                Button(action: {
                    if fieldsAreFilled() {
                        showAlert = true
                        update()
                    } else {
                        showEmptyFieldsAlert = true
                    }
                }) {
                    Text("Registrar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Registro completado"),
                        message: Text("El registro se ha completado con éxito."),
                        dismissButton: .default(Text("OK")) {
                            // Restablecer los campos después de que el usuario presiona OK
                            updateCarDetails.name = ""
                            updateCarDetails.brand = ""
                            updateCarDetails.color = ""
                            updateCarDetails.plate = ""
                            updateCarDetails.brand = ""
                            updateCarDetails.doorNum = 0
                            updateCarDetails.module = ""
                        }
                    )
                }
            }
        }
    }

    private func fieldsAreFilled() -> Bool {
        return !updateCarDetails.name.isEmpty && !updateCarDetails.plate.isEmpty && !updateCarDetails.brand.isEmpty && !updateCarDetails.color.isEmpty
    }
    
    func update(){
        let carData = CarRegistration(
            name: updateCarDetails.name,
            brand: updateCarDetails.brand,
            color: updateCarDetails.color,
            plate: updateCarDetails.plate,
            arrivingTimeStamp: "2023-11-30T06:04:00.000Z",
            doorNum: updateCarDetails.doorNum,
            module: updateCarDetails.module
        )
        
        let id = updateCarDetails._id
        print(id)
        let updateURLString = "http://127.0.0.1:3000/parking/entraceRegister/update?id=\(id)"
        guard let updateURL = URL(string: updateURLString) else {
            print("URL no válida")
            return
        }

        var request = URLRequest(url: updateURL)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(carData)
            request.httpBody = jsonData
        } catch {
            print("Error al codificar los datos como JSON: \(error.localizedDescription)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error al realizar la solicitud de eliminación: \(error.localizedDescription)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    // La eliminación fue exitosa
                    print("Elemento actualizado con éxito")

                    // Aquí puedes actualizar la lista de detalles después de la eliminación si es necesario
                } else {
                    print("Error al actualizar el elemento. Código de estado: \(httpResponse.statusCode)")
                }
            }
        }.resume()
        
    }

}
