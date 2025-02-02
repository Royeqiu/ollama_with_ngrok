# 使用官方 Ollama 基础镜像
FROM ollama/ollama:latest

# 确保容器启动时启用 GPU 支持
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility

# 设置默认工作目录
WORKDIR /app

# 运行 Ollama 服务器
CMD ["ollama", "serve"]