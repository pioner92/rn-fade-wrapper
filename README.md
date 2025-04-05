# Fade wrapper for React Native

A simple and performant native wrapper component for React Native that adds customizable **fade gradients** to the edges of its children. Ideal for scrollable content or overlays where subtle fading is needed.

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
      orientation={'vertical'} // default
    >
      <ScrollView>{/* your content */}</ScrollView>
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
  sizes={{ top: 20, bottom: 30 }}
>
  <FlatList ... />
</FadeWrapper>
```

### Horizontal fade:

```tsx
<FadeWrapper
  color="rgba(0,0,0,0.5)"
  size={16}
  orientation={'horizontal'}
>
  <ScrollView horizontal ... />
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

