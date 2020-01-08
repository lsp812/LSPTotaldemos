//
//  LSPConfiguration.h
//  LSPTotaldemos
//
//  Created by lishaopeng on 2018/12/21.
//  Copyright © 2018年 lishaopeng. All rights reserved.
//
#import "UIColor+HXFTool.h"
#import "UIColor+HXFNSStringTool.h"

#ifndef LSPConfiguration_h
#define LSPConfiguration_h

#define RGB(R,G,B)                 [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]
#define RGBA(R,G,B,A)              [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]
///颜色
#define HEF_COLOR_HEX(exp)         [UIColor colorWithHexString:exp]

#define hxf_ScreenSize      [UIScreen mainScreen].bounds.size
#define hxf_ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define hxf_ScreenHeight    [UIScreen mainScreen].bounds.size.height
//
//iPhoneX / iPhoneXS
#define  isIphoneX_XS     (hxf_ScreenWidth == 375.f && hxf_ScreenHeight == 812.f ? YES : NO)
//iPhoneXR / iPhoneXSMax
#define  isIphoneXR_XSMax    (hxf_ScreenWidth == 414.f && hxf_ScreenHeight == 896.f ? YES : NO)
//异性全面屏
#define   isFullScreen   (isIphoneX_XS || isIphoneXR_XSMax)
//
#define Height_StatusBar (isFullScreen?(44.0): (20.0))
#define Height_NavBar    (Height_StatusBar+44.0)
#define Height_TabBar    (isFullScreen?(49.0+34.0): (49.0))
//
#endif /* LSPConfiguration_h */
