FROM ubuntu:22.04
RUN apt update && apt install -y ffmpeg wget python3-pip
RUN pip3 install flask
WORKDIR /app
COPY . .
RUN chmod +x start.sh
CMD ["python3", "app.py"]
