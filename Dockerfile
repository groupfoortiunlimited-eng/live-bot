FROM ubuntu:22.04
RUN apt update && apt install -y ffmpeg wget
WORKDIR /app
COPY start.sh .
RUN chmod +x start.sh
CMD ["bash", "start.sh"]
