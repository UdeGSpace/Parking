@_private(sourceFile: "ParkingForm.swift") import Control_Ingreso_Estacionamiento
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension ParkingForm_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/sergiosanchezroldan/Desktop/CUCEI/8vo Semestre/Proyecto/Control Ingreso Estacionamiento/Control Ingreso Estacionamiento/ParkingForm.swift", line: 149)
        ParkingForm()
    
#sourceLocation()
    }
}

extension ParkingForm {
    @_dynamicReplacement(for: registerCar()) private func __preview__registerCar() {
        #sourceLocation(file: "/Users/sergiosanchezroldan/Desktop/CUCEI/8vo Semestre/Proyecto/Control Ingreso Estacionamiento/Control Ingreso Estacionamiento/ParkingForm.swift", line: 96)
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
        request.httpMethod = __designTimeString("#3048.[1].[11].[3].[0]", fallback: "POST")
        request.setValue(__designTimeString("#3048.[1].[11].[4].modifier[0].arg[0].value", fallback: "application/json"), forHTTPHeaderField: __designTimeString("#3048.[1].[11].[4].modifier[0].arg[1].value", fallback: "Content-Type"))

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
                print("Respuesta del servidor: \(responseString ?? __designTimeString("#3048.[1].[11].[7].value.modifier[0].arg[1].value.[1].[0].[1].arg[0].value.[1].value.arg[0].value.[0]", fallback: ""))")
            }
        }

        // Iniciar la tarea
        task.resume()
    
#sourceLocation()
    }
}

extension ParkingForm {
    @_dynamicReplacement(for: fieldsAreFilled()) private func __preview__fieldsAreFilled() -> Bool {
        #sourceLocation(file: "/Users/sergiosanchezroldan/Desktop/CUCEI/8vo Semestre/Proyecto/Control Ingreso Estacionamiento/Control Ingreso Estacionamiento/ParkingForm.swift", line: 92)
        return !name.isEmpty && !plate.isEmpty && !brand.isEmpty && !color.isEmpty
    
#sourceLocation()
    }
}

extension ParkingForm {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/sergiosanchezroldan/Desktop/CUCEI/8vo Semestre/Proyecto/Control Ingreso Estacionamiento/Control Ingreso Estacionamiento/ParkingForm.swift", line: 22)
        NavigationStack{
            VStack(alignment: .center, spacing: __designTimeInteger("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[1].value", fallback: 1)) {
                Form {
                    Section(header: Text(__designTimeString("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[0].value.arg[0].value", fallback: "Registro de Estacionamiento"))) {
                        Image(systemName: __designTimeString("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "parkingsign.circle"))
                            .font(.system(size: __designTimeInteger("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 90)))
                            .foregroundColor(.yellow)
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(__designTimeInteger("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[0].modifier[4].arg[0].value", fallback: 20))
                        
                        TextField(__designTimeString("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[1].arg[0].value", fallback: "Nombre: "), text: $name)
                            .textFieldStyle(DefaultTextFieldStyle())
                        TextField(__designTimeString("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[2].arg[0].value", fallback: "Placas: "), text: $plate)
                            .textFieldStyle(DefaultTextFieldStyle())
                        TextField(__designTimeString("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[3].arg[0].value", fallback: "Marca: "), text: $brand)
                            .textFieldStyle(DefaultTextFieldStyle())
                        TextField(__designTimeString("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[4].arg[0].value", fallback: "Color: "), text: $color)
                            .textFieldStyle(DefaultTextFieldStyle())
                        TextField(__designTimeString("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[5].arg[0].value", fallback: "Modulo: "), text: $module)
                            .textFieldStyle(DefaultTextFieldStyle())
                        DatePicker(selection: $arrivingTime, label: { Text(__designTimeString("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[6].arg[1].value.[0].arg[0].value", fallback: "Fecha")) })
                            .datePickerStyle(.compact)
                        MultiSelector(
                            label: Text(__designTimeString("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[7].arg[0].value.arg[0].value", fallback: "Puerta:")),
                            options: copyData(),
                            optionToString:  { "\($0.name) \($0.description)" },
                            selected: $selectedDoors
                        )

                        Button(action: {
                            if fieldsAreFilled() {
                                registerCar()
                                showAlert = __designTimeBoolean("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[8].arg[0].value.[0].[0].[1].[0]", fallback: true)
                            } else {
                                showEmptyFieldsAlert = __designTimeBoolean("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[8].arg[0].value.[0].[1].[0].[0]", fallback: true)
                            }
                        }) {
                            Text(__designTimeString("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[8].arg[1].value.[0].arg[0].value", fallback: "Registrar"))
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(__designTimeInteger("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[8].arg[1].value.[0].modifier[5].arg[0].value", fallback: 10))
                        }
                        .padding(.horizontal)
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text(__designTimeString("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[8].modifier[1].arg[1].value.[0].arg[0].value.arg[0].value", fallback: "Registro completado")),
                                message: Text(__designTimeString("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[8].modifier[1].arg[1].value.[0].arg[1].value.arg[0].value", fallback: "El registro se ha completado con éxito.")),
                                dismissButton: .default(Text(__designTimeString("#3048.[1].[9].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[1].value.[8].modifier[1].arg[1].value.[0].arg[2].value.arg[0].value.arg[0].value", fallback: "OK"))) {
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
    
#sourceLocation()
    }
}

import struct Control_Ingreso_Estacionamiento.ParkingForm
import struct Control_Ingreso_Estacionamiento.ParkingForm_Previews

