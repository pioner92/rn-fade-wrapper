# Fade wrapper for React Native
<p align="center">
<img src="./assets/img.png" width="700" alt="react-native-auto-skeleton demo" />
</p>

A simple and performant native wrapper component for React Native that adds customizable **fade gradients** to the edges of its children. Ideal for scrollable content or overlays where subtle fading is needed.

<div align="center" style="max-width: 400px; margin: auto;">
  <a href="https://www.npmjs.com/package/rn-fade-wrapper">
    <img src="https://img.shields.io/npm/v/rn-fade-wrapper.svg" alt="npm version" />
  </a>
  <!-- <a href="https://www.npmjs.com/package/rn-fade-wrapper">
    <img src="https://img.shields.io/npm/dm/rn-fade-wrapper.svg" alt="npm downloads" />
  </a> -->
  <img src="https://img.shields.io/badge/platform-iOS-blue?logo=apple" alt="iOS" />
  <img src="https://img.shields.io/badge/platform-Android-green?logo=android" alt="Android" />
  <img src="https://img.shields.io/badge/types-TypeScript-blue?logo=typescript" alt="TypeScript" />
  <img src="https://img.shields.io/badge/license-MIT-yellow.svg" alt="MIT License" />
  <a href="https://bundlephobia.com/result?p=rn-fade-wrapper">
    <img src="https://img.shields.io/bundlephobia/minzip/rn-fade-wrapper" alt="Bundle size" />
  </a>
</div>


## ✨ Features

- Native fade gradients using Android and iOS layers
- Support for **horizontal** and **vertical** fading
- Customizable **color** and **size** per side
- Simple to use: just wrap your content

---

## 📦 Installation

```bash
yarn add rn-fade-wrapper
```

or

```bash
npm install rn-fade-wrapper
```

---

## 📱 Platform support

| Platform | Old Arch | Fabric |
|----------|----------|--------|
| iOS      | ✅        | ✅      |
| Android  | ✅        | ✅      |

## 🚀 Usage

```tsx
import { FadeWrapper} from 'rn-fade-wrapper';

const MyComponent = () => {
  return (
    <FadeWrapper
      color="#ffffff"
      size={24}
      orientation={"vertical"} // default
    >
     <View>
      <Text>...</Text>
     </View>
    </FadeWrapper>
  );
};
```

---

## 🧹 Props

| Prop         | Type                       | Default              | Description |
|--------------|----------------------------|----------------------|-------------|
| `color`      | `string`                   | `"#ffffff"`          | Fade color (default is white) |
| `size`       | `number`                   | `20`                 | Size of the fade in points |
| `style`       | `ViewStyle`                   | `zIndex:2`                 | Regular ViewStyle `{flex:1}` |
| `inward`       | `boolean`                   | `false`                 | Makes the gradient fade inward (toward the center) instead of outward |
| `sizes`      | `{ top?: number, right?: number, bottom?: number, left?: number }` | `undefined` | Custom sizes for each side (overrides `size` and `orientation`) |
| `orientation`| `'horizontal'` \| `'vertical'` | `'vertical'`     | Directional preset: adds fade to left/right or top/bottom |
| `children`   | `React.ReactNode`          | —                    | Wrapped content |

> If `sizes` is provided, it overrides `size` and `orientation`.

---

## 🎛 Examples

### Custom side fade:

```tsx
<FadeWrapper
  color="black"
  inward
  sizes={{ top: 20, bottom: 30 }}
>
  <FlatList ... />
</FadeWrapper>
```

### ScrollView fade:

```tsx
<FadeWrapper
  color="rgba(0,0,0,0.5)"
  size={16}
  inward
>
  <ScrollView  ... />
</FadeWrapper>
```

---

## 🛠 Under the hood

- Implemented with native `UIView` / `ViewGroup` layers for high performance
- Uses custom `LinearGradient` rendering on Android and `CAGradientLayer` on iOS
- Minimal runtime overhead — great for scroll views or high-FPS use cases

---

## 💡 Tip

You can use `FadeWrapper` inside scrollable containers to create a subtle **"content overflow" indication**.

---

## 📓 License

MIT

