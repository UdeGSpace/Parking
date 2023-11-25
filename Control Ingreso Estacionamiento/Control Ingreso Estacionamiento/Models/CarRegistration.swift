//
//  CarRegistration.swift
//  Control Ingreso Estacionamiento
//
//  Created by Sergio Sanchez Roldan on 24/11/23.
//

import Foundation

struct CarRegistration: Encodable {
    let name: String
    let brand: String
    let color: String
    let plate: String
    let arrivingTimeStamp: String
    let doorNum: [String]
    let module: String
}
