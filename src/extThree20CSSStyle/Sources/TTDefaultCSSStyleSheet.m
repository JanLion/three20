//
// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "extThree20CSSStyle/TTDefaultCSSStyleSheet.h"
#import "extThree20CSSStyle/TTCSSRuleSet.h"

// extThree20CSSStyle
#import "extThree20CSSStyle/TTCSSStyleSheet.h"

// Core
#import "Three20Core/TTCorePreprocessorMacros.h"
#import "Three20Core/TTDebug.h"
#import "Three20Core/TTGlobalCorePaths.h"

NSString* kDefaultCSSPath = @"extThree20CSSStyle.bundle/stylesheets/default.css";


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TTDefaultCSSStyleSheet

@synthesize styleSheet = _styleSheet;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
  if (self = [super init]) {
    [[NSNotificationCenter defaultCenter]
     addObserver: self
     selector: @selector(didReceiveMemoryWarning:)
     name: UIApplicationDidReceiveMemoryWarningNotification
     object: nil];

    _styleSheet = [[TTCSSStyleSheet alloc] init];

    BOOL loadedSuccessfully = [_styleSheet
                               loadFromFilename:TTPathForBundleResource(kDefaultCSSPath)];

    // If this fails, it's very likely that you forgot to add the extThree20CSSStyle.bundle file
    // to your project. If you didn't, ensure that it's being copied in the "Copy Bundle Resources"
    // phase.
    TTDASSERT(loadedSuccessfully);
    if (!loadedSuccessfully) {
      // Bail out.
    }
  }

  return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
  [[NSNotificationCenter defaultCenter]
   removeObserver: self
   name: UIApplicationDidReceiveMemoryWarningNotification
   object: nil];

  TT_RELEASE_SAFELY(_styleSheet);

  [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark NSNotifications


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didReceiveMemoryWarning:(void*)object {
  [self freeMemory];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)freeMemory {
  [_styleSheet freeMemory];

  [super freeMemory];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)addStyleSheetFromDisk:(NSString*)filename {
  TTCSSStyleSheet* styleSheet = [[TTCSSStyleSheet alloc] init];

  BOOL loadedSuccessfully = [styleSheet loadFromFilename:filename];

  [_styleSheet addStyleSheet:styleSheet];

  TT_RELEASE_SAFELY(styleSheet);

  return loadedSuccessfully;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)backgroundColorForCSSSelector:(NSString*)cssSelector {
  return [_styleSheet backgroundColorWithCssSelector: cssSelector
                                            forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (TTDefaultCSSStyleSheet*)globalCSSStyleSheet {
  TTDASSERT([[TTStyleSheet globalStyleSheet] isKindOfClass:[TTDefaultStyleSheet class]]);
  return (TTDefaultCSSStyleSheet*)[TTStyleSheet globalStyleSheet];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Common styles


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)textColor {
  return [_styleSheet colorWithCssSelector: @"body"
                                  forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)highlightedTextColor {
  return [_styleSheet colorWithCssSelector: @"body"
                                  forState: UIControlStateHighlighted];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)font {
  return [_styleSheet fontWithCssSelector: @"body"
                                 forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)backgroundColor {
  return [_styleSheet backgroundColorWithCssSelector: @"body"
                                            forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)navigationBarTintColor {
  return [_styleSheet backgroundColorWithCssSelector: @"navigationBar"
                                            forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)toolbarTintColor {
  return [_styleSheet backgroundColorWithCssSelector: @"toolbar"
                                            forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)searchBarTintColor {
  return [_styleSheet backgroundColorWithCssSelector: @"searchbar"
                                            forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Tables


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tablePlainBackgroundColor {
  return [_styleSheet backgroundColorWithCssSelector: @"table"
                                            forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableGroupedBackgroundColor {
  return [_styleSheet backgroundColorWithCssSelector: @"groupedTable"
                                            forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)searchTableBackgroundColor {
  return [_styleSheet backgroundColorWithCssSelector: @"searchTable"
                                            forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)searchTableSeparatorColor {
  return [_styleSheet backgroundColorWithCssSelector: @"searchTableSeparator"
                                            forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Table Items


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)linkTextColor {
  return [_styleSheet colorWithCssSelector: @".tableItemLink"
                                  forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)timestampTextColor {
  return [_styleSheet colorWithCssSelector: @".tableItemTimestamp"
                                  forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)moreLinkTextColor {
  return [_styleSheet colorWithCssSelector: @".moreButton"
                                  forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Table Headers


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableHeaderTextColor {
  return [_styleSheet colorWithCssSelector: @".tableHeader"
                                  forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableHeaderShadowColor {
  return [_styleSheet textShadowColorWithCssSelector: @".tableHeader"
                                            forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)tableHeaderShadowOffset {
  return [_styleSheet textShadowOffsetWithCssSelector: @".tableHeader"
                                             forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableHeaderTintColor {
  return [_styleSheet backgroundColorWithCssSelector: @".tableHeader"
                                            forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Photo Captions


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)photoCaptionTextColor {
  return [_styleSheet colorWithCssSelector: @".photoCaption"
                                  forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)photoCaptionTextShadowColor {
  return [_styleSheet textShadowColorWithCssSelector: @".photoCaption"
                                            forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)photoCaptionTextShadowOffset {
  return [_styleSheet textShadowOffsetWithCssSelector: @".photoCaption"
                                             forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark DragRefreshHeader


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableRefreshHeaderLastUpdatedFont {
  return [_styleSheet fontWithCssSelector: @".dragRefreshHeaderLastUpdated"
                                 forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)tableRefreshHeaderStatusFont {
  return [_styleSheet fontWithCssSelector: @".dragRefreshHeaderStatusFont"
                                 forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableRefreshHeaderBackgroundColor {
  return [_styleSheet backgroundColorWithCssSelector: @".dragRefreshHeader"
                                            forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableRefreshHeaderTextColor {
  return [_styleSheet colorWithCssSelector: @".dragRefreshHeader"
                                  forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIColor*)tableRefreshHeaderTextShadowColor {
  return [_styleSheet textShadowColorWithCssSelector: @".dragRefreshHeader"
                                            forState: UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)tableRefreshHeaderTextShadowOffset {
  return [_styleSheet textShadowOffsetWithCssSelector: @".dragRefreshHeader"
                                             forState: UIControlStateNormal];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(TTCSSRuleSet*)css:(NSString*)selector {
	return [_styleSheet css:selector];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(TTCSSRuleSet*)css:(NSString*)selectorName forState:(UIControlState)state {
	return [_styleSheet css:selectorName forState:state];
}

@end

