package com.rnfadewrapper

import android.graphics.Color
import android.view.View
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.IViewGroupManager
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.viewmanagers.RnFadeWrapperViewManagerInterface
import com.facebook.react.viewmanagers.RnFadeWrapperViewManagerDelegate

@ReactModule(name = RnFadeWrapperViewManager.NAME)
class RnFadeWrapperViewManager(context: ReactApplicationContext) : SimpleViewManager<RnFadeWrapperView>(),
  RnFadeWrapperViewManagerInterface<RnFadeWrapperView>,
  IViewGroupManager<RnFadeWrapperView>
 {
  private val mDelegate: ViewManagerDelegate<RnFadeWrapperView> = RnFadeWrapperViewManagerDelegate(this)


  override fun getDelegate(): ViewManagerDelegate<RnFadeWrapperView>? {
    return mDelegate
  }

  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): RnFadeWrapperView {
    return RnFadeWrapperView(context)
  }

   override fun setColor(view: RnFadeWrapperView?, value: Int?) {
     view?.setColor(value?: Color.WHITE)
   }

   override fun setSizeTop(view: RnFadeWrapperView?, value: Float) {
    view?.setTopSize(value)
   }

   override fun setSizeRight(view: RnFadeWrapperView?, value: Float) {
     view?.setRightSize(value)
   }

   override fun setSizeBottom(view: RnFadeWrapperView?, value: Float) {
     view?.setBottomSize(value)
   }

   override fun setSizeLeft(view: RnFadeWrapperView?, value: Float) {
     view?.setLeftSize(value)
   }

   override fun addView(
     parent: RnFadeWrapperView,
     child: View,
     index: Int
   ) {
     parent.addView(child, index)
   }

   override fun getChildAt(
     parent: RnFadeWrapperView,
     index: Int
   ): View? {
     return parent.getChildAt(index)
   }

   override fun removeViewAt(parent: RnFadeWrapperView, index: Int) {
     parent.removeViewAt(index)
   }

   override fun getChildCount(parent: RnFadeWrapperView): Int {
     return parent.childCount
   }

   override fun needsCustomLayoutForChildren(): Boolean {
     return false
   }

   companion object {
    const val NAME = "RnFadeWrapperView"
  }
}
