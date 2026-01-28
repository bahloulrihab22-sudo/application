import React, { useRef, useState, useEffect } from 'react';
import {
  View,
  Text,
  TextInput,
  Animated,
  StyleSheet,
  TouchableOpacity,
  KeyboardAvoidingView,
  Platform,
  ScrollView,
  Alert,
} from 'react-native';
import BackgroundWhite from '../Widgets/BackgroundWhite';
import Logo from '../Widgets/Logo';
import WhiteButton from '../Widgets/WhiteButton';
import ReturnButton from '../Widgets/ReturnButton';
import { useNavigation } from '@react-navigation/native';
import Confirm from './Confirm';
import { Ionicons } from '@expo/vector-icons';

export default function SignIn() {
  const navigation = useNavigation();

  // Animation refs
  const fadeAnim = useRef(new Animated.Value(0)).current;
  const scaleAnim = useRef(new Animated.Value(0.95)).current;

  // Input states
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [obscurePassword, setObscurePassword] = useState(true);

  // Animate on mount
  useEffect(() => {
    Animated.parallel([
      Animated.timing(fadeAnim, {
        toValue: 1,
        duration: 800,
        useNativeDriver: true,
      }),
      Animated.timing(scaleAnim, {
        toValue: 1,
        duration: 800,
        useNativeDriver: true,
      }),
    ]).start();
  }, []);

  // Show Snackbar / Alert
  const showMessage = (message, isError = false) => {
    Alert.alert(
      '',
      message,
      [{ text: 'OK', style: 'default' }],
      { cancelable: true }
    );
  };

  const handleConfirm = () => {
    if (!email || !password) {
      showMessage("Oops! Tu as oublié un champ 😅", true);
      return;
    }

    showMessage("Bienvenue ! 👋 Tu es connecté.");

    setTimeout(() => {
      navigation.navigate('Confirm');
    }, 500);
  };

  return (
    <BackgroundWhite>
      <KeyboardAvoidingView
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
        style={{ flex: 1 }}
      >
        <ScrollView contentContainerStyle={styles.container}>
          <View style={{ height: 20 }} />
          <ReturnButton onPress={() => navigation.goBack()} />
          <View style={{ height: 20 }} />
          <Logo width={160} />
          <View style={{ height: 40 }} />

          <Animated.View
            style={{
              opacity: fadeAnim,
              transform: [{ scale: scaleAnim }],
              width: '100%',
            }}
          >
            {/* Email Input */}
            <TextInput
              value={email}
              onChangeText={setEmail}
              keyboardType="email-address"
              placeholder="Email"
              style={styles.input}
            />

            <View style={{ height: 16 }} />

            {/* Password Input */}
            <View style={styles.inputContainer}>
              <TextInput
                value={password}
                onChangeText={setPassword}
                secureTextEntry={obscurePassword}
                placeholder="Password"
                style={[styles.input, { flex: 1, margin: 0, paddingRight: 40 }]}
              />
              <TouchableOpacity
                style={styles.iconButton}
                onPress={() => setObscurePassword(!obscurePassword)}
              >
                <Ionicons
                  name={obscurePassword ? 'eye' : 'eye-off'}
                  size={24}
                  color="gray"
                />
              </TouchableOpacity>
            </View>

            <View style={{ height: 24 }} />

            {/* Confirm Button */}
            <WhiteButton text="Confirm" onPress={handleConfirm} />

            <View style={{ height: 40 }} />
          </Animated.View>
        </ScrollView>
      </KeyboardAvoidingView>
    </BackgroundWhite>
  );
}

const styles = StyleSheet.create({
  container: {
    paddingHorizontal: 28,
    alignItems: 'center',
  },
  input: {
    width: '100%',
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 14,
    paddingHorizontal: 12,
    paddingVertical: 10,
    fontSize: 16,
  },
  inputContainer: {
    width: '100%',
    position: 'relative',
  },
  iconButton: {
    position: 'absolute',
    right: 10,
    top: '50%',
    transform: [{ translateY: -12 }],
  },
});
