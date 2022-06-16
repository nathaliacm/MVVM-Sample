//
//  HelloMVVMTests.swift
//  HelloMVVMTests
//
//  Created by Thiago Henrique on 15/06/22.
//

import XCTest
@testable import HelloMVVM

class HelloMVVMViewModelTests: XCTestCase {
    
    var viewModel : HelloViewModel!
    var model : HelloModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        model = HelloModel(firstName: "Pedro", secondName: "Bezerra", country: "Brasil", age: 20)
        viewModel = HelloViewModel(model: model)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ChangeFirstName_shouldBe_Thiago() {
        //given
        let newName = "Thiago"

        //when
        viewModel.updateFirstName(to: newName)
        
        //then
        XCTAssertEqual(viewModel.mvvmModel.firstName, newName)
    }

}
