package com.rnfadewrapper

import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.LinearGradient
import android.graphics.Paint
import android.graphics.Shader
import android.util.AttributeSet
import android.view.View
import android.view.ViewGroup

class RnFadeWrapperView : ViewGroup {
  constructor(context: Context?) : super(context)
  constructor(context: Context?, attrs: AttributeSet?) : super(context, attrs)
  constructor(context: Context?, attrs: AttributeSet?, defStyleAttr: Int) : super(
    context,
    attrs,
    defStyleAttr
  )

  private var fadeColor = Color.WHITE

  private val paintTop = Paint()
  private val paintRight = Paint()
  private val paintBottom = Paint()
  private val paintLeft = Paint()

  private var sizeTop = 0f
  private var sizeRight = 0f
  private var sizeBottom = 0f
  private var sizeLeft = 0f

  private var screenDensity = context.resources.displayMetrics.density

  init {
    setWillNotDraw(false)
    paintTop.isAntiAlias = true
    paintRight.isAntiAlias = true
    paintBottom.isAntiAlias = true
    paintLeft.isAntiAlias = true
  }


  fun setColor(value: Int) {
    fadeColor = value
    invalidate()
  }

  fun setTopSize(value: Float) {
    this.sizeTop = value * screenDensity
    invalidate()
  }

  fun setRightSize(value: Float) {
    this.sizeRight = value * screenDensity
    invalidate()
  }

  fun setBottomSize(value: Float) {
    this.sizeBottom = value * screenDensity
    invalidate()
  }

  fun setLeftSize(value: Float) {
    this.sizeLeft = value * screenDensity
    invalidate()
  }

  override fun onViewAdded(child: View?) {
    super.onViewAdded(child)
    requestLayout()
    invalidate()
  }

  override fun onViewRemoved(child: View) {
    super.onViewRemoved(child)
    requestLayout()
    invalidate()
  }

  override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
    setMeasuredDimension(widthMeasureSpec, heightMeasureSpec)
  }
  private fun findTallestChild(): View? {
    return (0 until childCount)
      .map { getChildAt(it) }
      .maxByOrNull { it.height }
  }

  override fun dispatchDraw(canvas: Canvas) {
    super.dispatchDraw(canvas)
    val tallest = findTallestChild()

    if (tallest != null) {

      val topF = tallest.top.toFloat()
      val rightF = tallest.right.toFloat()
      val bottomF = tallest.bottom.toFloat()
      val leftF = tallest.left.toFloat()


      if (sizeTop != 0f) {
          val gradientTop = LinearGradient(
            0f, topF, 0f, topF - sizeTop,
            intArrayOf(fadeColor, Color.TRANSPARENT),
            floatArrayOf(0f, 1f),
            Shader.TileMode.CLAMP
          )
          paintTop.shader = gradientTop
          canvas.drawRect(leftF, topF - sizeTop, rightF, topF, paintTop)
      }

      if (sizeRight != 0f) {
        val gradientRight = LinearGradient(
          rightF, 0f, rightF + sizeRight, 0f,
          intArrayOf(fadeColor, Color.TRANSPARENT),
          floatArrayOf(0f, 1f),
          Shader.TileMode.CLAMP
        )
        paintRight.shader = gradientRight
        canvas.drawRect(rightF, topF, rightF + sizeRight, bottomF, paintRight)
      }


      if (sizeBottom != 0f) {
        val gradientBottom = LinearGradient(
          0f, bottomF, 0f, bottomF + sizeBottom,
          intArrayOf(fadeColor, Color.TRANSPARENT),
          floatArrayOf(0f, 1f),
          Shader.TileMode.CLAMP
        )
        paintBottom.shader = gradientBottom
        canvas.drawRect(leftF, bottomF, rightF, bottomF + sizeBottom, paintBottom)
      }


      if (sizeLeft != 0f) {
        val gradientLeft = LinearGradient(
          leftF, 0f, leftF - sizeLeft, 0f,
          intArrayOf(fadeColor, Color.TRANSPARENT),
          floatArrayOf(0f, 1f),
          Shader.TileMode.CLAMP
        )
        paintLeft.shader = gradientLeft
        canvas.drawRect(leftF - sizeLeft, topF, leftF, bottomF, paintLeft)
      }
    }
  }

  override fun onLayout(
    changed: Boolean,
    l: Int,
    t: Int,
    r: Int,
    b: Int
  ) {
  }
}
