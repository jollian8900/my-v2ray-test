FROM alpine:latest

# نصب ابزارهای مورد نیاز
RUN apk add --no-cache ca-certificates curl

# دانلود نسخه سبک v2ray
RUN curl -L https://github.com/v2fly/v2ray-core/releases/download/v5.10.1/v2ray-linux-64.zip -o v2ray.zip && \
    apk add --no-cache unzip && \
    unzip v2ray.zip && \
    rm v2ray.zip

# کپی کردن فایل تنظیمات (که در مرحله بعد می‌سازیم)
COPY config.json /etc/v2ray/config.json

# اجرای برنامه
CMD ["/v2ray/v2ray", "-config", "/etc/v2ray/config.json"]
