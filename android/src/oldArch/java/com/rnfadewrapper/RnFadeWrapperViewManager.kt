package com.rnfadewrapper

import android.graphics.Color
import android.view.View
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewGroupManager
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.bridge.ReactApplicationContext


@ReactModule(name = RnFadeWrapperViewManager.Companion.NAME)
class RnFadeWrapperViewManager(private val context: ReactApplicationContext) : ViewGroupManager<RnFadeWrapperView>() {

  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): RnFadeWrapperView {
    return RnFadeWrapperView(context)
  }

  @ReactProp(name = "color")
   fun setColor(view: RnFadeWrapperView?, value: String?) {
     val color = try {
       if (value != null) Color.parseColor(value) else  Color.GRAY
     } catch (e: IllegalArgumentException) {
       Color.WHITE
     }
     view?.setColor(color)
   }

  @ReactProp(name = "sizeTop")
   fun setSizeTop(view: RnFadeWrapperView?, value: Float) {
    view?.setTopSize(value)
   }

  @ReactProp(name = "sizeRight")
   fun setSizeRight(view: RnFadeWrapperView?, value: Float) {
     view?.setRightSize(value)
   }

  @ReactProp(name = "sizeBottom")
   fun setSizeBottom(view: RnFadeWrapperView?, value: Float) {
     view?.setBottomSize(value)
   }

  @ReactProp(name = "sizeLeft")
   fun setSizeLeft(view: RnFadeWrapperView?, value: Float) {
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
