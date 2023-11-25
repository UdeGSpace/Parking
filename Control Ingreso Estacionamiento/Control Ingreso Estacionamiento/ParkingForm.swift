//
//  ParkingForm.swift
//  Control Ingreso Estacionamiento
//
//  Created by Sergio Sanchez Roldan on 22/11/23.
//

import SwiftUI
 
struct ParkingForm: View {
    @State private var selectedDoors: Set<Door> = []
    @State private var name = ""
    @State private var brand = ""
    @State private var color = ""
    @State private var plate = ""
    @State private var arrivingTime = Date()
    @State private var module = ""
    @State private var showAlert = false
    @State private var showEmptyFieldsAlert = false

    var body: some View {
        NavigationStack{
            VStack(alignment: .center, spacing: 1) {
                Form {
                    Section(header: Text("Registro de Estacionamiento")) {
                        Image(systemName: "parkingsign.circle")
                            .font(.system(size: 90))
                            .foregroundColor(.yellow)
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(20)
                        
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
                        MultiSelector(
                            label: Text("Puerta:"),
                            options: copyData(),
                            optionToString:  { "\($0.name) \($0.description)" },
                            selected: $selectedDoors
                        )

                        Button(action: {
                            if fieldsAreFilled() {
                                registerCar()
                                showAlert = true
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
                                    name = ""
                                    brand = ""
                                    color = ""
                                    plate = ""
                                    arrivingTime = Date()
                                    module = ""
                                }
                            )
                        }
                    }
                    
                }
            }
        }
    }

    private func fieldsAreFilled() -> Bool {
        return !name.isEmpty && !plate.isEmpty && !brand.isEmpty && !color.isEmpty
    }

    private func registerCar() {
        let carData = CarRegistration(
            name: name,
            brand: brand,
            color: color,
            plate: plate,
            arrivingTimeStamp: "\(arrivingTime)",
            doorNum: parseDoorsToStringArray(selectedDoors: selectedDoors),
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

