import {
  View,
  StyleSheet,
  TouchableOpacity,
  Text,
  ScrollView,
  Dimensions,
} from 'react-native';
import { FadeWrapper } from 'rn-fade-wrapper';

const data = [
  'Item 1',
  'Item 2',
  'Item 3',
  'Item 4',
  'Item 5',
  'Item 6',
  'Item 7',
  'Item 8',
  'Item 9',
  'Item 10',
  'Item 11',
  'Item 12',
  'Item 13',
  'Item 14',
  'Item 15',
  'Item 16',
  'Item 17',
];

export default function App() {
  return (
    <View style={styles.container}>
      <FadeWrapper
        color={'white'}
        sizes={{ top: 50, bottom: 50, left: 50, right: 50 }}
      >
        <View
          style={{
            width: '100%',
            backgroundColor: 'white',
            alignSelf: 'center',
            alignItems: 'center',
            zIndex: 20,
          }}
        >
          <Text>HEADER TITLE</Text>
        </View>
      </FadeWrapper>
      <ScrollView style={{ flex: 1 }}>
        {data.map((item, index) => (
          <View
            key={index}
            style={{
              width: '100%',
              paddingVertical: 20,
              paddingHorizontal: 10,
              backgroundColor: 'grey',
              marginTop: 10,
            }}
          >
            <Text>{item}</Text>
          </View>
        ))}
      </ScrollView>
      <FadeWrapper
        color={'white'}
        sizes={{
          top: 50,
        }}
      >
        <View
          style={{
            width: '100%',
            // position: 'absolute',
            // top: Dimensions.get('window').height - 80,
            alignSelf: 'center',
            backgroundColor: 'white',
            // width: '100%',
          }}
        >
          <TouchableOpacity style={styles.button}>
            <Text style={{ color: 'white' }}>PRESS</Text>
          </TouchableOpacity>
        </View>
      </FadeWrapper>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexGrow: 1,
    paddingTop: 50,
    // alignItems: 'center',
    // justifyContent: 'center',
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
    alignSelf: 'center',
  },
});
