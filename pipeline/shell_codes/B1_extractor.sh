PYTHONBIN=python3.8
WORKING_DIR=${PWD}
DATASETS_PATH=${WORKING_DIR}/datasets
DATASET=GangnamStation/B1/release


KPTS=20000 # number of local features to extract

# Extract global features (we will use AP-GeM here)
cd ${WORKING_DIR}/deep-image-retrieval
${PYTHONBIN} -m dirtorch.extract_kapture --kapture-root ${WORKING_DIR}/${DATASET}/map_plus_test/ --checkpoint dirtorch/data/Resnet101-AP-GeM-LM18.pt --gpu 0
# move to right location
mkdir -p ${WORKING_DIR}/${DATASET}/global_features/Resnet101-AP-GeM-LM18/global_features
mv ${WORKING_DIR}/${DATASET}/map_plus_test/reconstruction/global_features/Resnet101-AP-GeM-LM18/* ${WORKING_DIR}/${DATASET}/global_features/Resnet101-AP-GeM-LM18/global_features/
rm -rf ${WORKING_DIR}/${DATASET}/map_plus_test/reconstruction/global_features/Resnet101-AP-GeM-LM18

# Extract local features (we will use R2D2 here)
cd ${WORKING_DIR}/r2d2
${PYTHONBIN} extract_kapture.py --model models/r2d2_WASF_N8_big.pt --kapture-root ${WORKING_DIR}/${DATASET}/map_plus_test/ --min-scale 0.3 --min-size 128 --max-size 9999 --top-k ${KPTS}
# move to right location
mkdir -p ${WORKING_DIR}/${DATASET}/local_features/r2d2_WASF_N8_big/descriptors
mv ${WORKING_DIR}/${DATASET}/map_plus_test/reconstruction/descriptors/r2d2_WASF_N8_big/* ${WORKING_DIR}/${DATASET}/local_features/r2d2_WASF_N8_big/descriptors/
mkdir -p ${WORKING_DIR}/${DATASET}/local_features/r2d2_WASF_N8_big/keypoints
mv ${WORKING_DIR}/${DATASET}/map_plus_test/reconstruction/keypoints/r2d2_WASF_N8_big/* ${WORKING_DIR}/${DATASET}/local_features/r2d2_WASF_N8_big/keypoints/
