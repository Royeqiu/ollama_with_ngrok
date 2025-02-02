# Ollama 快速部署與 ngrok 外部訪問指南

本專案提供一個簡單的方法，使用 Docker Compose 快速部署 Ollama，並透過 ngrok 提供一個對外的網址，無需架設額外的 Proxy 伺服器。

## 目錄

- [前置準備](#前置準備)
- [安裝與設定](#安裝與設定)
- [啟動服務](#啟動服務)
- [測試模型](#測試模型)
- [使用 ngrok 進行外部訪問](#使用-ngrok-進行外部訪問)
- [確認 ngrok 轉發成功](#確認-ngrok-轉發成功)

## 前置準備

在開始之前，請確保您的系統已安裝以下軟體：

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

此外，請註冊一個 [ngrok 帳戶](https://dashboard.ngrok.com/signup) 以取得您的 `NGROK_AUTHTOKEN` 和 `NGROK_DOMAIN`。

## 安裝與設定

1. **編輯 `.env` 檔案**
   
   取得 `NGROK_AUTHTOKEN` 和 `NGROK_DOMAIN` 之後，請編輯專案中的 `.env` 檔案，將對應的值填入：
   
   ```env
   NGROK_AUTHTOKEN=your-ngrok-authtoken
   NGROK_DOMAIN=your-ngrok-domain
   ```
   
   將 `your-ngrok-authtoken` 和 `your-ngrok-domain` 替換為您從 ngrok 儀表板獲取的值。

## 啟動服務

1. **使用 Docker Compose 啟動服務**
   
   在專案目錄中執行以下指令：
   
   ```bash
   docker-compose up -d --build
   ```
   
   這將自動構建並啟動 Ollama 和 ngrok 服務。

## 測試模型

1. **進入 Ollama 容器**
   
   ```bash
   docker exec -it ollama bash
   ```

2. **運行模型**
   
   在容器內，執行以下命令以啟動 `deepseek-r1:7b` 模型：
   
   ```bash
   ollama run deepseek-r1:7b
   ```
   
   您現在可以與模型進行互動，測試其功能。

## 使用 ngrok 進行外部訪問

Docker Compose 已自動啟動 ngrok，並使用 `.env` 檔案中的 `NGROK_DOMAIN` 進行轉發。

## 確認 ngrok 轉發成功

1. **訪問模型標籤 API**
   
   在瀏覽器中輸入以下網址：
   
   ```
   https://your-ngrok-domain/api/tags
   ```
   
   您應該會看到 `deepseek-r1:7b` 模型的標籤，這表示 ngrok 已成功將外部請求轉發至您的本地服務。

## 結論

透過本指南，您已成功使用 Docker Compose 部署 Ollama，並使用 ngrok 提供了一個對外的網址，無需架設額外的 Proxy 伺服器。這使您能夠更方便地與外部世界分享和測試您的模型。

## 📜 授權條款 (License)

本專案採用 MIT 授權 (MIT License)，使用者可自由使用、修改及分發，但需保留原始授權聲明。  
詳見 [LICENSE](LICENSE) 文件。

