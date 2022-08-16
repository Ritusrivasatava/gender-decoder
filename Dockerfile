# Use small base miniconda image from official Conda
FROM continuumio/miniconda3:4.12.0

# Set up working directory
RUN mkdir -p "/usr/local/job_ads/"
ENV WORKING_DIR="/usr/local/job_ads"
WORKDIR ${WORKING_DIR}

# Copy all relevant app files
COPY app "${WORKING_DIR}/app/"
COPY scripts "${WORKING_DIR}/scripts/"
COPY python_environment.yml "${WORKING_DIR}/"
COPY data/input/female_applicants_prediction_reference_data.csv "${WORKING_DIR}/data/input/"

# Set up Python environment with Conda
RUN conda update -n base -c defaults conda
RUN conda env create --file python_environment.yml
RUN export PATH=/opt/conda/bin:$PATH

# Make data directory and its sub-directories without copying data
RUN mkdir -p "${WORKING_DIR}/data/"
RUN mkdir -p "${WORKING_DIR}/data/input/"
RUN mkdir -p "${WORKING_DIR}/data/output/"
RUN mkdir -p "${WORKING_DIR}/data/raw/"

# Expose port 8000 in Docker and forward to localhost:80
EXPOSE 80:8000

# Run the API when container starts
CMD conda run --name job_ads uvicorn app.main:gender_decoder_api --host "0.0.0.0" --port 8000
