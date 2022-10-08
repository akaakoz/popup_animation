//
//  ViewController.swift
//  PopupAnimation
//
//  Created by Akiya Ozawa on R 4/10/08.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var popUpBtn: UIButton!
  
  @IBAction func didTapPopupBtn(_ sender: Any) {
    guard let popupVC = UIStoryboard(name: "PopupViewController", bundle: nil).instantiateViewController(withIdentifier: "PopupViewControllerID") as? PopupViewController else { return }
    addChild(popupVC)
    view.addSubview(popupVC.view)
    popupVC.view.frame = view.frame
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

