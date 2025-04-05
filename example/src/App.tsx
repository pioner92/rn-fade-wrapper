import {
  View,
  StyleSheet,
  TouchableOpacity,
  Text,
  ScrollView,
  Dimensions,
  FlatList,
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
        inward
        size={20.0}
        color={'white'}
        // orientation={'horizontal'}
        sizes={{
          top: 20,
          right: 20,
          bottom: 20,
          left: 20,
        }}
        // orientation="horizontal"
        // sizes={{ right: 50 }}
        // sizes={{
        //   top: 20,
        //   right: 20,
        //   bottom: 20,
        //   left: 20,
        // }}
      >
        {/* <View style={styles.box} /> */}
        <FlatList
          data={data}
          renderItem={({ item }) => (
            <View
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
          )}
          keyExtractor={(item, index) => index.toString()}
        />
        {/* <ScrollView style={{ flex: 1, backgroundColor: 'red' }}>
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
        </ScrollView> */}
      </FadeWrapper>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexGrow: 1,
    paddingTop: 200,
  },
  box: {
    width: 200,
    height: 100,
    // marginVertical: 20,
    backgroundColor: 'green',
    alignSelf: 'center',
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
