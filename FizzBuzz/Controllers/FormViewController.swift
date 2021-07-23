//
//  FormViewController.swift
//  FizzBuzz
//
//  Created by François Delaplace on 05/07/2021.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet weak var resultsTextView: UITextView!
    @IBOutlet weak var stackView: UIStackView!
    
    func validate() {
        
        var textfields = [CustomTextField]()
        for view in stackView.arrangedSubviews {
            if view .isKind(of: CustomTextField.self) {
                let textField = view as! CustomTextField
                textfields.append(textField)
                guard textField.validate() else {
                    return
                }
            }
        }
        
        let dividers = textfields.filter( {$0.type == .divider })
        let messages = textfields.filter( {$0.type == .message })
        let limits = textfields.filter( {$0.type == .limit })
        guard dividers.count == messages.count else {
            return
        }
        let parameters = textfields.compactMap { $0.text }
        Statistics.save(parameters: parameters)
        
        var tuples = Array<(Int, String)>()
        for i in 0..<dividers.count {
            tuples.append((Int(dividers[i].text!)!, messages[i].text!))
        }
        
        resultsTextView.text = String(FizzBuzzGame.fizzBuzz(tuples: tuples, limit: Int(limits.first!.text!)!).flatMap {
            $0+" "
        })
    }
    
    @IBAction func validate(_ sender: UIButton) {
        validate()
    }
}

