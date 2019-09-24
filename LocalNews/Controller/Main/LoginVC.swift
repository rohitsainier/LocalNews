//
//  LoginVC.swift
//  cwrnch-ios
//
//  Created by apple on 23/09/19.
//  Copyright © 2019 Sukhmani. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        Customization()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            //            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            // Fallback on earlier versions
        }
        self.navigationItem.title = "Login"
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2980392157, green: 0.3568627451, blue: 0.3607843137, alpha: 1) ]
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.hidesBackButton = true
    }
    
    //MARK: - viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: - Customization
    private func Customization() {
        loginBtn.sainiShadowWithGradientAndCornerRadius(shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.16), shadowOpacity: 1, shadowRadius: 5, cornerRadius: loginBtn.frame.height / 2, colorArr: [#colorLiteral(red: 0.2, green: 0.5764705882, blue: 0.6705882353, alpha: 1), #colorLiteral(red: 0.07058823529, green: 0.4392156863, blue: 0.568627451, alpha: 1)], verticalGradient: false)
        
        signUpBtn.sainiShadowWithGradientAndCornerRadius(shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.16), shadowOpacity: 1, shadowRadius: 5, cornerRadius: signUpBtn.frame.height / 2, colorArr: [#colorLiteral(red: 0.2, green: 0.831372549, blue: 0.8117647059, alpha: 1) , #colorLiteral(red: 0.2156862745, green: 0.6352941176, blue: 0.6862745098, alpha: 1)], verticalGradient: false)
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
