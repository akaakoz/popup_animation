//
//  PopupViewController.swift
//  PopupAnimation
//
//  Created by Akiya Ozawa on R 4/10/08.
//

import UIKit

class PopupViewController: UIViewController {

  // MARK: - Properties
  
  @IBOutlet weak var popupView: UIView!
  @IBOutlet weak var closeBtn: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    popIn()
  }

  @IBAction func didTapCloseBtn(_ sender: Any) {
    popOut()
  }
  
  // MARK: - Private Methods
  private func popIn() {
    self.view.alpha = 0.0
    
    popupView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    UIView.animate(withDuration: 0.24, delay: 0.0) { [weak self] in
      guard let weakSelf = self else { return }
      weakSelf.popupView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
      weakSelf.view.alpha = 1.0
    }
  }

  private func popOut() {
    UIView.animate(withDuration: 0.24, animations: { [weak self] in
      guard let weakSelf = self else { return }
      weakSelf.popupView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
      weakSelf.view.alpha = 0.0
    }, completion: { [weak self] _ in
      guard let weakSelf = self else { return }
      weakSelf.view.removeFromSuperview()
      // *This is imporntant to remove retaining cycle.
      weakSelf.removeFromParent()
    })
  }
  
  deinit {
    print("claiming retain cycle")
  }
}
