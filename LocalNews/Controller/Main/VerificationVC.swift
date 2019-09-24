//
//  VerificationVC.swift
//  cwrnch-ios
//
//  Created by apple on 24/09/19.
//  Copyright © 2019 Sukhmani. All rights reserved.
//

import UIKit

class VerificationVC: UIViewController, UITextFieldDelegate, MyTextFieldDelegate {
    
    var activeTextField = UITextField()
    
    @IBOutlet weak var code4: MyTextField!
    @IBOutlet weak var code3: MyTextField!
    @IBOutlet weak var code2: MyTextField!
    @IBOutlet weak var code1: MyTextField!
    @IBOutlet weak var verifyBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        code1.becomeFirstResponder()
        
        code1.delegate = self
        code2.delegate = self
        code3.delegate = self
        code4.delegate = self
        code1.myDelegate = self
        code2.myDelegate = self
        code3.myDelegate = self
        code4.myDelegate = self

        Customization()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Customization
    private func Customization() {
        
        
        verifyBtn.sainiShadowWithGradientAndCornerRadius(shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.16), shadowOpacity: 1, shadowRadius: 5, cornerRadius: verifyBtn.frame.height / 2, colorArr: [#colorLiteral(red: 0.2, green: 0.5764705882, blue: 0.6705882353, alpha: 1), #colorLiteral(red: 0.07058823529, green: 0.4392156863, blue: 0.568627451, alpha: 1)], verticalGradient: false)
        
    }
    
    //  when a textField is active set the activeTextField property to that textField
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        activeTextField = textField
    }

    //MARK: - textFieldDidDelete
    // when the backButton is pressed, the MyTextField delegate will get called. The activeTextField will let you know which textField the backButton was pressed in. Depending on the textField certain textFields will become enabled and disabled.
    func textFieldDidDelete() {
        if activeTextField == code1{
            print("Back Button was pressed in Code1")
        }
        
        if activeTextField == code2{
            print("Back Buttn was pressed in Code2")
            code2.isEnabled = false
            code1.isEnabled = true
            code1.becomeFirstResponder()
            code1.text = ""
        }
        
        if activeTextField == code3{
            print("Back Buttn was pressed in Code3")
            code3.isEnabled = false
            code2.isEnabled = true
            code2.becomeFirstResponder()
            code2.text = ""
        }
        
        if activeTextField == code4{
            print("Back Buttn was pressed in Code4")
            code4.isEnabled = false
            code3.isEnabled = true
            code3.becomeFirstResponder()
            code3.text = ""
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text {
            
            if (text.count <= 1) && (string.count > 0) {
                
                if textField == code1 {
                    code1.isEnabled = false
                    code2.isEnabled = true
                    code2.becomeFirstResponder()
                }
                
                if textField == code2 {
                    code2.isEnabled = false
                    code3.isEnabled = true
                    code3.becomeFirstResponder()
                }
                
                if textField == code3 {
                    code3.isEnabled = false
                    code4.isEnabled = true
                    code4.becomeFirstResponder()
                }
                
                if textField == code4 {
                    // do nothing or better yet do something now that you have all four digits for the sms code. Once the user lands on this textField then the sms code is complete
                    code4.isEnabled = true
                }
                textField.text = string
                return false
            }
                // if the user gets to the last textField and presses the back button everything above will get reversed
            else if (text.count >= 1) && (string.count == 0) {
                
                if textField == code4 {
                    code4.isEnabled = false
                    code3.isEnabled = true
                    code3.becomeFirstResponder()
                }
                
                if textField == code3 {
                    code3.isEnabled = false
                    code2.isEnabled = true
                    code2.becomeFirstResponder()
                }
                
                if textField == code2 {
                    code2.isEnabled = false
                    code1.isEnabled = true
                    code1.becomeFirstResponder()
                }
                
                if textField == code1 {
                    code1.becomeFirstResponder()
                }
                
                textField.text = ""
                return false
                
            } // after pressing the backButton and moving forward again you will have to do what's in step 10 all over again
            else if text.count >= 1 {
                
                if textField == code1 {
                    code1.isEnabled = false
                    code1.isEnabled = true
                    code1.becomeFirstResponder()
                }
                
                if textField == code2 {
                    code2.isEnabled = false
                    code3.isEnabled = true
                    code3.becomeFirstResponder()
                }
                
                if textField == code3 {
                    code3.isEnabled = false
                    code4.isEnabled = true
                    code4.becomeFirstResponder()
                }
                
                if textField == code4 {
                    // do nothing or better yet do something now that you have all four digits for the sms code. Once the user lands on this textField then the sms code is complete
                }
                
                textField.text = string
                return false
            }
        }
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
