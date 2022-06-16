//
//  HelloMVVMControllerTests.swift
//  HelloMVVMTests
//
//  Created by Thiago Henrique on 15/06/22.
//

import XCTest
@testable import HelloMVVM

class HelloMVVMControllerTests: XCTestCase {
    
    var viewModel : HelloViewModel!
    var controller : HelloViewController!
    var model : HelloModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        model = HelloModel.mockedPerson
        viewModel = HelloViewModel(model: model)
        controller = HelloViewController(viewModel: viewModel)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_HandleEvent_shouldBe_Error() {
        //given
        let newFirstName : String? = nil
        
        //when
        do{
            let _ = try controller.handleEvent(firstName: newFirstName)
            XCTFail()
        } catch EventError.EmptyEvent {
            XCTAssertEqual(true, true)
        } catch {
            XCTFail()
        }
        
        //then
    }

}
