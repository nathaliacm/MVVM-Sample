//
//  HelloView.swift
//  HelloMVVM
//
//  Created by Nathalia Cardoso on 13/06/22.
//

import UIKit

class HelloView: UIView {
    
    private var controller: HelloViewController?
    
    private var personEntity: PersonEntity?
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Confirma", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var textfield: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .systemGray6
        textfield.placeholder = "Digite o primeiro nome"
        textfield.delegate = self
        textfield.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textfield.layer.cornerRadius = 8
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.font = .systemFont(ofSize: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private var firstName: String?
    
    init(frame: CGRect, controller: HelloViewController) {
        self.controller = controller
        super.init(frame: frame)
        self.backgroundColor = .white
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(button)
        addSubview(textfield)
        addSubview(textView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            textfield.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            textfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            textfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            textfield.heightAnchor.constraint(equalToConstant: 40),
            
            button.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 24),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            textView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 24),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc private func didTapButton() {
        controller?.handleEvent(firstName: firstName)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        firstName = textfield.text
    }
    
    private func printInformations() {
        guard let personEntity = personEntity else {
            return
        }
        
        textView.text = "\nDados atuais\n\nNome: \(personEntity.fullName)\nBrasileiro? \(personEntity.isBrazilian)\nMaior de idade? \(personEntity.isOfAge)"
    }
    
    func updateView(entity: PersonEntity) {
        self.personEntity = entity
        printInformations()
    }
}

extension HelloView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
