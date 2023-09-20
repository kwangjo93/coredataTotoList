//
//  DetailViewController.swift
//  coredataTotoList
//
//  Created by 천광조 on 2023/09/17.
//

enum EditMode {
    case new
    case edit
}

import UIKit
import PhotosUI

final class DetailViewController: UIViewController {

    private let detailView = DetailView()
    
    var editMode: EditMode = .new
    
    var viewModel: ViewModel
    
    var section: Category?
    var task: Task?
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var coordinator: DetailCoordinator?
    
    //화면전환 코디네이터 + 데이터받는 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadCategories()
        detailView.viewModel = self.viewModel
        setupTapGestures()
        setupButtonAction()
        configureUI()
        title = "상 세 화 면"
    }
    
    override func loadView() {
        self.view = detailView
    }
    
    // 뷰에 있는 버튼의 타겟 설정
    private func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    private func configureUI() {
        guard let title = section?.title else { return }
        guard let task = task else { return }
        var intValue = arrayInt(text: title)
        if editMode == .edit {
            detailView.profileImageView.image = task.mainImage
            detailView.dateLabel.text = task.modifyDateString
            detailView.contentTextView.text = task.title
            detailView.pickerView.selectedRow(inComponent: intValue)
        }
    }
    private func arrayInt(text: String) -> Int {
        if section?.title == "Learning" {
            return 0
        } else if section?.title == "work" {
            return 1
        } else {
            return 2
        }
    }
    
    //피커뷰 이동한 경우도 수정이 필요 추후
    @objc func saveButtonTapped() {
        if editMode == .new {
            if detailView.pickedValue == "Learning" {
                viewModel.creatData(title: <#T##String#>, category: <#T##Category#>, index: <#T##Int#>, completion: <#T##() -> Void#>)
            } else if detailView.pickedValue == "work" {
                viewModel.creatData(title: <#T##String#>, category: <#T##Category#>, index: <#T##Int#>, completion: <#T##() -> Void#>)
            } else {
                viewModel.creatData(title: <#T##String#>, category: <#T##Category#>, index: <#T##Int#>, completion: <#T##() -> Void#>)
            }
        } else {
            if detailView.pickedValue == "Learning" {
                viewModel.updateData(category: <#T##Category#>, index: <#T##Int#>, indexPath: <#T##Int#>, newToDoData: <#T##Task#>, completion: <#T##() -> Void#>)
            } else if detailView.pickedValue == "work" {
                viewModel.updateData(category: <#T##Category#>, index: <#T##Int#>, indexPath: <#T##Int#>, newToDoData: <#T##Task#>, completion: <#T##() -> Void#>)
            } else {
                viewModel.updateData(category: <#T##Category#>, index: <#T##Int#>, indexPath: <#T##Int#>, newToDoData: <#T##Task#>, completion: <#T##() -> Void#>)
            }
        }
    }
    
    //MARK: - 이미지뷰가 눌렸을때의 동작 설정
    
    // 제스쳐 설정 (이미지뷰가 눌리면, 실행)
    private func setupTapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpImageView))
        detailView.profileImageView.addGestureRecognizer(tapGesture)
        detailView.profileImageView.isUserInteractionEnabled = true
    }
    
    @objc func touchUpImageView() {
        print("이미지뷰 터치")
        setupImagePicker()
    }
    
    private func setupImagePicker() {
        // 기본설정 셋팅
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images, .videos])
        
        // 기본설정을 가지고, 피커뷰컨트롤러 생성
        let picker = PHPickerViewController(configuration: configuration)
        // 피커뷰 컨트롤러의 대리자 설정
        picker.delegate = self
        // 피커뷰 띄우기
        self.present(picker, animated: true, completion: nil)
    }

}

// MARK: - 피커뷰 델리게이트

extension DetailViewController: PHPickerViewControllerDelegate {
    // 사진이 선택이 된 후에 호출되는 메서드
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // 피커뷰 dismiss
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    // 이미지뷰에 표시
                    self.detailView.profileImageView.image = image as? UIImage
                }
            }
        } else {
            print("불러오기 실패")
        }
    }
}
