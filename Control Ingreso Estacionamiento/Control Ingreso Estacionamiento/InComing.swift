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
    @State private var isPresentingConfirm: Bool = false
    @State private var selectedItemId: String?
    @State private var confirmationShown = false
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

                VStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(UIColor.systemGray4))
                        .cornerRadius(30)
                        .frame(height: UIScreen.main.bounds.height * 1/8)
                        .overlay {
                            HStack(alignment: .center, content: {
                                Image(systemName: "magnifyingglass").padding()
                                TextField("Ingrese la placa", text: $licensePlate)
                                    .tag("search")
                                    .padding()
                                    .textFieldStyle(DefaultTextFieldStyle())
                                    .foregroundColor(.black).bold()
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
                                                    Button(role: .destructive)
                                                    { selectedItemId = detail._id
                                                      isPresentingConfirm = true } label: {
                                                        Label("Eliminar", systemImage: "trash")
                                                    }
                                                }
                                                .confirmationDialog("Confirmación",
                                                  isPresented: $isPresentingConfirm)
                                                {
                                                  Button("Eliminar registro", role: .destructive) {
                                                    delete()
                                                   }
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
    
    func delete() {
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
        request.httpMethod = "DELETE"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error al realizar la solicitud de eliminación: \(error.localizedDescription)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 204 {
                    // La eliminación fue exitosa
                    print("Elemento eliminado con éxito")
                    fetchData()
                    // Aquí puedes actualizar la lista de detalles después de la eliminación si es necesario
                } else {
                    print("Error al eliminar el elemento. Código de estado: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }
}

struct InComing_Previews: PreviewProvider {
    static var previews: some View {
        InComing()
    }
}
