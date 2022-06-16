//
//  HelloViewModel.swift
//  HelloMVVM
//
//  Created by Nathalia Cardoso on 13/06/22.
//

import Foundation

class HelloViewModel {
    
    var mvvmModel: HelloModel {
        didSet {
            sendEntityToView()
        }
    }
    
    public var controller: HelloViewController?

    var personEntity: PersonEntity!
    
    init(model: HelloModel) {
        self.mvvmModel = model
        
        personEntity = parsePersonModelToEntity()
    }
    
    func update(model: HelloModel) {
        mvvmModel = model
    }
    
    func updateFirstName(to name: String) {
        mvvmModel.updateFirstName(to: name)
    }
    
    func sendEntityToView() {
        personEntity = parsePersonModelToEntity()
        controller?.updateView(entity: personEntity)
    }
    
    private func parsePersonModelToEntity() -> PersonEntity {
        return PersonEntity(
            fullName: "\(mvvmModel.firstName) \(mvvmModel.secondName)",
            isBrazilian: mvvmModel.country == "Brasil" ? true : false,
            isOfAge: mvvmModel.age >= 18 ? true : false
        )
    }
}
