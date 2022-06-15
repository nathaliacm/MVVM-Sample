//
//  HelloViewController.swift
//  HelloMVVM
//
//  Created by Nathalia Cardoso on 13/06/22.
//

import UIKit

class HelloViewController: UIViewController {
    
    private var mvvmView: HelloView?

    private var mvvmViewModel: HelloViewModel {
        didSet {
            updateView(entity: mvvmViewModel.personEntity)
        }
    }

    init(viewModel: HelloViewModel) {
        self.mvvmViewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mvvmView = HelloView(frame: UIScreen.main.bounds, controller: self)
        self.view = self.mvvmView
    }
    
    func handleEvent(firstName: String?) {
        guard let firstName = firstName else {
            return
        }
        mvvmViewModel.updateFirstName(to: firstName)
    }
    
    func updateView(entity: PersonEntity) {
        self.mvvmView?.updateView(entity: entity)
    }

}
