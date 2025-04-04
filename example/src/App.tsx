import { View, StyleSheet, TouchableOpacity, Text } from 'react-native';
import { RnFadeWrapperView } from 'rn-fade-wrapper';

export default function App() {
  return (
    <View style={styles.container}>
      <RnFadeWrapperView
        color={'red'}
        sizes={{
          top: 20,
          right: 40,
          bottom: 20,
          left: 40,
        }}
      >
        <TouchableOpacity style={styles.button}>
          <Text style={{ color: 'white' }}>PRESS</Text>
        </TouchableOpacity>
      </RnFadeWrapperView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
  button: {
    width: 200,
    height: 50,
    backgroundColor: 'black',
    borderRadius: 10,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
