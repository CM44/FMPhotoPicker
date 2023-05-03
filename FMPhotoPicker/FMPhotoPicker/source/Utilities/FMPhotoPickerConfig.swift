//
//  FMPhotoPickerOptions.swift
//  FMPhotoPicker
//
//  Created by c-nguyen on 2018/02/09.
//  Copyright © 2018 Tribal Media House. All rights reserved.
//

import Foundation
import Photos

public enum FMSelectMode {
    case multiple
    case single
}

public enum FMMediaType {
    case image
    case video
    case unsupported
    
    public func value() -> Int {
        switch self {
        case .image:
            return PHAssetMediaType.image.rawValue
        case .video:
            return PHAssetMediaType.video.rawValue
        case .unsupported:
            return PHAssetMediaType.unknown.rawValue
        }
    }
    
    init(withPHAssetMediaType type: PHAssetMediaType) {
        switch type {
        case .image:
            self = .image
        case .video:
            self = .video
        default:
            self = .unsupported
        }
    }
}

public struct FMPhotoPickerConfig {
    public var mediaTypes: [FMMediaType] = [.image]
    public var selectMode: FMSelectMode = .multiple
    public var maxImage: Int = 10
    public var maxVideo: Int = 10
    public var availableFilters: [FMFilterable]? = kDefaultAvailableFilters
    public var availableCrops: [FMCroppable]? = kDefaultAvailableCrops
    public var useCropFirst: Bool = false
    public var alertController: FMAlertable = FMAlert()

    /// Whether you want FMPhotoPicker returns PHAsset instead of UIImage.
    public var shouldReturnAsset: Bool = false
    
    public var forceCropEnabled = false
    public var eclipsePreviewEnabled = false
    
    public var titleFontSize: CGFloat = 17
    
    public var strings: [String: String] = [
        "picker_title":                             "选择照片",
        "picker_button_cancel":                     "取消",
        "picker_button_select_done":                "完成",
        "picker_warning_over_image_select_format":  "You can select maximum %d images",
        "picker_warning_over_video_select_format":  "You can select maximum %d videos",
        
        "present_title_photo_created_date_format":  "yyyy/M/d",
        "present_button_back":                      "返回",
        "present_button_edit_image":                "编辑",
        
        "editor_button_cancel":                     "取消",
        "editor_button_done":                       "完成",
        "editor_menu_filter":                       "滤镜",
        "editor_menu_crop":                         "裁剪",
        "editor_menu_crop_button_reset":            "恢复",
        "editor_menu_crop_button_rotate":           "旋转",
        
        "editor_crop_ratio4x3":                     "4:3",
        "editor_crop_ratio16x9":                    "16:9",
        "editor_crop_ratio9x16":                    "9x16",
        "editor_crop_ratioCustom":                  "Custom",
        "editor_crop_ratioOrigin":                  "Origin",
        "editor_crop_ratioSquare":                  "Square",

        "permission_dialog_title":                  "选择照片",
        "permission_dialog_message":                "App 想要访问照片库",
        "permission_button_ok":                     "允许",
        "permission_button_cancel":                 "拒绝"
    ]
    
    public init() {
        
    }
}
