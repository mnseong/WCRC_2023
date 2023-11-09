PYTHONBIN=python3.8
WORKING_DIR=${PWD}
DATASETS_PATH=${WORKING_DIR}/datasets
DATASET=GangnamStation/B1/release

# Create temporal mapping and query sets (they will be modified)
mkdir -p ${WORKING_DIR}/${DATASET}/mapping/sensors
cp ${DATASETS_PATH}/${DATASET}/mapping/sensors/*.txt ${WORKING_DIR}/${DATASET}/mapping/sensors/
ln -s ${DATASETS_PATH}/${DATASET}/mapping/sensors/records_data ${WORKING_DIR}/${DATASET}/mapping/sensors/records_data

mkdir -p ${WORKING_DIR}/${DATASET}/test/sensors
cp ${DATASETS_PATH}/${DATASET}/test/sensors/*.txt ${WORKING_DIR}/${DATASET}/test/sensors/
ln -s ${DATASETS_PATH}/${DATASET}/test/sensors/records_data ${WORKING_DIR}/${DATASET}/test/sensors/records_data

# Merge mapping and test kapture (this will make it easier to extract the local and global features and it will be used for the localization step)
kapture_merge.py -v debug -f \
  -i ${WORKING_DIR}/${DATASET}/mapping ${WORKING_DIR}/${DATASET}/test \
  -o ${WORKING_DIR}/${DATASET}/map_plus_test \
  --image_transfer link_relative