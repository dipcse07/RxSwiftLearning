//
//  ViewController.swift
//  RxSwiftPlayground
//
//  Created by Scott Gardner on 10/15/17.
//  Copyright © 2017 Scott Gardner. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let observable = Observable.of("string 1", "String 2", "Srring 3")
    
    _ = observable.subscribe{ event in
      print(event)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

