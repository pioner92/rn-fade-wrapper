package com.rnfadewrapper

import android.graphics.Color
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.viewmanagers.RnFadeWrapperViewManagerInterface
import com.facebook.react.viewmanagers.RnFadeWrapperViewManagerDelegate

@ReactModule(name = RnFadeWrapperViewManager.NAME)
class RnFadeWrapperViewManager : SimpleViewManager<RnFadeWrapperView>(),
  RnFadeWrapperViewManagerInterface<RnFadeWrapperView> {
  private val mDelegate: ViewManagerDelegate<RnFadeWrapperView>

  init {
    mDelegate = RnFadeWrapperViewManagerDelegate(this)
  }

  override fun getDelegate(): ViewManagerDelegate<RnFadeWrapperView>? {
    return mDelegate
  }

  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): RnFadeWrapperView {
    return RnFadeWrapperView(context)
  }

  @ReactProp(name = "color")
  override fun setColor(view: RnFadeWrapperView?, color: String?) {
    view?.setBackgroundColor(Color.parseColor(color))
  }

  companion object {
    const val NAME = "RnFadeWrapperView"
  }
}
