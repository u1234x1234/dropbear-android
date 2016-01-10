# dropbear-android
Cross compiling dropbear for android  
There's no "getpass" function on android, so it uses dropbear fork https://github.com/u1234x1234/dropbear (only difference is  ignoring getpass function). Password can be obtained by the environment variable "DROPBEAR_PASSWORD" for a password authentication.

# Usage:
./configure.sh

If your android version < 4.1, you should remove pie flags.  
http://stackoverflow.com/questions/24818902/running-a-native-library-on-android-l-error-only-position-independent-executab  
https://source.android.com/security/enhancements/enhancements41.html  
https://source.android.com/security/enhancements/enhancements50.html
