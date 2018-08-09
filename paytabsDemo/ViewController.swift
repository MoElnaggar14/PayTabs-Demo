//
//  ViewController.swift
//  paytabsDemo
//
//  Created by Mohammed Elnaggar on 5/19/18.
//  Copyright © 2018 Mohammed Elnaggar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Instance Variables
    var initialSetupViewController: PTFWInitialSetupViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }

    @IBAction func paytabsbutton(_ sender: AnyObject) {
        // show paytabs
        print("paytabs")
        self.initiateSDK()
        self.view.addSubview(self.initialSetupViewController.view)
        self.addChildViewController(self.initialSetupViewController)
        self.initialSetupViewController.didMove(toParentViewController: self)
    }

    private func initiateSDK() {
        let bundle = Bundle(url: Bundle.main.url(forResource: ApplicationResources.kFrameworkResourcesBundle, withExtension: "bundle")!)
        self.initialSetupViewController = PTFWInitialSetupViewController.init(
            nibName: ApplicationXIBs.kPTFWInitialSetupView,
            bundle: bundle,
            andWithViewFrame: self.view.frame,
            andWithAmount: 1, //Float(total),
            andWithCustomerTitle: "", // name
            andWithCurrencyCode: "SAR", //
            andWithTaxAmount: 0.0,
            andWithSDKLanguage: "en", // language
            andWithShippingAddress: "jeddah KSA", // address
            andWithShippingCity: "jeddah",
            andWithShippingCountry: "SAU",
            andWithShippingState: "682",
            andWithShippingZIPCode: "142", // country code
            andWithBillingAddress: "Manama Bahrain",
            andWithBillingCity: "Manama",
            andWithBillingCountry: "BHR",
            andWithBillingState: "Manama",
            andWithBillingZIPCode: "0097", // country code
            andWithOrderID: "009847", // ask nasser
            andWithPhoneNumber: "0001062625862",  // phone
            andWithCustomerEmail: "", // email
            andWithCustomerPassword: "rVoPaGMCaL",
            andIsTokenization: false,
            andIsExistingCustomer: false,
            andWithPayTabsToken: "s7oeTQxwJGpNGjFymzOSLWafapeIzBG1",
            andWithMerchantEmail: "", // Email Account
            andWithMerchantSecretKey: "", // From Account
            andWithRequestTimeoutSeconds: 200,
            andWithAssigneeCode: "SDK")
        
        //        weak var weakSelf = self
        self.initialSetupViewController.didReceiveBackButtonCallback = {
            //            weakSelf?.handleBackButtonTapEvent()
            self.initialSetupViewController.willMove(toParentViewController: self)
            self.initialSetupViewController.view.removeFromSuperview()
            self.initialSetupViewController.removeFromParentViewController()
        }
        
        self.initialSetupViewController.didReceiveFinishTransactionCallback = {(responseCode, result, transactionID, tokenizedCustomerEmail, tokenizedCustomerPassword, token, transactionState) in
            //handle response code , result , transactionID , transaction state
            print(responseCode,result)
            
            self.initialSetupViewController.willMove(toParentViewController: self)
            self.initialSetupViewController.view.removeFromSuperview()
            self.initialSetupViewController.removeFromParentViewController()
            //go to whatever u want to go
            
        }
    }
}

