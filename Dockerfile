FROM guergeiro/pnpm
VOLUME [ "/docusaurus" ]
COPY entrypoint.sh /entrypoint.sh
RUN pnpm config set registry https://registry.npmmirror.com \
    && pnpm create docusaurus docusaurus-files classic --typescript \
    && cd /docusaurus-files \
    && sed -i 's#"docusaurus start"#"docusaurus start --host 0.0.0.0"#' package.json \
    && chmod +x /entrypoint.sh
EXPOSE 3000
ENTRYPOINT ["/entrypoint.sh"]