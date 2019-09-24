//
//  EnterNewPwdVC.swift
//  cwrnch-ios
//
//  Created by apple on 24/09/19.
//  Copyright © 2019 Sukhmani. All rights reserved.
//

import UIKit

class EnterNewPwdVC: UIViewController {

    @IBOutlet weak var submitBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        Customization()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationItem.title = "Enter New Password"
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
        submitBtn.sainiShadowWithGradientAndCornerRadius(shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.16), shadowOpacity: 1, shadowRadius: 5, cornerRadius: submitBtn.frame.height / 2, colorArr: [#colorLiteral(red: 0.2, green: 0.5764705882, blue: 0.6705882353, alpha: 1), #colorLiteral(red: 0.07058823529, green: 0.4392156863, blue: 0.568627451, alpha: 1)], verticalGradient: false)
        
        
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
