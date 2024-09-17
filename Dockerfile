FROM alpine:3.20


RUN apk --no-cache --update add firefox firefox-esr dbus-x11 ttf-freefont mesa-dri-gallium mesa-gl vulkan-loader \
    && adduser -S normaluser \
    && echo "user:user" | chpasswd

USER user

ENTRYPOINT ["firefox"]