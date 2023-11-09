PYTHONBIN=python3.8
WORKING_DIR=${PWD}
DATASETS_PATH=${WORKING_DIR}/datasets
DATASET=GangnamStation/B1/release

TOPK=20  # number of retrieved images for mapping and localization

LOCAL=r2d2_WASF_N8_big
GLOBAL=Resnet101-AP-GeM-LM18

../kapture_pipeline_mapping.py -v debug -f \
  -i ${WORKING_DIR}/${DATASET}/mapping \
  -kpt ${WORKING_DIR}/${DATASET}/local_features/${LOCAL}/keypoints \
  -desc ${WORKING_DIR}/${DATASET}/local_features/${LOCAL}/descriptors \
  -gfeat ${WORKING_DIR}/${DATASET}/global_features/${GLOBAL}/global_features \
  -matches ${WORKING_DIR}/${DATASET}/local_features/${LOCAL}/NN_no_gv/matches \
  -matches-gv ${WORKING_DIR}/${DATASET}/local_features/${LOCAL}/NN_colmap_gv/matches \
  --colmap-map ${WORKING_DIR}/${DATASET}/colmap-sfm/${LOCAL}/${GLOBAL} \
  --topk ${TOPK}