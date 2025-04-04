import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ColorValue, ViewProps } from 'react-native';
import type { Float } from 'react-native/Libraries/Types/CodegenTypes';

interface NativeProps extends ViewProps {
  color?: ColorValue;
  sizeTop?: Float;
  sizeRight?: Float;
  sizeBottom?: Float;
  sizeLeft?: Float;
}

export default codegenNativeComponent<NativeProps>('RnFadeWrapperView');
