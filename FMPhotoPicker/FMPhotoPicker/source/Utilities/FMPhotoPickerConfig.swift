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
    public var maxImage: Int = 9
    public var maxVideo: Int = 9
    /// 0为不限制
    public var imageMaxSize: Int64 = 0
    public var videoMaxSize: Int64 = 0
    public var videoMaxDuration: Double = 0.0
    
    public var availableFilters: [FMFilterable]? = kDefaultAvailableFilters
    public var availableCrops: [FMCroppable]? = kDefaultAvailableCrops
    public var useCropFirst: Bool = true
    public var alertController: FMAlertable = FMAlert()

    /// Whether you want FMPhotoPicker returns PHAsset instead of UIImage.
    public var shouldReturnAsset: Bool = false
    
    public var forceCropEnabled = false
    public var eclipsePreviewEnabled = false
    
    public var titleFontSize: CGFloat = 17
    
    public var strings: [String: String] = [
        "picker_title_image":                       "选择照片",
        "picker_title_video":                       "选择视频",
        "picker_title_file":                        "选择文件",
        "picker_button_cancel":                     "取消",
        "picker_button_select_done":                "完成",
        "picker_warning_over_image_select_format":  "最多只可选择 %d 张照片",
        "picker_warning_over_video_select_format":  "最多只可选择 %d 个视频",
        "picker_warning_over_select_format":        "不支持的媒体类型",
        "picker_warning_over_select_limit_size":    "大小超出限制",
        "picker_warning_over_select_limit_duration":"视频时长超出限制",
        
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
        "editor_crop_ratio9x16":                    "9:16",
        "editor_crop_ratioCustom":                  "任意",
        "editor_crop_ratioOrigin":                  "原比例",
        "editor_crop_ratioSquare":                  "正方形",

        "permission_dialog_title":                  "选择照片",
        "permission_dialog_message":                "App 想要访问照片库",
        "permission_button_ok":                     "允许",
        "permission_button_cancel":                 "拒绝"
    ]
    
    public init() {
        
    }
}
