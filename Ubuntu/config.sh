sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install git unzip cmake build-essential libboost1.55-dev libboost1.55-tools-dev libqt4-dev -y


mkdir tmp; cd tmp

wget http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/2.4.10/opencv-2.4.10.zip
unzip opencv-2.4.10.zip; cd opencv-2.4.10
mkdir release; cd release
cmake -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_DOCS=ON -DBUILD_EXAMPLES=ON -DBUILD_SHARED_LIBS=ON -DBUILD_PYTHON_SUPPORT=ON -DINSTALL_C_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON -DENABLE_FAST_MATH=ON -DENABLE_SSE=ON -DENABLE_SSE2=ON -DENABLE_SSE3=ON -DENABLE_SSSE3=ON -DENABLE_SSE41=ON -DENABLE_SSE42=ON  -DWITH_TBB=ON -DWITH_GTK=ON -DWITH_OPENGL=ON -DWITH_QT=ON -DWITH_OPENCL=OFF -DWITH_CUDA=OFF -DWITH_OPENNI=ON -DWITH_UNICAP=ON ..
make
sudo make install

cd ~/tmp
wget http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/luna/SR1a/eclipse-cpp-luna-SR1a-linux-gtk-x86_64.tar.gz
cd /opt
tar -zxvf ~/tmp/eclipse-cpp-luna-SR1a-linux-gtk-x86_64.tar.gz

cd ~; sudo rm -rf tmp
sudo apt-get install ubuntu-desktop -y
