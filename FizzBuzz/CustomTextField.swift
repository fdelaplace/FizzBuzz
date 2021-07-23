//
//  CustomTextField.swift
//  FizzBuzz
//
//  Created by François Delaplace on 22/07/2021.
//

import UIKit

enum Type: Int {
    case divider
    case limit
    case message
}

@IBDesignable class CustomTextField: UITextField {
    
    var type: Type = .divider
    
    @IBInspectable var typeAdapter: Int {
        get {
            return self.type.rawValue
        }
        set(typeIndex) {
            self.type = Type(rawValue: typeIndex) ?? .divider
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        switch type {
        case .divider, .limit:
            keyboardType = .numberPad
        default:
            keyboardType = .default
        }
        return super.becomeFirstResponder()
    }
    
    func validate() -> Bool {
        guard text != nil && text!.count > 0 else {
            return false
        }
        let range = NSRange(location: 0, length: text!.utf16.count)
        switch type {
        case .divider, .limit:
            let regex = try! NSRegularExpression(pattern: "^[0-9]+(?:[0-9]+)*$")
            return regex.firstMatch(in: text!, options: [], range: range) != nil
        default:
            return true
        }
    }
}
