@_private(sourceFile: "InComing.swift") import Control_Ingreso_Estacionamiento
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension InComing_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/sergiosanchezroldan/Desktop/CUCEI/8vo Semestre/Proyecto/Control Ingreso Estacionamiento/Control Ingreso Estacionamiento/InComing.swift", line: 201)
        InComing()
    
#sourceLocation()
    }
}

extension InComing {
    @_dynamicReplacement(for: delete()) private func __preview__delete() {
        #sourceLocation(file: "/Users/sergiosanchezroldan/Desktop/CUCEI/8vo Semestre/Proyecto/Control Ingreso Estacionamiento/Control Ingreso Estacionamiento/InComing.swift", line: 164)
        // Utiliza el _id del elemento seleccionado en la función de eliminación
        guard let id = selectedItemId else {
            return
        }

        let deleteURLString = "http://127.0.0.1:3000/parking/entraceRegister/delete?id=\(id)"
        guard let deleteURL = URL(string: deleteURLString) else {
            print("URL no válida")
            return
        }

        var request = URLRequest(url: deleteURL)
        request.httpMethod = __designTimeString("#11311.[2].[15].[4].[0]", fallback: "DELETE")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error al realizar la solicitud de eliminación: \(error.localizedDescription)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 204 {
                    // La eliminación fue exitosa
                    print(__designTimeString("#11311.[2].[15].[5].modifier[0].arg[1].value.[1].[0].[0].[0].[0].arg[0].value", fallback: "Elemento eliminado con éxito"))
                    fetchData()

                    // Aquí puedes actualizar la lista de detalles después de la eliminación si es necesario
                } else {
                    print("Error al eliminar el elemento. Código de estado: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    
#sourceLocation()
    }
}

extension InComing {
    @_dynamicReplacement(for: prettyResponse(key:value:)) private func __preview__prettyResponse(key: String, value: String)-> some View {
        #sourceLocation(file: "/Users/sergiosanchezroldan/Desktop/CUCEI/8vo Semestre/Proyecto/Control Ingreso Estacionamiento/Control Ingreso Estacionamiento/InComing.swift", line: 148)
        return VStack(){
            HStack{
                Text("\(key)")
                    .bold()
                    Spacer()
                Text("\(value)")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            Divider()
        }
    
#sourceLocation()
    }
}

extension InComing {
    @_dynamicReplacement(for: fetchData()) private func __preview__fetchData() {
        #sourceLocation(file: "/Users/sergiosanchezroldan/Desktop/CUCEI/8vo Semestre/Proyecto/Control Ingreso Estacionamiento/Control Ingreso Estacionamiento/InComing.swift", line: 125)
        guard let url = URL(string: "http://127.0.0.1:3000/parking/plateRecord?plate=\(licensePlate)") else {
            return
        }
        print(url);
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error en la solicitud: \(error?.localizedDescription ?? "Desconocido")")
                return
            }

            do {
                let decoder = JSONDecoder()
                let carDetails = try decoder.decode([CarDetails].self, from: data)
                DispatchQueue.main.async {
                    self.carDetails = carDetails
                }
            } catch {
                print(String(describing: error))
            }
        }.resume()
    
#sourceLocation()
    }
}

extension InComing {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/sergiosanchezroldan/Desktop/CUCEI/8vo Semestre/Proyecto/Control Ingreso Estacionamiento/Control Ingreso Estacionamiento/InComing.swift", line: 30)
        NavigationStack {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()

                VStack {
                    RoundedRectangle(cornerRadius: __designTimeInteger("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: 25))
                        .fill(Color(UIColor.systemGray4))
                        .cornerRadius(__designTimeInteger("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].modifier[1].arg[0].value", fallback: 30))
                        .frame(height: UIScreen.main.bounds.height * __designTimeInteger("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].modifier[2].arg[0].value.[0]", fallback: 1)/__designTimeInteger("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].modifier[2].arg[0].value.[1]", fallback: 8))
                        .overlay {
                            HStack(alignment: .center, content: {
                                Image(systemName: __designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].modifier[3].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "magnifyingglass")).padding()
                                TextField(__designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].modifier[3].arg[0].value.[0].arg[1].value.[1].arg[0].value", fallback: "Ingrese la placa"), text: $licensePlate)
                                    .tag(__designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].modifier[3].arg[0].value.[0].arg[1].value.[1].modifier[0].arg[0].value", fallback: "search"))
                                    .padding()
                                    .textFieldStyle(DefaultTextFieldStyle())
                                    .foregroundColor(.black).bold()
                                    .onTapGesture {
                                        withAnimation {
                                            isTextFieldSelected = __designTimeBoolean("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].modifier[3].arg[0].value.[0].arg[1].value.[1].modifier[5].arg[0].value.[0].arg[0].value.[0].[0]", fallback: true)
                                        }
                                    }
                                    .onSubmit {
                                        fetchData()
                                    }
                            }).disableAutocorrection(__designTimeBoolean("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].modifier[3].arg[0].value.[0].modifier[0].arg[0].value", fallback: true))

                        }
                        .padding()
                    // Cuadros de detalles del carro
                    Group {
                        if !carDetails.isEmpty, !isTextFieldFocused {
                            List(carDetails) { detail in
                                VStack {
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/__designTimeFloat("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: 25.0)/*@END_MENU_TOKEN@*/)
                                        .fill(Color(UIColor.systemBackground))
                                        .frame(height: UIScreen.main.bounds.height * __designTimeInteger("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[1].arg[0].value.[0]", fallback: 1)/__designTimeInteger("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[1].arg[0].value.[1]", fallback: 4))
                                        .overlay{
                                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                                                VStack(alignment: .leading, content: {
                                                    prettyResponse(key:__designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].arg[0].value", fallback: "Nombre"),value:"\(detail.name)")
                                                    prettyResponse(key:__designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value.[0].arg[1].value.[0].arg[1].value.[1].arg[0].value", fallback: "Placa"),value:"\(detail.plate)")
                                                    prettyResponse(key:__designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value.[0].arg[1].value.[0].arg[1].value.[2].arg[0].value", fallback: "Color"),value:"\(detail.color)")
                                                    prettyResponse(key:__designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value.[0].arg[1].value.[0].arg[1].value.[3].arg[0].value", fallback: "Marca"),value:"\(detail.brand)")
                                                    prettyResponse(key:__designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value.[0].arg[1].value.[0].arg[1].value.[4].arg[0].value", fallback: "Puerta"),value:"\(detail.doorNum)")
                                                    prettyResponse(key:__designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value.[0].arg[1].value.[0].arg[1].value.[5].arg[0].value", fallback: "Fecha"),value:"\(detail.arrivingTimeStamp)")
                                                })
                                                .textFieldStyle(DefaultTextFieldStyle())
                                                Menu(__designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value.[0].arg[1].value.[1].arg[0].value", fallback: "...")){
                                                    NavigationLink(destination: {
                                                        UpdateForm(carDetails: detail)
                                                    },label: {
                                                        Label(__designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value.[0].arg[1].value.[1].arg[1].value.[0].arg[1].value.[0].arg[0].value", fallback: "Actualizar"), systemImage: __designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value.[0].arg[1].value.[1].arg[1].value.[0].arg[1].value.[0].arg[1].value", fallback: "folder"))
                                                        })
                                                    Button(role: .destructive)
                                                    { selectedItemId = detail._id
                                                      isPresentingConfirm = __designTimeBoolean("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value.[0].arg[1].value.[1].arg[1].value.[1].arg[1].value.[1].[0]", fallback: true) } label: {
                                                        Label(__designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value.[0].arg[1].value.[1].arg[1].value.[1].arg[2].value.[0].arg[0].value", fallback: "Eliminar"), systemImage: __designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value.[0].arg[1].value.[1].arg[1].value.[1].arg[2].value.[0].arg[1].value", fallback: "trash"))
                                                    }
                                                }
                                                .confirmationDialog(__designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value.[0].arg[1].value.[1].modifier[0].arg[0].value", fallback: "Confirmación"),
                                                  isPresented: $isPresentingConfirm)
                                                {
                                                  Button(__designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value.[0].arg[1].value.[1].modifier[0].arg[2].value.[0].arg[0].value", fallback: "Eliminar registro"), role: .destructive) {
                                                    delete()
                                                   }
                                                 }
                                            })

                                        }
                                }
                                
                            }
                            .listStyle(.sidebar)
                            .listRowSpacing(__designTimeInteger("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0].[0].modifier[1].arg[0].value", fallback: 10))
                            .background(Color(UIColor.systemBackground))
                        } else {
                            VStack(alignment: .center, spacing: __designTimeInteger("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[1].[0].arg[1].value", fallback: 10)) {
                                Text(__designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[1].[0].arg[2].value.[0].arg[0].value", fallback: "Consulta de registros"))
                                    .font(.headline)
                                    .fontWeight(.bold)
                                
                                Text(__designTimeString("#11311.[2].[12].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[1].[0].arg[2].value.[1].arg[0].value", fallback: "Ingresa la placa en el buscador y podras actualizar o eliminar los registros relacionados."))
                                    .font(.body)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
        }
    
#sourceLocation()
    }
}

import struct Control_Ingreso_Estacionamiento.CarDetails
import struct Control_Ingreso_Estacionamiento.InComing
import struct Control_Ingreso_Estacionamiento.InComing_Previews

