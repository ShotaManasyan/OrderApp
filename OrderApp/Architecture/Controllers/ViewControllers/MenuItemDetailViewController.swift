//
//  MenuItemDetailViewController.swift
//  OrderApp
//
//  Created by Shota Manasyan on 02.11.22.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    
    let menuItem: MenuItem
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var detailTextLabel: UILabel!
    @IBOutlet var addToOrderButton: UIButton!
    
    init?(coder: NSCoder, menuItem: MenuItem) {
        self.menuItem = menuItem
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MenuController.shared.updateUserActivity(with: .menuItemDetail(menuItem))
        updateUI()
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.1,
            options: [],
            animations: {
                self.addToOrderButton.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        
        MenuController.shared.order.menuItems.append(menuItem)
    }
    
    func updateUI() {
        nameLabel.text = menuItem.name
        priceLabel.text = menuItem.price.formatted(.currency(code: "usd"))
        detailTextLabel.text = menuItem.detailText
        
        Task.init {
            if let image = try? await
                MenuController.shared.fetchImage(from: menuItem.imageURL) {
                imageView.image = image
            }
        }
    }
}
