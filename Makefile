.PHONY: init


ENV_NAME='fabina'
CONDA_RUN=conda run --name ${ENV_NAME}


init:
	@echo "Create environment"
	conda env list | grep -q envs/${ENV_NAME} || conda create --name=${ENV_NAME} python=3.6 -y && \
	conda install --name=${ENV_NAME} --channel=conda-forge --file=environment_ds.yaml -y
	conda install --name=${ENV_NAME} --channel=conda-forge --file=environment_geo.yaml -y
	conda install --name=${ENV_NAME} --channel=conda-forge --file=environment_utils.yaml -y
	${CONDA_RUN} jt -t chesterish
	${CONDA_RUN} pip install --upgrade --no-cache-dir crcmod

