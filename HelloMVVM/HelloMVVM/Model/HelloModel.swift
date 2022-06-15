//
//  HelloModel.swift
//  HelloMVVM
//
//  Created by Nathalia Cardoso on 13/06/22.
//

public struct HelloModel: Codable {
    var firstName: String
    var secondName: String
    var country: String
    var age: Int
}

// MARK: Mockar dados para consumo
extension HelloModel {
  static let mockedPerson = HelloModel(
    firstName: "Fulado",
    secondName: "Da silva",
    country: "Brasil",
    age: 25
  )
}

// MARK: Pegar dados do model
extension HelloModel {
    func getData() -> HelloModel {
        return self
    }
}

// MARK: Fazer mudanças no model
extension HelloModel {
    mutating func updateFirstName(to name: String) {
        self.firstName = name
    }
}
