# [WCRC_2023](https://zero-base-ds-promotion-datacontest.oopy.io/)
World Creative Robotics Contest 2023
- 분야 : 자율주행
- 주제 : 실내 자율 주행을 위한 Visual Localization 시스템 개발

## Enviornment Setting
```sh
conda create -n wcrc python=3.8 -y
# 추후 수정 필요 : requirements로 압축할 것
conda install -c nvidia cuda-toolkit
# conda install -c anaconda cudnn
pip install -r requirements.txt
```

## Overall Process
```sh
cd pipline/shell_codes
# if you want to run whole pipeline in once, then run following shell command
# sh run_gangnam.sh

# run shell commands step by step
sh download_data.sh
sh B1_data_preprocessing.sh
sh B1_extractor.sh
sh B1_mapping.sh
sh B1_localization.sh
```
--
## TODO
- [ ] shell 스크립트 동작시키면서 경로 수정 필요
- [ ]


---

|팀원|깃허브|
|---|---|
|권민성|[Github](https://github.com/mnseong)|
|박시형|[Github](https://github.com/sihyeong671)|