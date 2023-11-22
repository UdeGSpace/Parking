import SwiftUI

struct CarDetails: Decodable, Identifiable {
    let id = UUID() // Agrega una propiedad id
    let _id: String
    let name: String
    let doorNum: Int32
    let color: String
    let brand: String
    let plate: String
    let arrivingTimeStamp: String
    let module: String
}

struct InComing: View {
    @State private var licensePlate = ""
    @State private var carDetails: [CarDetails] = []
    @State private var leftNumber = 0
    @State private var rightNumber = 0
    @State private var isTextFieldSelected = false
    @FocusState private var isTextFieldFocused: Bool

    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isTextFieldSelected = false
                        }
                    }
                VStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(UIColor.systemGray4))
                        .cornerRadius(30)
                        .frame(height: UIScreen.main.bounds.height * 1/8)
                        .overlay {
                            HStack(alignment: .center, content: {
                                Image(systemName: "magnifyingglass").padding()
                                TextField("Ingrese la placa", text: $licensePlate)
                                    .padding()
                                    .textFieldStyle(DefaultTextFieldStyle())
                                    .foregroundColor(.black).bold()
                                    .focused($isTextFieldFocused)
                                    .onTapGesture {
                                        withAnimation {
                                            isTextFieldSelected = true
                                        }
                                    }
                                    .onSubmit {
                                        fetchData()
                                    }
                            }).disableAutocorrection(true)
                        }
                        .padding()
                    // Cuadros de detalles del carro
                    Group {
                        if !carDetails.isEmpty, !isTextFieldFocused {
                            List(carDetails) { detail in
                                VStack {
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .fill(Color(UIColor.systemBackground))
                                        .frame(height: UIScreen.main.bounds.height * 1/5)
                                        .overlay{
                                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                                                VStack(alignment: .leading, content: {
                                                    Text("Nombre: \(detail.name)")
                                                    Text("Placa: \(detail.plate)")
                                                    Text("Color: \(detail.color)")
                                                    Text("Marca: \(detail.brand)")
                                                    Text("Puerta: \(detail.doorNum)")
                                                    Text("Fecha: \(detail.arrivingTimeStamp)")
                                                })
                                                .textFieldStyle(DefaultTextFieldStyle())
                                                .foregroundColor(.black).bold()
                                                Menu("..."){
                                                    Text("Actualizar")
                                                    Text("Borrar")

                                                }
                                            })

                                        }
                                }
                                
                            }
                            .listStyle(.sidebar)
                            .listRowSpacing(10)
                            .background(Color(UIColor.systemBackground))
                        } else {
                            // Mostrar un mensaje si no hay detalles del carro disponibles
                            Text("No se encontraron detalles para la placa ingresada.")
                        }
                    }
                    .opacity(isTextFieldSelected && !isTextFieldFocused ? 1.0 : 0.0)
                }
            }
        }
    }

    func fetchData() {
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
    }
    
    func timeFormatter(_ arrivingTimeStamp: String) -> String{
        
        return String();
    }
    
    func delete(){
        return
    }
}

struct InComing_Previews: PreviewProvider {
    static var previews: some View {
        InComing()
    }
}

