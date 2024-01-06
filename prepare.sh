apt install -y unzip wget
cd  ~
wget  https://raw.githubusercontent.com/2dust/AndroidLibV2rayLite/master/ubuntu-cli-install-android-sdk.sh

bash ubuntu-cli-install-android-sdk.sh
mkdir Android
mv android-sdk-linux/ Android/Sdk

wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz 
export PATH=$PATH:/usr/local/go/bin

go install golang.org/x/mobile/cmd/gomobile@latest

export PATH=$PATH:~/go/bin

wget https://dl.google.com/android/repository/android-ndk-r25c-linux.zip
unzip android-ndk-r25c-linux.zip
export PATH=$PATH:~/android-ndk-r25c/




git clone https://github.com/hiddify/AndroidLibXrayLite && cd AndroidLibXrayLite
gomobile init
go mod tidy -v
gomobile bind -v -androidapi 19 -ldflags='-s -w' ./


apt install -y nginx

cp libv2ray.aar /var/www/html/
cp libv2ray-sources.jar /var/www/html/
