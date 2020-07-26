//
// Copyright (c) 2020 Related Code - http://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

//-------------------------------------------------------------------------------------------------------------------------------------------------
class EditProfileView: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellProfile: UITableViewCell!
	@IBOutlet var cellName: UITableViewCell!
	@IBOutlet var cellUsername: UITableViewCell!
	@IBOutlet var cellWebsite: UITableViewCell!
	@IBOutlet var cellBio: UITableViewCell!

	@IBOutlet var cellEmail: UITableViewCell!
	@IBOutlet var cellPassword: UITableViewCell!
	@IBOutlet var cellPrivacySettings: UITableViewCell!
	@IBOutlet var cellDeleteAccount: UITableViewCell!

	@IBOutlet var imageProfile: UIImageView!
	@IBOutlet var buttonCamera: UIButton!

	@IBOutlet var textFieldName: UITextField!
	@IBOutlet var textFieldUsername: UITextField!
	@IBOutlet var textFieldWebsite: UITextField!
	@IBOutlet var textFieldBio: UITextField!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Edit Profile"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButton(_:)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelButton(_:)))

		buttonCamera.layer.borderWidth = 1
        buttonCamera.layer.borderColor = K.AppColor.border.cgColor

		loadData()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLayoutSubviews() {

		super.viewDidLayoutSubviews()
		imageProfile.layer.cornerRadius = imageProfile.frame.size.height/2
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageProfile.sample("Social", "Portraits", 10)
		textFieldName.text = "John Smith"
		textFieldUsername.text = "johnsmith"
		textFieldWebsite.text = "related.blog"
		textFieldBio.text = "UI/UX Designer at App Design Kit"

		refreshTableView()
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
    @objc func saveButton(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

    //------------------------------------------------------------------------ -------------------------------------------------------------
    
    @objc func cancelButton(_ sender: UIButton) {

        let alert = UIAlertController(title: "Cancel Changes?", message: "Are you sure you want to leave without saving the changes?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "No", style: .default, handler: nil)
        let yesAction = UIAlertAction(title: "Leave", style: .cancel) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(cancelAction)
        alert.addAction(yesAction)
        
        
        present(alert, animated: true, completion: nil)
        //dismiss(animated: true, completion: nil)
    }
    
    
    
    @objc func parameterAddPressed(_ sender: UIButton) {
        
        print("Parameter Pressed")
        
    }
    
    
    
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCamera(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension EditProfileView: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 2
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 5 }
		if (section == 1) { return 4 }
		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellProfile	}
		if (indexPath.section == 0) && (indexPath.row == 1) { return cellName		}
		if (indexPath.section == 0) && (indexPath.row == 2) { return cellUsername	}
		if (indexPath.section == 0) && (indexPath.row == 3) { return cellWebsite	}
		if (indexPath.section == 0) && (indexPath.row == 4) { return cellBio		}

		if (indexPath.section == 1) && (indexPath.row == 0) { return cellEmail				}
		if (indexPath.section == 1) && (indexPath.row == 1) { return cellPassword			}
		if (indexPath.section == 1) && (indexPath.row == 2) { return cellPrivacySettings	}
		if (indexPath.section == 1) && (indexPath.row == 3) { return cellDeleteAccount		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension EditProfileView: UITableViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 0) && (indexPath.row == 0) { return 120 }
		return 45
	}

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
          
        let view = UIView()
        
        if section == 0 {
            
            view.backgroundColor = .tertiarySystemFill
           // let header = UITableViewHeaderFooterView()
           // header.contentView.backgroundColor = .tertiarySystemFill
           // return header
            
        }
        if section == 1 {
        
        let frame = tableView.frame
            
        let title = UILabel()
            title.frame = CGRect(x: 5, y: 0, width: frame.size.width - 50, height: 45)
            title.font = UIFont.systemFont(ofSize: 12)
            title.text = "PARAMETERS"
            
            let addButton = UIButton(frame: CGRect(x: frame.size.width - 50, y: 0, width: 50, height: 45))
            addButton.setImage(UIImage(systemName: "plus"), for: .normal)
            addButton.addTarget(self, action: #selector(parameterAddPressed(_:)), for: .touchUpInside)
            addButton.tag = section
        
            view.addSubview(title)
            view.addSubview(addButton)
        
        }
        return view
    }
    
    
    
    
    
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 1 }
		if (section == 1) { return 45 }
		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
//	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//		if (section == 1) { return "OTHER INFORMATION" }
//		return nil
//	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
//	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//
//		if (section == 0) {
//			if let header = view as? UITableViewHeaderFooterView {
//				header.contentView.backgroundColor = .tertiarySystemFill
//			}
//		}
//
//		if (section != 0) {
//			if let header = view as? UITableViewHeaderFooterView {
//				let viewY = header.frame.size.height - 0.5
//				let view = UIView(frame: CGRect(x: 0, y: viewY, width: header.frame.size.width, height: 0.5))
//				view.backgroundColor = .tertiarySystemFill
//				view.tag = 1001
//				header.contentView.subviews.forEach { (view) in
//					if (view.tag == 1001) {
////						view.removeFromSuperview()
//					}
//				}
//				header.contentView.addSubview(view)
//				header.textLabel?.font = UIFont.systemFont(ofSize: 12)
//			}
//		}
//	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}
