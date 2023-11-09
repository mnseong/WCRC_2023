# Define paths
PYTHONBIN=python3.8
WORKING_DIR=${PWD}
DATASETS_PATH=${WORKING_DIR}/datasets
DATASET=GangnamStation
mkdir -p ${DATASETS_PATH}

# Download Gangnam Station image Data
cd ${WORKING_DIR}
git clone https://github.com/naver/deep-image-retrieval.git
cd deep-image-retrieval
mkdir -p dirtorch/data/
cd dirtorch/data/
gdown --id 1r76NLHtJsH-Ybfda4aLkUIoW3EEsi25I # downloads a pre-trained model of AP-GeM
unzip Resnet101-AP-GeM-LM18.pt.zip
rm -rf Resnet101-AP-GeM-LM18.pt.zip

cd ${DATASETS_PATH}
kapture_download_dataset.py --install_path ${DATASETS_PATH} update
for SCENE in B1 B2; do
 kapture_download_dataset.py --install_path ${DATASETS_PATH} install GangnamStation_${SCENE}_release_mapping GangnamStation_${SCENE}_release_test
done
