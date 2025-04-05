/**
 * @type {import('@react-native-community/cli-types').UserDependencyConfig}
 */
module.exports = {
  dependency: {
    platforms: {
      android: {
        javaPackageName: 'com.rnfadewrapper',
        cmakeListsPath: 'generated/jni/CMakeLists.txt',
      },
    },
  },
};
