import { useMemo } from 'react';
import { default as RnFadeWrapperView__ } from './RnFadeWrapperViewNativeComponent';
export * from './RnFadeWrapperViewNativeComponent';

export enum FadeWrapperOrientation {
  HORIZONTAL = 'horizontal',
  VERTICAL = 'vertical',
}

export type TFadeSizes = {
  top?: number;
  right?: number;
  bottom?: number;
  left?: number;
};

interface IProps {
  color?: string;
  orientation?: 'horizontal' | 'vertical';
  size?: number;
  sizes?: TFadeSizes;
  children: React.ReactNode;
}

const defaultStyle = {
  zIndex: 2,
};

const makePreset = (
  top: number,
  right: number,
  bottom: number,
  left: number
) => {
  return {
    sizeTop: top,
    sizeRight: right,
    sizeBottom: bottom,
    sizeLeft: left,
  };
};

export const FadeWrapper: React.FC<React.PropsWithChildren<IProps>> = ({
  children,
  color,
  size = 20,
  sizes,
  orientation = FadeWrapperOrientation.VERTICAL,
}) => {
  const props = useMemo(() => {
    if (sizes) {
      return makePreset(
        sizes.top ?? 0,
        sizes.right ?? 0,
        sizes.bottom ?? 0,
        sizes.left ?? 0
      );
    }

    if (orientation) {
      const sizedByOrientation = {
        horizontal: makePreset(0, size, 0, size),
        vertical: makePreset(size, 0, size, 0),
      };
      return sizedByOrientation[orientation];
    }

    return makePreset(size, 0, size, 0);
  }, [size, orientation, sizes]);

  return (
    <RnFadeWrapperView__ {...props} color={color} style={defaultStyle}>
      {children}
    </RnFadeWrapperView__>
  );
};
